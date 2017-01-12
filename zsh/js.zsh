# NPM packages in homedir. Must be use with "npm install -g"
# echo "prefix = $NPM_PACKAGES" >> ~/.npmrc
NPM_PACKAGES=~/packages/js

# FIXME: This does not work!
NPM_CONFIG_PREFIX=$NPM_PACKAGES

# Tell our environment about user-installed node tools
PATH=$NPM_PACKAGES/bin:$PATH

# Tell Node about these packages
NODE_PATH=$NPM_PACKAGES/lib/node_modules:$NODE_PATH
