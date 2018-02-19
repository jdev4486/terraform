# Terraform Repo

## Installation Procedure for Linux

- Step 1: Download Terraform using this [link](https://www.terraform.io/downloads.html)

- Step 2: Install Terraform by unziping the download

- Step 3: [Configure Path Variables](https://stackoverflow.com/questions/14637979/how-to-permanently-set-path-on-linux-unix)

```
         vi ~/.profile or ~/.bashrc
         export PATH=$PATH:/path/to/dir
         cd /usr/bin
         sudo ln -s /path/to/binary terraform
         source ~/.profile or source ~/.bashrc
```


## Verify Terraform Installation

```
~/terraform$ terraform --version
Terraform v0.11.3
```
