# Problem
Download Handouts:
 - <a href="https://university.mongodb.com/static/MongoDB_2017_M310_April/handouts/m310-hw-3.1.938737900306.zip">m310-hw-3.1.zip</a>
 
For this homework exercise, you're going to spin up a replica set with auditing enabled on each of the members.

Your replica set should be running on the following ports and should should output their logs in JSON to the following locations:

    Type	Primary	Secondary	Secondary
    Port	31310	31311	31312
    Audit Log	~/M310-HW-3.1/r0/auditLog.json	~/M310-HW-3.1/r1/auditLog.json	~/M310-HW-3.1/r2/auditLog.json

Once you have your replica set up and running with auditing enabled you can run the validation script and copy the output into the submission area below.

    $ cd ~/shared
    $ ./validate-hw-3.1.sh

 <details>
  <summary>Click here for the solution</summary>
    <ul>
      <li>{ numMembers: 3, auditLog: 1 }</li>
    </ul>
</details>