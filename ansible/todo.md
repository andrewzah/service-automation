!
```
[DEPRECATION WARNING]: community.docker.docker_compose has been deprecated. This module uses docker-compose v1, which is End of Life since July 2022. Please 
migrate to community.docker.docker_compose_v2. This feature will be removed from community.docker in version 4.0.0. Deprecation warnings can be disabled by 
setting deprecation_warnings=False in ansible.cfg
```

---

- pushover scripts on every machine
  - ssh login/logout
  - monitoring scripts [e.g. eagle->zfs]

---

- [x] monitoring: telegraf / influx setup
  - [ ] customize-per machine
- [ ] minecraft
  - [ ] server pictures
  - [ ] clean up group_vars / defaults
  - [x] java - openjdk17
- [ ] investigate bootstrapping for ssh keys
- [ ] nfs
  - [ ] exportfs
  - [ ] lxc creation
    - [ ] /eagle mounting
- [ ] router
  - [ ] creds
  - [ ] pf.conf
  - [ ] unbound.conf
  - [ ] dhcpd.conf

https://github.com/Cybolic/docker-imapfilter-isync
