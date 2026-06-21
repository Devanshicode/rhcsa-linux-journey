# Task 8 – Passwordless SSH, Firewall Testing and Network Troubleshooting











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

























