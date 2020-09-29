
#!/bin/bash

The script is intended to demostrate how to replace the preshared keys in the vars.tf which should not be in the vars.tf because of the sensitive nature.

 if [ "$#" -lt  "8" ]
   then
     echo "Not Enough arguments supplied, minimum is 8 !"
 else

#cleanup
# delete the old vars.tf
rm vars.tf

#Create a new vars.tf from vars.original - only for developpers.
#using a Jenkins pipeline this is not needed - the pipeline will clone the vars.tf from BB all the time.

cp vars.original vars.tf

#simple string replace in the vars.tf

    sed -i 's/VPN1_tunnel1_preshared_key/'$1'/g' vars.tf
    sed -i 's/VPN1_tunnel2_preshared_key/'$2'/g' vars.tf 
    sed -i 's/VPN2_tunnel1_preshared_key/'$3'/g' vars.tf
    sed -i 's/VPN2_tunnel2_preshared_key/'$4'/g' vars.tf 
    sed -i 's/VPN3_tunnel1_preshared_key/'$5'/g' vars.tf
    sed -i 's/VPN3_tunnel2_preshared_key/'$6'/g' vars.tf 
    sed -i 's/VPN4_tunnel1_preshared_key/'$7'/g' vars.tf
    sed -i 's/VPN4_tunnel2_preshared_key/'$8'/g' vars.tf 


fi
# When the strings are in place