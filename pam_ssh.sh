echo "auth       optional     pam_ssh.so        try_first_pass" | sudo -a tee /etc/pam.d/login
echo "session    optional     pam_ssh.so" | sudo -a tee /etc/pam.d/login

