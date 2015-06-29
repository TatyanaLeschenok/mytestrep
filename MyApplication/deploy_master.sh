incrementVersion()
{
echo 'increment build version'
file="app/version.properties"
versionKey="VERSION_CODE"

while IFS="=" read -r key value; do
case "$key" in
$versionKey) versionCode="$value" ;
esac
done < "$file"
echo 'old version' $versionCode
versionCode=$((versionCode+1))
echo 'new version' $versionCode
echo $versionKey=$versionCode > "app/version.properties"

}



setBuildVersion(){
CIRCLE_SHA1
    versionKey="VERSION_CODE"
    nameKey="VERSION_NAME"
    touch "app/version.properties"
    echo $versionKey=$APP_VERSION_CODE > "app/version.properties"
    echo $nameKey=$APP_VERSION_NAME ($CIRCLE_BUILD_NUM) >> "app/version.properties"
}

setupFabricNotifications(){
touch "app/group_aliases.txt"
echo  "batat-group" > "app/group_aliases.txt"
}

buildDebug(){
echo 'upload debug build to Fabric'
    ./gradlew assembleDebug crashlyticsUploadDistributionDebug
    cp -r app/build/outputs/apk/* $CIRCLE_ARTIFACTS
}

commitNewVersion(){
echo $CIRCLE_USERNAME
echo $CIRCLE_USEREMAIL
git config user.name "circlecibot"
git config user.email "circlecibot@abc.com"
git config --global push.default simple
git add app/version.properties
git commit -m 'update build version [ci skip]'
git push
}

echo 'start building android'
#incrementVersion
setupFabricNotifications
setBuildVersion
buildDebug
#commitNewVersion
echo 'stop building android'
