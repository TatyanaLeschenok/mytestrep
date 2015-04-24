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
    echo $nameKey=$APP_VERSION_NAME >> "app/version.properties"
}

setupFabricNotifications(){
touch "app/group_aliases.txt"
echo  "batat-group" > "app/group_aliases.txt"
}

setupFabricReleaseNotes(){
batat="10.0"
releaseName="release $batat"

echo $releaseName

notesFilePath='release_notes.txt'

rm notesFilePath

git log -n 1 --pretty=format:'%s' > $notesFilePath

#mergeDate=$(git log -n 1 --merges --pretty=format:'%ct')
#git log --since=$mergeDate --pretty=format:'%s' > $notesFilePath

echo 'release 1.0\n' | cat - $notesFilePath > temp && mv temp $notesFilePath

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
setupFabricReleaseNotes
#incrementVersion
#setupFabricNotifications
#setBuildVersion
#buildDebug
#commitNewVersion
echo 'stop building android'
