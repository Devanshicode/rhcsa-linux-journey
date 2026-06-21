
# Thinking Questions & My Understanding

## 1. ping works but curl to port 80 fails. Name every possible cause in order from most likely to least likely. This is the actual troubleshooting ladder.

When I first learned networking, I thought that if `ping` worked then the website should also work. Then I understood that `ping` and `curl` test completely different things. `ping` only proves that the target machine is reachable on the network, while `curl` proves that a specific application is accepting connections on a specific port.

The first thing I would check is whether the web server is actually running. If nginx or Apache is stopped, `ping` will still work because the operating system is alive. Next, I would check whether the application is listening on port 80 using commands like `ss` or `lsof`. After that, I would check the firewall because the service may be running but the port may be blocked. Then I would verify the correct IP address and DNS resolution. Finally, I would investigate routing issues, SELinux policies, reverse proxies, or application misconfigurations.

The important lesson is that troubleshooting should follow a ladder. Start with the simplest and most likely causes before investigating rare problems. Good administrators do not guess; they eliminate possibilities one step at a time.

---

## 2. SSH key vs password — a 4096-bit RSA key would take longer than the universe to brute-force. Why can't the same be said for a strong password?

When I first heard that SSH keys are more secure than passwords, I assumed it was only because people choose weak passwords. Then I understood that the difference is much deeper than that.

A password is something humans must remember and type. Even a strong password is usually limited by human convenience. People reuse passwords, choose predictable patterns, or make small variations of existing passwords. SSH keys are different because they are generated mathematically and contain enormous amounts of randomness that humans never need to remember.

A 4096-bit RSA key is so large that brute-forcing it is practically impossible with current technology. Even if a person creates a very strong password, it still exists within a much smaller search space compared to a cryptographic key. This is why cloud providers such as AWS strongly encourage key-based authentication for servers instead of password-based logins.

The lesson is that security should rely on mathematics rather than human memory whenever possible.

---

## 3. firewall-cmd --permanent adds rules permanently but they only apply after --reload. What happens if you forget --reload?

When I first saw the `--permanent` option, I assumed the rule became active immediately. Then I understood that firewalld actually maintains two configurations: the running configuration and the permanent configuration.

When I add a rule using `--permanent`, the rule is only written to disk. The running firewall continues using its current configuration until I execute `firewall-cmd --reload`. If I forget to reload, the new rule exists in the permanent configuration but is not actually protecting or allowing traffic yet.

A real-world example would be opening port 8080 for a web application. I might think users can access the application because I added the rule, but connections still fail because the running firewall has not loaded the new configuration. The opposite can also happen when removing a rule: I think a port is blocked, but it remains open until reload occurs.

The lesson is that configuration changes and active changes are not always the same thing. Administrators must ensure changes are both saved and applied.

---

## 4. AWS Security Groups are stateful — if you allow inbound on port 80, outbound responses are automatic. Linux firewalld with --state=ESTABLISHED does the same. Why does stateful matter?

When I first learned about stateful firewalls, I thought they were simply a convenience feature. Then I understood that they solve a fundamental networking problem.

When a user connects to a web server on port 80, the server must send responses back to the user. A stateless firewall would require separate rules for both directions of communication. This quickly becomes complicated and difficult to manage. A stateful firewall remembers that a connection was already established and automatically allows the return traffic.

A real-world analogy is a security guard at an office building. If a visitor is approved to enter, the guard does not stop them every time they walk back through the same door while leaving. The guard remembers that the visitor already has an approved session. Stateful firewalls work in a similar way by tracking connection states.

This is why AWS Security Groups and Linux firewalld use stateful behavior. It reduces administrative complexity, improves usability, and allows legitimate traffic to flow without creating hundreds of unnecessary firewall rules. The lesson is that modern networking depends not only on filtering traffic but also on understanding the context of a connection.
