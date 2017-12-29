# Problem
Download Handouts:
 - <a href="https://university.mongodb.com/static/MongoDB_2017_M102_October/handouts/replication.js">replication.js</a>

In this chapter's homework we will create a replica set and add some data to it.

1. Download the replication.js handout.
2. We will create a three member replica set. Pick a root working directory to work in. Go to that directory in a console window.

Given we will have three members in the set, and three mongod processes, create three data directories:

    mkdir 1
    mkdir 2
    mkdir 3

3. We will now start a single mongod as a standalone server. Given that we will have three mongod processes on our single test server, we will explicitly specify the port numbers (this wouldn't be necessary if we had three real machines or three virtual machines). We'll also use the --smallfiles parameter and --oplogSize so the files are small given we have a lot of server processes running on our test PC.

    # starting as a standalone server for problem 1:
    mongod --dbpath 1 --port 27001 --smallfiles --oplogSize 50

Note: for all mongod startups in the homework this chapter, you can optionally use --logPath, --logappend, and --fork. Or, since this is just an exercise on a local PC, you could simply have a separate terminal window for all and forgo those settings. Run "mongod --help" for more info on those.

4. In a separate terminal window (cmd.exe on Windows), run the mongo shell with the replication.js file:

    mongo --port 27001 --shell replication.js

Then run in the shell:

    homework.init()

This will load a small amount of test data into the database.

Now run:

    homework.a()

and enter the result. This will simply confirm all the above happened ok.

Enter answer here:

<details>
  <summary>Click here for the solution</summary>
    <ul>
      <li>5001</li>
	</ul>
</details>