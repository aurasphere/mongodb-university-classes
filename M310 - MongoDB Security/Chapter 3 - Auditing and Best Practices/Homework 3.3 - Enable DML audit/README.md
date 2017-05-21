# Problem
Download Handouts:
 - <a href="https://university.mongodb.com/static/MongoDB_2017_M310_April/handouts/m310-hw-3.3.40104a754719.zip">m310-hw-3.3.zip</a>

Like the two last exercises, in this homework you're going to spin up a replica set with auditing enabled on each of the members. However, this time you're going to enable the auditing of CRUD operations.

Your replica set should be running on the following ports and should should output their logs in JSON to the following locations:

    Type	Primary	Secondary	Secondary
    Port	31330	31331	31332
    Audit Log	~/M310-HW-3.3/r0/auditLog.json	~/M310-HW-3.3/r1/auditLog.json	~/M310-HW-3.3/r2/auditLog.json

You need to figure out how to audit CRUD operations, as well as all of the default operations. You shouldn't need to make an auditFilter to accomplish this task.

Once you have your replica set up and running with CRUD auditing enabled, you can run the validation script and copy the output into the submission area below.

    $ cd ~/shared
    $ ./validate-hw-3.3.sh

<details>
  <summary>Click here for the solution</summary>
    <ul>
      <li>{ numMembers: 3, auditLog: 1 }</li>
    </ul>
</details>