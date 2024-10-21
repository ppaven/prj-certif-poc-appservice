'''
First, install the latest release of Python wrapper: $ pip install ovh
'''
import json
import ovh
import os

appkey = os.environ["OVH_APP_KEY"]
appsecret = os.environ["OVH_APP_SECRET"]
conskey = os.environ["OVH_APP_CONSK"]
zoneName= os.environ["OVH_ZONE"]

# Instantiate an OVH Client.
# You can generate new credentials with full access to your account on
# the token creation page (https://api.ovh.com/createToken/index.cgi?GET=/*&PUT=/*&POST=/*&DELETE=/*)
client = ovh.Client(
	endpoint            ='ovh-eu',              # Endpoint of API OVH (List of available endpoints: https://github.com/ovh/python-ovh#2-configure-your-application)
	application_key     =appkey,               # Application Key
	application_secret  =appsecret,            # Application Secret
	consumer_key        =conskey,              # Consumer Key
)

result = client.get("/domain/zone/"+zoneName+"/export")

#  Print and export
print("Création du fichier d'export : "+zoneName+".txt ...")

with open(zoneName+'.txt', 'w') as f:
    print(result, file=f)

print("... Done.")

