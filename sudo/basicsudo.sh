giturl="https://raw.githubusercontent.com/quxdev/qconfig/main/sudo/"

# Copy basicsudo to /etc/sudoers.d/
echo "$(curl -fsSL $giturl/basicsudo_sudoers)" > /etc/sudoers.d/basicsudo
chmod 440 /etc/sudoers.d/basicsudo

# Add all users to basicsudo
addgroup --system basicsudo;
getent passwd | while IFS=: read -r name password uid gid gecos home shell; do 
  if [[ uid -gt 1000 && uid -lt 2000 ]]; then 
    usermod --append --groups basicsudo ${name};
  fi; 
done;

unset -v giturl
