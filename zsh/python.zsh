# defines the user base directory, which is used to compute the path of the
# user site-packages directory and Distutils installation paths
# packages must be install by using --user flag
export PYTHONUSERBASE=~/packages/python

# augment the default search path for module files
export PYTHONPATH=$PYTHONUSERBASE/lib/python2.7/site-packages:$PYTHONPATH

# expand PATH with installed pip packages
export PATH=$PYTHONUSERBASE/bin:$PATH

