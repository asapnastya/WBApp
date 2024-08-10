MODULE="Modules/MeowFactsAPI/Sources/MeowFactsAPI/"

openapi-generator generate -i "meowapi.yaml" -g swift5 -o "meowapi"
rm -r $MODULE""*
cp -R "meowapi/OpenAPIClient/Classes/OpenAPIs/". $MODULE
rm -r "meowapi"
