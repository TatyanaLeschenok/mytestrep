build(){
    /.gradlew assembleRelease crashlyticsUploadDistributionRelease
}

echo 'start building android'
build
echo 'stop building android'