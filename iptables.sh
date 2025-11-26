sudo apt-get update
sudo apt-get install -y iptables-persistent netfilter-persistent


# Allow SSH on tun0 (VPN interface)
sudo iptables -A INPUT -i tun0 -p tcp --dport 22 -j ACCEPT

# Allow established/related traffic (if not already present)
sudo iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
sudo iptables -A OUTPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

# Allow localhost
sudo iptables -A INPUT -i lo -j ACCEPT
sudo iptables -A OUTPUT -o lo -j ACCEPT

# (Optional) Allow SSH on the main NIC too, if you want direct access
sudo iptables -A INPUT -i enp1s0 -p tcp --dport 22 -j ACCEPT


sudo netfilter-persistent save
sudo systemctl restart netfilter-persistent
