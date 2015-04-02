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
echo $versionCode
versionCode=$((versionCode+1))
echo $versionCode
echo $versionKey=$versionCode > "app/version.properties"

}

build(){
    ./gradlew assembleRelease
}

echo 'start building android'
incrementVersion
echo 'stop building android'
