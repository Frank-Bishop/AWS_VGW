
#!/bin/bash

The script is intended to demostrate how to replace the preshared keys in the vars.tf which should not be in the vars.tf because of the sensitive nature.

#The presharedkeys can be accesible securely via REST API from the orchestrator 

# Example to get the list of presharedkeys and VPN parameters from the orchestrator:
# curl -d @request.json -H "Content-Type: application/json"   -H "Accept: application/json" http://hostname:8082/workflow/actions?=get_allocations
#the output will be a JSON
# After the JSON parsing, we can extract the tunnel_key1 and tunnel_key2 for each VPN connection.
#

 if [ "$#" -lt  "8" ]
   then
     echo "Not Enough arguments supplied, minimum is 8 !"
 else

#cleanup
# delete the old vars.tf
rm vars.tf

#Create a new vars.tf from vars.original - only for developpers.
#using a Jenkins pipeline this is not needed - the pipeline will clone the terraform files  - including the vars.tf from BB all the time.

cp vars.original vars.tf

#simple string replace in the vars.tf, 
#example: the SED will replace the "VPN1_tunnel1_preshared_key" string to the user input ($1) string in the vars.tf 
#    sed -i 's/VPN1_tunnel1_preshared_key/'$1'/g' vars.tf

#vpn1_tunnel1 and vpn1_tunnel2 keys:
    sed -i 's/VPN1_tunnel1_preshared_key/'$1'/g' vars.tf
    sed -i 's/VPN1_tunnel2_preshared_key/'$2'/g' vars.tf 

#vpn2_tunnel1 and vpn2_tunnel2 keys:
    sed -i 's/VPN2_tunnel1_preshared_key/'$3'/g' vars.tf
    sed -i 's/VPN2_tunnel2_preshared_key/'$4'/g' vars.tf

#vpn3_tunnel1 and vpn3_tunnel2 keys: 
    sed -i 's/VPN3_tunnel1_preshared_key/'$5'/g' vars.tf
    sed -i 's/VPN3_tunnel2_preshared_key/'$6'/g' vars.tf

#vpn4_tunnel1 and vpn4_tunnel2 keys: 
    sed -i 's/VPN4_tunnel1_preshared_key/'$7'/g' vars.tf
    sed -i 's/VPN4_tunnel2_preshared_key/'$8'/g' vars.tf 


fi
# When the strings are in place