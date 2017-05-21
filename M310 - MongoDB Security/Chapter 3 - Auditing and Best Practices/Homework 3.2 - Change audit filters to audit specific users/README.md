# Problem
Download Handouts:
 - <a href="https://university.mongodb.com/static/MongoDB_2017_M310_April/handouts/m310-hw-3.2.806eecab5f8a.zip">m310-hw-3.2.zip</a>

Like the last exercise, for this homework you're going to spin up a replica set with auditing enabled on each of the members. However, this time you're also going to define an audit filter.

Your replica set should be running on the following ports and should should output their logs in JSON to the following locations:

    Type	Primary	Secondary	Secondary
    Port	31320	31321	31322
    Audit Log	~/M310-HW-3.2/r0/auditLog.json	~/M310-HW-3.2/r1/auditLog.json	~/M310-HW-3.2/r2/auditLog.json

This time around, instead of auditing, all of the default events you're going to define an audit filter that will only audit events initiated by a user.

You will need to create an account for steve on the admin database with a password of secret and a role of root.

Your audit filter should only audit operations that are performed by steve.

Once you have your replica set up and running, with auditing enabled and your audit filter correctly specified, you can run the validation script and copy the output into the submission area below. The output should be a JSON document with three keys.

    $ cd ~/shared
    $ ./validate-hw-3.2.sh

<details>
  <summary>Click here for the solution</summary>
    <ul>
      <li>{ numMembers: 3, auditLog1: 1, auditLog2: 0 }</li>
    </ul>
</details>