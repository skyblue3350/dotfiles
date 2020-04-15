# dotfiles

- WSL
```
$ sudo apt update
$ sudo apt install -y ansible
$ ansible-playbook ansible/wsl.yml
```

- Mac
```
$ xcode --install
$ git clone [this repo]
$ ./scripts/brew.sh
$ ansible-playbook ansible/mac.yml
```