# mytestrep

##Setup instruction

Should be installed:

- node
- java
- maven
- appium

###install appium
```
brew install node      # get node.js
npm install -g appium  # get appium
npm install wd         # get appium client     
```
###Run appium for specific port in background

`appium -p 4723 -a 127.0.0.1 &`

###Run tests for specific platform

`mvn test -Dplatform=<platform> -DappPath=<absolute_build_path>`

for ios:

`mvn test -Dplatform=ios -DappPath=<absolute_build_path> -Dtest=ios.*`

for android

`mvn test -Dplatform=android -DappPath=<absolute_build_path> -Dtest=android.*`

run specific test

`mvn test -Dplatform=ios test -DappPath=<absolute_build_path> -Dtest=ios.FindClassesTest`

### Easy way to run test on local machine

1. checkout AppRepo
2. checkout this repo inside AppRepo workingcopy
3. run script

## Run UI tests on CI for branch

`sh run_night_build.sh <branch name>`

e.g run test for develop

`sh run_night_build.sh develop`
