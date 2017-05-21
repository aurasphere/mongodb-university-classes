# Problem
Download Handouts:
 - <a href="https://university.mongodb.com/static/MongoDB_2017_M310_April/handouts/m310-hw-1.3.5fd5cd84b3d8.zip">m310-hw-1.3.zip</a>
 - <a href="https://university.mongodb.com/static/MongoDB_2017_M310_April/handouts/m310-certs.28553cfecccb.zip">m310-certs.zip</a>

In this lab you are going to start your own replica set with internal authentication enabled using X.509 certificates.

We have provided you with the necessary certificates via the handout.

Your task is to create a three member replica set that uses X.509 certificates for internal authentication. Below are the settings you should use for your replica set. Failure to comply with these parameters will result in incorrect results.

    Type	Primary	Secondary	Secondary
    Port	31130	31131	31132
    DBPath	~/M310-HW-1.3/r0	~/M310-HW-1.3/r1	~/M310-HW-1.3/r2
    LogPath	~/M310-HW-1.3/r0/mongodb.log	~/M310-HW-1.3/r1/mongodb.log	~/M310-HW-1.3/r2/mongodb.log

Make sure to copy the certs folder directly to the m310-vagrant-env/shared folder. If the certificates are not in this location then your results will be incorrect. When SSHed into the VM your home file structure should look similar to this:

    ~
    `-- shared
        |-- certs
        |   |-- ca.pem
        |   |-- client.pem
        |   `-- server.pem
        `-- validate-hw-1.3.sh

After you have setup your replica set with internal authentication using X.509 certificates, create a user on the admin database with the root role for the client.pem certificate.

After creating your user run the following script and copy the output into the submission area below.

When you set up your replica set make sure that you use the fully qualified domain name (FQDN) when initiating the replica set. Failing to do so will prevent the validation script from working properly. All of the homework should be completed with Vagrant, so the FQDN will be database.m310.mongodb.university.

    $ cd ~/shared
    $ ./validate-hw-1.3.sh

Note: If you've successfully enabled authentication on the replica set, then the validation script should output a JSON object with two keys: unauthorizedStatus and memberStatuses. The first key confirms that authentication is enabled, and the second verifies that all members are still up and running.

<details>
  <summary>Click here for the solution</summary>
    <ul>
      <li>{ unauthorizedStatus: { "ok" : 0, "errmsg" : "not authorized on admin to execute command { replSetGetStatus: 1.0 }", "code" : 13 }, memberStatuses: ["PRIMARY","SECONDARY","SECONDARY"] }</li>
	</ul>
</details>