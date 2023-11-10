function devup
  get_ip

  if test $ip_address = null
    echo "Instance not started, starting instance..."
    aws ec2 start-instances --instance-ids i-07884ad40ea9456ce --profile sandbox
    sleep 10
    get_ip
  end

  mkdir -p ~/.ssh/config.d
  echo -e "Host aws\n  HostName $ip_address\n  IdentityFile ~/.ssh/jknight-dev.pem\n  User ubuntu" > ~/.ssh/config.d/aws

  echo "SSHing into instance"
  ssh aws
end

function devdown
  aws ec2 stop-instances --instance-ids i-07884ad40ea9456ce --profile sandbox
end

function get_ip
  set -g ip_address (aws ec2 describe-instances --instance-ids i-07884ad40ea9456ce --output json --profile sandbox |
          jq -r '.Reservations[].Instances[].PublicIpAddress')
  echo "Instance up at $ip_address"
end
