echo -n "Enter a ip "
read ip
echo -n "Enter the Port: "
read port
echo "Allow or Deny connections from $ip to $port"
select yn in "Allow" "Deny"; do
    case $yn in
        Allow ) ad=allow; break ;;
        Deny  ) ad=deny;  break ;;
    esac
done
echo "TCP or UDP?"
select yn in "TCP" "UDP" "BOTH"; do
    case $yn in
        TCP ) ut=tcp; break ;;
        UDP ) ut=udp; break ;;
	BOTH ) ut=both; break;;
    esac
done

if [[ "$ut" == "both" ]]; then
sudo ufw $ad from $ip proto tcp to any port $port;
sudo ufw $ad from $ip proto udp to any port $port;
echo "Will $ad from $ip:$port on both TCP and UDP"
elif [[ "$ut" == "tcp" ]]; then
sudo ufw $ad from $ip proto $ut to any port $port;
echo "Will $ad $ut $ip:$port "
elif [[ "$ut" == "udp" ]]; then
sudo ufw $ad from $ip proto $ut to any port $port;
echo "Will $ad $ut $ip:$port"
fi

