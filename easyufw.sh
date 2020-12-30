echo -n "Enter a ip "
read ip
echo -n "Enter the Port: "
read port
echo "Allow or Deny connections from $ip"
select yn in "Allow" "Deny"; do
    case $yn in
        Allow ) ad=allow; break ;;
        Deny  ) ad=deny;  break ;;
    esac
done
echo "TCP or UDP?"
select yn in "TCP" "UDP"; do
    case $yn in
        TCP ) ut=tcp; break ;;
        UDP ) ut=udp; break ;;
    esac
done
sudo ufw $ad from $ip proto $ut to any port $port
