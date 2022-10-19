## setup
```
cd ./ansible
python3 -m venv .venv
source ./.venv/bin/activate

pip install ansible docker
ansible-galaxy collection install amazon.aws ansible.posix community.postgresql community.mysql
```

## further reading
* https://docs.ansible.com/ansible/latest/collections/ansible/builtin/file_module.html
* https://docs.ansible.com/ansible/latest/collections/community/docker/docker_compose_module.html
* https://github.com/rossmcdonald/telegraf/blob/master/tasks/install-debian.yml
* https://jpmens.net/2020/09/29/using-ansible-managed/
* [ansible docker](https://github.com/geerlingguy/ansible-role-docker)
* https://www.athmer.org/post/2019/ansible-cache-password/
