# Problem
For this homework, you will need to use version 3.2 or later of MongoDB.

In a mongo shell run homework.b(). This will run in an infinite loop printing some output as it runs various statements against the server.

We'll now imagine that on this system a user has complained of slowness and we suspect there is a slow operation running. Find the slow operation and terminate it.

In order to do this, you'll want to open a second window (or tab) and there, run a second instance of the mongo shell, with something like:

    $ mongo --shell localhost/performance performance.js

Keep the other shell with homework.b() going while this is happening. Once you have eliminated the slow operation, run (on your second tab):

    homework.c()

and enter the output below. Once you have it right and are ready to move on, ctrl-c (terminate) the shell that is still running the homework.b() function.

Enter answer here:

<details>
  <summary>Click here for the solution</summary>
    <ul>
      <li>12</li>
	</ul>
</details>