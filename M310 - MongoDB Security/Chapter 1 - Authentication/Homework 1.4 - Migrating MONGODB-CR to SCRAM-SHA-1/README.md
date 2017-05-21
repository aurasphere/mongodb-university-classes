# Problem
Download Handouts:
 - <a href="https://university.mongodb.com/static/MongoDB_2017_M310_April/handouts/m310-hw-1.4.1231737c1169.zip">m310-hw-1.4.zip</a>

For this lab you are going to migrate a database from using the MONGODB-CR authentication mechanism to SCRAM-SHA-1.

We've provided you with a script that will set up and start a mongod against some MongoDB 2.6 data files that include user data. A user was created on these 2.6 data files, alice, her password is secret. You'll need to copy the files to the shared folder.

    $ cd ~/shared
    $ ./setup-hw-1.4.sh

Once your MongoDB Enterprise 3.2 server is up and running with the 2.6 data files it's your job to migrate the server (and Alice's account) over to SCRAM-SHA-1.

After you've successfully completed the migration you can run the following script and copy the last line of output into the submission area below.

    $ cd ~/shared
    $ ./validate-hw-1.4.sh

<details>
  <summary>Click here for the solution</summary>
    <ul>
      <li>[ "SCRAM-SHA-1" ]</li>
	</ul>
</details>