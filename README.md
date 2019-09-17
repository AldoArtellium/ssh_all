# ssh_all

SSH all ips in hosts file and execute mousecircle.sh
tout les fichiers sont dans /etc/ansible

pour créer le fichier hosts avec ceux qui ont un port 22 ouvert
```bash
$ echo -e "[all:vars]\nansible_connection=ssh\nansible_user=test\nansible_ssh_pass=test\n\n[a]\n" > hosts && sudo nmap -sS -O -p22 10.XXX.1-253.1 | awk '/is up/ {print up}; {gsub (/\(|\)/,""); up = $NF}' >> hosts 
```

pour executer le playbook il faut se mettre dans le dossier `/etc/ansible/playbook`
```bash
$ ansible-playbook test.yml
```
