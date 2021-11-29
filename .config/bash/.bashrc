# ENVIRONMENT VARIABLES
if [ -f .env ]; then
  export $(echo $(cat $HOME/.env | sed 's/#.*//g'| xargs) | envsubst)
fi

# PATH EXPANSION
if [ -f $HOME/.config/bash/path ]; then
	export PATH="$(cat $HOME/.config/bash/path | envsubst | sed -E -e '/^#.*$/ d' -e '/^[[:space:]]?$/ d' | tr '\n' ':')$PATH"
fi
