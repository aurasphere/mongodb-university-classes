# Problem
Download Handouts:
 - <a href="https://university.mongodb.com/static/MongoDB_2017_M310_April/handouts/m310-hw-2.6.04aea00b1d09.zip">m310-hw-2.6.zip</a>
 - <a href="https://university.mongodb.com/static/MongoDB_2017_M310_April/handouts/m310-certs.28553cfecccb.zip">m310-certs.zip</a>

This homework assignment builds directly off of the previous exercise. In the previous homework you transformed a running replica set from using an unencrypted storage engine to an encrypted one. You did this using a local keyfile as your external master key.

This time around you're going to set up a standalone server with storage engine encryption enabled. The difference this time being that you're going to use a third party key management appliance via the Key Management Interoperability Protocol (KMIP).

This method for storing the master key is highly recommended over using a keyfile. This is because a KMIP solution makes it easy to perform key rotation.

For this homework we're going to use PyKMIP as our key management appliance.

You're first going to want to connect to the infrastructure VM and install PyKMIP. The setup script is in the handout. You'll need to copy it to the shared folder.

    $ vagrant ssh infrastructure
    $ cd ~/shared
    $ ./setup-hw-2.6.sh

After you've installed PyKMIP you can then run the KMIP server on the infrastructure VM.

    $ python pykmip_server.py

Note: In order for the server to work you'll need to have your certificates in side of ~/shared/certs like so:

    ~
    `-- shared
        |-- certs
        |   |-- ca.pem
        |   |-- client.pem
        |   `-- server.pem
        |-- setup-hw-2.6.sh
        `-- validate-hw-2.6.sh

Once you have the KMIP server up and running on the infrastructure VM you'll then need to open up another shell to the database VM and you'll have to figure out how to make MongoDB and PyKMIP communicate. You'll want to run your mongod on port 31260.

After you've successfully enabled storage engine encryption with PyKMIP you can run the validation script and copy the output into the submission area below.

    $ cd ~/shared
    $ ./validate-hw-2.6.sh

<details>
  <summary>Click here for the solution</summary>
    <ul>
      <li>{isEnabled: true, usingKMIP: true}</li>
	</ul>
</details>