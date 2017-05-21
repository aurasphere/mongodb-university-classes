# Problem
In this first homework exercise we would like for you to demonstrate that you are able to get a standalone server up and running with authentication enabled.

Let's bring up our Vagrant machine, available as part of the lesson handouts.

    $ cd m310-vagrant-env
    $ vagrant up
    $ vagrant ssh database

For this exercise we want you to perform the following set of tasks:

 - Launch mongod with no authentication enabled
 
 - Create user alice with password secret on admin database and role root
 
 - Relaunch mongod with authentication enabled
 
 - Run command

    db.runCommand({getParameter: 1, authenticationMechanisms: 1})

Which of the following statements will successfully run the above command on the standalone server that you've set up?

Check all that apply:
 - mongo admin -u alice -p secret --eval "db.runCommand({getParameter: 1, authenticationMechanisms: 1})"
 - mongo --eval "db.runCommand({getParameter: 1, authenticationMechanisms: 1})"
 - mongo -u alice -p secret --eval "db.runCommand({getParameter: 1, authenticationMechanisms: 1})"
 - mongo -u alice -p secret --eval "db.runCommand({getParameter: 1, authenticationMechanisms: 1})" --authenticationDatabase admin
 - mongo admin --eval "db.auth('alice', 'secret');db.runCommand({getParameter: 1, authenticationMechanisms: 1})"
 - mongo -u alice -p secret --eval "db=db.getSisterDB('admin');db.runCommand({getParameter: 1, authenticationMechanisms: 1})" --authenticationDatabase admin

<details>
  <summary>Click here for the solution</summary>
    <ul>
      <li>mongo admin -u alice -p secret --eval "db.runCommand({getParameter: 1, authenticationMechanisms: 1})"</li>
	  <li>mongo admin --eval "db.auth('alice', 'secret');db.runCommand({getParameter: 1, authenticationMechanisms: 1})"</li>
      <li>mongo -u alice -p secret --eval "db=db.getSisterDB('admin');db.runCommand({getParameter: 1, authenticationMechanisms: 1})" --authenticationDatabase admin</li>
	</ul>
</details>