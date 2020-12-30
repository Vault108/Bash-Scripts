echo -n "Allow or Deny: "
read ad
echo -n "Enter an ip to $ad: "
read ip
echo -n "udp or tcp:"
read ut
echo -n "Enter the Port: "
read port
sudo ufw $ad from $ip proto $ut to any port $port


