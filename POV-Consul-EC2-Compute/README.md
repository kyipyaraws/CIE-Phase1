watch "lsof -i -P | grep dashboard "



chmod 600 kyi-ssh-key.pem
terraform output -raw private_key_pem > kyi-ssh-key.pem
chmod 400 kyi-ssh-key.pem
cat kyi-ssh-key.pem

ssh -i kyi-ssh-key.pem ubuntu@52.76.250.141

scp -i kyi-ssh-key.pem dashboard-service aws-master-admin@52.76.250.141:~/

ssh -i kyi-ssh-key.pem ubuntu@52.76.250.141
chmod +x dashboard-service