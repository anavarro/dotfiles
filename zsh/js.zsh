# NPM packages in homedir. Must be use with "npm install -g"
NPM_PACKAGES=~/packages/js

# Tell our environment about user-installed node tools
PATH=$NPM_PACKAGES/bin:$PATH

# Tell Node about these packages
NODE_PATH=$NPM_PACKAGES/lib/node_modules:$NODE_PATH
