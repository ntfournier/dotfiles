
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

## RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

## NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
nvm use stable

## Android SDK
export ANDROID_HOME="/home/ntfournier/Applications/android-sdk-linux/"
export PATH=$PATH:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools

## Gradle
export GRADLE_HOME="/home/ntfournier/Applications/gradle-3.2.1/"
export PATH=$PATH:$GRADLE_HOME/bin

## Chrome
export PATH=$PATH:/home/ntfournier/Applications/depot_tools

## IntelliJ Idea
export PATH=$PATH:/home/ntfournier/Applications/idea/bin

## Java
export JAVA_HOME="/usr/lib/jvm/java-8-oracle"
