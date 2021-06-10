# Deploy Dependencies Graph on kubernetes with Ansible

## Prerequisite
- [vs code](https://code.visualstudio.com/)
- [Remote - Containers plugin](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
- [kubernetes server](https://github.com/xclemence/k3s-raspberry-ansible)
- ssh certificate for server(runner) connection

## Execute
- check group_vars/all.yml
- update inventory/hosts.ini
- run command:

```console
ansible-playbook site.yml -i inventory/hosts.ini
```