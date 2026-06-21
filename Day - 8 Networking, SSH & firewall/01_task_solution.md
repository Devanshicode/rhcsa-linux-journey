# Task 8 – Passwordless SSH, Firewall Testing and Network Troubleshooting





<img width="1280" height="800" alt="task 8 1" src="https://github.com/user-attachments/assets/3792e159-e6b1-4656-ad52-69bd41a06df6" />







## Objective

Set up passwordless SSH between two VMs (or localhost). Open port 8080 in firewall. Start Python HTTP server on 8080. curl from second VM — should work. Block port 8080 — curl should fail. The Python server is still running but unreachable. Prove this with ss and lsof. Write the difference in your thinking_questions.md.

---

## Commands Used

### Generate SSH Key

```bash
ssh-keygen -t rsa
```

Creates a public/private SSH key pair.

---

### Configure Passwordless SSH

```bash
ssh-copy-id devanshibarbhaya@localhost
```

Copies the public key to the authorized keys file.

---

### Verify Passwordless Login

```bash
ssh devanshibarbhaya@localhost
```

Logs in without requiring a password.

---

### Open Port 8080

Ubuntu:

```bash
sudo ufw allow 8080/tcp
```

RHEL/Rocky:

```bash
sudo firewall-cmd --permanent --add-port=8080/tcp
sudo firewall-cmd --reload
```

Allows incoming traffic on TCP port 8080.

---

### Start Python Web Server

```bash
python3 -m http.server 8080
```

Starts a simple HTTP server listening on port 8080.

---

### Verify Connectivity

```bash
curl http://localhost:8080
```

Confirms the web server responds successfully.

---

### Block Port 8080

Ubuntu:

```bash
sudo ufw deny 8080/tcp
```

RHEL/Rocky:

```bash
sudo firewall-cmd --permanent --remove-port=8080/tcp
sudo firewall-cmd --reload
```

Blocks network access to the service.

---

### Verify Failure

```bash
curl http://localhost:8080
```

Connection fails because the firewall blocks access.

---

### Prove Service Is Still Running

```bash
ss -tulnp | grep 8080
```

Shows port 8080 is still listening.

```bash
sudo lsof -i :8080
```

Shows the Python process owns port 8080.

---

## Key Learning


At first I thought that if a service is running, anyone on the network should be able to access it. After setting up passwordless SSH and starting the Python HTTP server on port 8080, the connection worked perfectly from the second VM using curl. Then I opened and closed the port through the firewall and realized that the firewall controls network access independently of the application itself. Even though the web server process never stopped, clients could no longer reach it once the firewall rule blocked the port.

Another thing I noticed was that when curl started failing, my first assumption was that the Python server had crashed. To verify it, I checked with ss and lsof and found that the process was still listening on port 8080. The problem was not the application but the network path created by the firewall rules. This helped me understand the difference between an application-level issue and a network-level issue.

This is very similar to real cloud and enterprise environments. On AWS, Azure, or in large MNC data centers, services may be healthy and running, but users still cannot access them because of Security Groups, Network ACLs, firewalls, or blocked ports. Engineers often use tools like ss, lsof, netstat, and curl to determine whether the problem is with the service itself or with network access. Learning to separate these two types of failures is an important troubleshooting skill for production systems.























