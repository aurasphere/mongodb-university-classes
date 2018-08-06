### Chapter 0: An Introduction to the MongoDB 4.0 Release
# Lab: Start Up a Replica Set

## Problem:

In this lab you will be setting up a MongoDB version 4.0 Replica Set.

Ensure you have the latest version of MongoDB 4.0 installed. If you are using the provided Vagrant environment, this step is already done for you.

If you chose to complete the course outside of Vagrant on your local machine you can download MongoDB 4.0 from the [MongoDB Download Center](https://www.mongodb.com/download-center#enterprise).

The lab instructions are separated into 3 blocks.

If you are running the lab in Vagrant (recommended), follow the directions under the VAGRANT section.
If you are running the lab locally in a Unix environment (OSX/LINUX), follow the directions under the UNIX section.
If you are running the lab locally in Windows and not using the Vagrant environment, follow the directions under the WINDOWS section.

### WINDOWS

 1. Start up 3 mongod processes

        mongod --version
        db version v4.0.#######

Now download and unzip the environment_setup.zip handout. There should be 3 configuration files for Windows: rs1_win.conf, rs2_win.conf, and rs3_win.conf.

Now, open a cmd window and run the following commands from the environment_setup directory:

    md c:\university\m040\repl\1
    md c:\university\m040\repl\2
    md c:\university\m040\repl\3
    
    mongod -f rs1_win.conf
    mongod -f rs2_win.conf
    mongod -f rs3_win.conf

 2. Initiate the Replica Set
 
Now it's time to initiate the replica set:

    mongo --eval 'rs.initiate()'

Once the RS is initiated, we can add the remaining two nodes to the set:

    # you can find your hostname by executing
    mongo --eval "hostname();"
    mongo --eval 'rs.add("<YOUR_HOSTNAME>:27027");rs.add("<YOUR_HOSTNAME>:27037")'

### UNIX

 1. Start up 3 mongod processes
 
Download and unzip the environment_setup.zip handout. From your host machine, copy the Linux configuration files to the environment shared directory, so they are accessible from within the Virtual Machine:

    mkdir -p ~/university/m040/shared
    cd ~/Downloads
    unzip -d environment_setup environment_setup.zip
    cd environment_setup
    cp rs*linux.conf ~/university/m040/shared
    cp validate_lab1.js ~/university/m040/shared
    cd ~/university/m040/shared

And now we can create our data directories with mkdir and start up three mongod processes:

    mkdir -p /data/db/m040/repl/{1,2,3}
    
    mongod -f ~/university/m040/shared/rs1_linux.conf
    mongod -f ~/university/m040/shared/rs2_linux.conf
    mongod -f ~/university/m040/shared/rs3_linux.conf

 2. Initiate the Replica Set
 
Now it's time to initiate the replica set:

    mongo --eval 'rs.initiate()'

Once the RS is initiated, we can add the remaining two nodes to the set:

    # you can find your hostname with the following
    mongo --eval "rs.add('$(hostname):27027');rs.add('$(hostname):27037')"
    mongo --eval 'rs.status()'

### VAGRANT

 1. Start up 3 mongod processes
 
If you are using the course Vagrant environment, exit Vagrant for a moment:

    logout

Now download and unzip the environment_setup.zip handout. From your host machine, copy the Linux configuration files to the environment shared directory, so they are accessible from within the Virtual Machine:

    cd environment_setup
    cp rs*linux.conf ~/university/m040/m040-vagrant-env/shared
    cp validate_lab1.js ~/university/m040/m040-vagrant-env/shared

Now re-enter Vagrant:

    vagrant ssh

And now we can create our data directories with mkdir and start up three mongod processes:

    mkdir -p /data/db/m040/repl/{1,2,3}
    
    mongod -f /shared/rs1_linux.conf
    mongod -f /shared/rs2_linux.conf
    mongod -f /shared/rs3_linux.conf

 2. Initiate the Replica Set

Now it's time to initiate the replica set:

    mongo --eval 'rs.initiate()'

Once the RS is initiated, we can add the remaining two nodes to the set:

    mongo --eval 'rs.add("m040:27027");rs.add("m040:27037")'
    mongo --eval 'rs.status()'

## Validate Lab

To make sure you have setup the cluster correctly, run the validation script:

    mongo --quiet validate_lab1.js

If you use the Vagrant environment, don't forget to first copy the script into the shared directory, to make it visible inside Vagrant:

    cp validate_lab1.js ~/university/m040/m040-vagrant-env/shared
    cd  ~/university/m040/m040-vagrant-env
    vagrant ssh
    mongo --quiet /shared/validate_lab1.js

Enter the validation code provided by this script to complete the lab:

<details>
  <summary>Click here for the solution</summary>
    <ul>
      <li>1602589782</li>
    </ul>
</details>
