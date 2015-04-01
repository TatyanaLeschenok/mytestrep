build(){
    ./gradlew assembleRelease crashlyticsUploadDistributionDebug
}

echo 'start building android'
build
echo 'stop building android'
