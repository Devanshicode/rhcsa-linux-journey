
# Groupp - 1 Networking & Remote Access Commands







| Command                     | What it does                                       | When I use it                                                |
| --------------------------- | -------------------------------------------------- | ------------------------------------------------------------ |
| `ip addr show`              | Shows network interfaces and IP addresses          | When I need to find my IP address or verify interface status |
| `ping -c 4 8.8.8.8`         | Tests network connectivity by sending 4 packets    | When I want to verify internet access                        |
| `ss -tnp`                   | Shows active TCP connections and related processes | When troubleshooting network connections or services         |
| `wget -O file URL`          | Downloads a file and saves it with a chosen name   | When downloading files, scripts, or datasets                 |
| `ssh-keygen -t rsa -b 4096` | Generates a secure SSH key pair                    | When setting up passwordless login or GitHub/AWS access      |
| `nmcli con show`            | Displays saved NetworkManager connections          | When checking or managing network configurations             |







# Group - 2 Network Troubleshooting & Remote Access Commands








| Command                    | What it does                                             | When I use it                                  |
| -------------------------- | -------------------------------------------------------- | ---------------------------------------------- |
| `firewall-cmd --list-all`  | Displays firewall configuration, open ports and services | When checking what traffic is allowed          |
| `firewall-cmd --reload`    | Reloads firewall rules                                   | After changing firewall settings               |
| `ip route show`            | Displays routing table and default gateway               | When troubleshooting network connectivity      |
| `traceroute google.com`    | Shows path packets take to destination                   | When investigating latency or network failures |
| `curl -I https://site.com` | Fetches only HTTP headers from a website                 | When checking if a website is reachable        |
| `ssh user@host`            | Connects securely to a remote Linux machine              | When managing servers remotely                 |





# Group - 3 Linux Networking & Remote Access Management










| Command                                        | What It Does                                           | When I Use It                                          |
| ---------------------------------------------- | ------------------------------------------------------ | ------------------------------------------------------ |
| `ssh-copy-id user@host`                        | Copies SSH key to remote server for passwordless login | When setting up secure remote access                   |
| `hostnamectl set-hostname webserver`           | Changes system hostname                                | When naming or identifying a server                    |
| `firewall-cmd --add-port=8080/tcp --permanent` | Opens TCP port 8080 permanently                        | When an application needs network access               |
| `ip link set eth0 up`                          | Enables network interface                              | When bringing network back online                      |
| `ip link set eth0 down`                        | Disables network interface                             | When testing outages or troubleshooting                |
| `ss -tuln`                                     | Shows listening TCP/UDP ports                          | When checking which services are accepting connections |







# Group - 4 Linux Networking, Remote Access & Firewall Commands










| Command                           | What It Does                                                            | When I Use It                                 |
| --------------------------------- | ----------------------------------------------------------------------- | --------------------------------------------- |
| `curl -o /tmp/f URL`              | Downloads content from a URL and saves it to a file                     | Download files, scripts, APIs, packages       |
| `ssh -i key.pem user@host`        | Connects securely to a remote Linux server using SSH key authentication | AWS EC2, cloud servers, remote administration |
| `scp file user@host:/path`        | Securely copies files to a remote server using SSH                      | Upload files, backups, logs, project files    |
| `dig domain.com`                  | Provides detailed DNS information for a domain                          | DNS troubleshooting and diagnostics           |
| `nslookup domain.com`             | Performs a quick DNS lookup and shows IP address                        | Quick DNS verification                        |
| `firewall-cmd --add-service=http` | Opens HTTP traffic through the firewall                                 | Hosting websites and web applications         |
















