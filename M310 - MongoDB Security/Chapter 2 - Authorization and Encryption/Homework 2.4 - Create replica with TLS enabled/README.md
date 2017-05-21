# Problem
Download Handouts:
 - <a href="https://university.mongodb.com/static/MongoDB_2017_M310_April/handouts/m310-certs.28553cfecccb.zip">m310-certs.zip</a>
 - <a href="https://university.mongodb.com/static/MongoDB_2017_M310_April/handouts/m310-hw-2.4.d8893581490f.zip">m310-hw-2.4.zip</a>

By now you should be very comfortable spinning up replica sets in various configurations. For this homework you're going to spin up a replica set that requires all connections to use TLS.

Your replica set should be running on the following ports:

    Type	Primary	Secondary	Secondary
    Port	31240	31241	31242

Make sure to copy the certs folder directly to the m310-vagrant-env/shared folder. If the certificates are not in this location then your results will be incorrect. When SSHed into the VM your home file structure should look similar to this:

    ~
    `-- shared
        |-- certs
        |   |-- ca.pem
        |   |-- client.pem
        |   `-- server.pem
        `-- validate-hw-2.4.sh

Once you have your servers up and running go ahead connect to the member running on port 31240. From there you should be able to initiate your replica set and add the remaining members.

You can then run the validation script and copy the output into the submission area below.

    $ cd ~/shared
    $ ./validate-hw-2.4.sh

<details>
  <summary>Click here for the solution</summary>
    <ul>
      <li>{"numMembers":3}</li>
	</ul>
</details>