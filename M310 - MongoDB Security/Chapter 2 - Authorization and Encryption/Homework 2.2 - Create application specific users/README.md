# Problem
Download Handouts:
 - <a href="https://university.mongodb.com/static/MongoDB_2017_M310_April/handouts/m310-hw-2.2.3b89a04ed7b7.zip">m310-hw-2.2.zip</a>

Now that we have seen how to create users with different roles we will expand our understanding and see how to create application users whose privileges are for designated resources.

For this homework you are going to create users whose roles are scoped to a specific database.

Your replica set should be running on the following ports:

    Type	Primary	Secondary	Secondary
    Port	31220	31221	31222

Your replica set should have authentication enabled using a shared keyfile.

After you have your members up and running you can connect to the mongod running on port 31220. Once connected create the following users:

    User	Password	Role	Db	Authentication db
    admin	webscale	root	admin	admin
    reader	books	read	acme	admin
    writer	typewriter	readWrite	acme	admin

Make sure that at some point you initiate the replica set and add all the members.

After you've created the users and set up the replica set you can run the validation script and copy the output into the submission area below.

    $ cd ~/shared
    $ ./validate-hw-2.2.sh

<details>
  <summary>Click here for the solution</summary>
    <ul>
      <li>{
 "users":
  [
   {"user":"admin","roles":[{"role":"root","db":"admin"}]},
   {"user":"reader","roles":[{"role":"read","db":"acme"}]},
   {"user":"writer","roles":[{"role":"readWrite","db":"acme"}]}
  ],
 "numMembers":3
}</li>
	</ul>
</details>