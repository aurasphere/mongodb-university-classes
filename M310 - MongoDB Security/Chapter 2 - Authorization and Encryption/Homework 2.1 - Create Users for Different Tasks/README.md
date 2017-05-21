# Problem
Download Handouts:
 - <a href="https://university.mongodb.com/static/MongoDB_2017_M310_April/handouts/m310-hw-2.1.ce0c4824ed46.zip">m310-hw-2.1.zip</a>

For this homework exercise you're going to spin up a replica set and create some users with different roles based on the different tasks that each user needs to be able to perform.

Your replica set should be running on the following ports:

    Type	Primary	Secondary	Secondary
    Port	31210	31211	31212

Your replica set should have authentication enabled using a shared keyfile.

After you have your members up and running you can connect to the mongod running on port 31210. Once connected create the following users:

    User	Password	Can	Cannot
    userAdmin	badges	create users on any database	run dbhash
    sysAdmin	cables	configure a replica set and add shards	run hostInfo
    dbAdmin	collections	create a collection on any database	run insert
    dataLoader	dumpin	insert data on any database	run validate

The Can column denotes tasks that the user should be able to complete. The Cannot column denotes tasks that the user shouldn't have the privileges to complete. Your goal is to figure out which built-in role best suits the needs of each user.

All of these user's roles should be scoped to the admin database.

Note: You should assume that these privileges only extend to non-system collections. If you find a role that seems to fit these requirements, but find an action in the Cannot column being applied to a system collection you should continue to use that role.

After you've created the sysAdmin user you can authenticate against that user and add the other running members to the replica set.

Once you have your replica set up and running with authentication enabled and have all 4 users created with the appropriate roles you can run the validation script and copy the output into the submission area below.

    $ cd ~/shared
    $ ./validate-hw-2.1.sh

<details>
  <summary>Click here for the solution</summary>
    <ul>
      <li>{"users":
 [
  {"user":"dataLoader","roles":[{"role":"readWriteAnyDatabase","db":"admin"}]},
  {"user":"dbAdmin","roles":[{"role":"dbAdminAnyDatabase","db":"admin"}]},
  {"user":"sysAdmin","roles":[{"role":"clusterManager","db":"admin"}]},
  {"user":"userAdmin","roles":[{"role":"userAdminAnyDatabase","db":"admin"}]}
 ],
 "numMembers":3
}</li>
	</ul>
</details>