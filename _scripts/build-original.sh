#!/bin/bash
#
# This script builds the FieldTrip bugzilla

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$PATH:$HOME/.rvm/rubies/ruby-2.6.0/bin"
export PATH="$PATH:$HOME/.rvm/gems/ruby-2.6.0/bin"
export GEM_PATH="$HOME/.rvm/gems/ruby-2.6.0:$HOME/.rvm/gems/ruby-2.6.0@global"
export GEM_HOME="$HOME/.rvm/gems/ruby-2.6.0"

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
rvm use 3.0

# this runs from a cron-job, so paths are not set as in an interactive terminal
BUNDLE=$HOME/.rvm/rubies/ruby-2.6.0/bin/bundle
GIT=/usr/bin/git
CP=/usr/bin/cp

cd $HOME/bugzilla

LOCKFILE=$HOME/bugzilla.lock
LOGFILE=$HOME/bugzilla.log

# prevent concurrent builds
while [ -e $LOCKFILE ] ; do
  LOCKTIME=$(( $(date +"%s") - $(stat -c "%Y" $LOCKFILE) ))
  if [ "$LOCKTIME" -gt "300" ]; then
    echo removing stale lock
    rm $LOCKFILE
  else
    echo waiting for previous build to complete
    sleep 10
  fi
done

# make sure that these exist
[ -e $LOGFILE  ] || touch $LOGFILE
[ -e $LOCKFILE ] || touch $LOCKFILE

# ensure that we have the latest version of the repository
# let's hope there are no conflicts with the reference documentation
$GIT pull > /dev/null 2>&1

# compare the latest to the previous version
PREVIOUS=$(cat $LOGFILE)
LATEST=$(git log -1 --format=%H)

if [ "$LATEST" != "$PREVIOUS" ] ; then

echo building bugzilla version $LATEST
echo $LATEST > $LOGFILE

export JEKYLL_ENV=production
$BUNDLE install           # > /dev/null 2>&1
$BUNDLE exec jekyll build # > /dev/null 2>&1

# copy the large assets that are not in the repository to the released site
# $CP assets/root/* _site/

fi

# remove the lock
rm $LOCKFILE
