# aws-admin
AWS servers administration and key management made simple (for OS level support only)

### Install

* Download and run install.sh

``` bash
wget https://github.com/sayanarijit/aws-admin/archive/master.zip
unzip master.zip
cd aws-admin-master && sudo ./install.sh
```

* You should get an output like below

```
Created group 'aws-admins'

'aws-ssh' -> '/opt/aws-admin/bin/aws-ssh'

SUCCESS: Successfully installed aws-admin

NOTE: Only members of 'aws-admins' group will be able to see and modify files under '/opt/aws-admin'

LET'S GET STARTED: 1. Kindly copy all keys inside '/opt/aws-admin/database/keys' directory with owner as 'root' and '400' permission
                   2. Add '/opt/aws-admin/bin' directory to 'root' user's PATH variable ('export PATH=/opt/aws-admin/bin:$PATH')
                   3. Give people permission to run 'sudo aws-ssh' ('%aws-admins ALL = /opt/aws-admin/bin/aws-ssh') in sudoers file
                   4. Run 'sudo aws-ssh <hostname>' to find and map the appropriate key for <hostname> in database
                   NOTE: For 1st time login to any server, it may take some time find the appropriate key
```

* Follow the instructions in "LET'S GET STARTED" section.

### How to create exception list of servers

* To create exception list of servers, create a file inside 'ignored' directory with any name
* In that file, the first line will start with '\*' followed by exception message to be displayed
* Following first line, enter the hostnames to be excluded line by line
* For different exceptions, seperate files can be created inside 'ignored' directory
* Below is a demo exception file
```

* Use your own login credentials with simple ssh command to log into this server

server1
server2
server3
server4
```
