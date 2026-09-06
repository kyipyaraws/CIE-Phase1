watch "lsof -i -P | grep dashboard "
-- remove old know_hosts

ssh-keygen -f '/home/kyipyar/.ssh/known_hosts' -R '54.179.199.198'


chmod 600 kyi-ssh-key.pem
terraform output -raw private_key_pem > kyi-ssh-key.pem
chmod 400 kyi-ssh-key.pem
cat kyi-ssh-key.pem

scp -i kyi-ssh-key.pem counting-service ubuntu@10.0.20.177:~/

ssh -i kyi-ssh-key.pem ubuntu@54.179.199.198

chmod +x dashboard-service

PORT=8888 nohup ./dashboard-service > dashboard.log 2>&1 &


------------------

scp -i kyi-ssh-key.pem -o ProxyCommand="ssh -i kyi-ssh-key.pem -W %h:%p ubuntu@54.179.199.198" counting-service ubuntu@10.0.20.177:~/
ssh -i kyi-ssh-key.pem -o ProxyCommand="ssh -i kyi-ssh-key.pem -W %h:%p ubuntu@54.179.199.198" ubuntu@10.0.20.177



--------------------

PORT=8888 COUNTING_SERVICE_URL="http://10.0.20.177:9001" nohup ./dashboard-service > dashboard.log 2>&1 &
ps aux | grep dashboard-service