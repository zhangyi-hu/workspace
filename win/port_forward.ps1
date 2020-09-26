# set port forwarding to wsl2
# need to change excecution policy first by running
# Set-ExecutionPolicy RemoteSigned

# all the ports you want to forward
$ports=@(2222,2223,80,443,2376);
# allow inbound traffic from this remote address
$remoteAddr='192.168.1.160';

# get the ip address of wsl2 as forward destination
$ipinfo = bash.exe -c "ifconfig eth0 | grep 'inet '"
$found = $ipinfo -match '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}';

if( $found ){
  $forwardAddr = $matches[0];
  echo "will forward ports to $forwardAddr";
} else{
  echo "The Script Exited, the ip address of WSL 2 cannot be found";
  exit;
}


# remove Firewall Exception Rules
iex "Remove-NetFireWallRule -DisplayName 'WSL 2 Firewall Unlock' ";

# add rules for inbound traffic
$ports_a = $ports -join ",";
iex "New-NetFireWallRule -DisplayName 'WSL 2 Firewall Unlock' -Direction Inbound -RemoteAddress $remoteAddr  -LocalPort $ports_a -Action Allow -Protocol TCP";


# add forward rules
$all='0.0.0.0';

for( $i = 0; $i -lt $ports.length; $i++ ){
  $port = $ports[$i];
  echo "setting port-forarding at port $port";
  iex "netsh interface portproxy delete v4tov4 listenport=$port listenaddress=$all";
  iex "netsh interface portproxy add v4tov4 listenport=$port listenaddress=$all connectport=$port connectaddress=$forwardAddr";
}
