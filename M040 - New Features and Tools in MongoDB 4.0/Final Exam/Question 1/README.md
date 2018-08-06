### Final Exam
# Final Exam: Replica Set Transactions

## Problem:

Consider the following set of operations executing in the mongo shell:

    use m040
    db.a.insert({_id: 1})
    s1 = db.getMongo().startSession()
    s2 = db.getMongo().startSession()
    s1.startTransaction()
    s2.startTransaction()
    s1.getDatabase("m040").a.find()
    s2.getDatabase("m040").a.find()
    s1.getDatabase("m040").a.update({_id:1}, {$set: {value: "s1"}})
    s1.getDatabase("m040").a.find() // line 10
    s2.getDatabase("m040").a.find() // line 11
    s2.getDatabase("m040").a.update({_id:1}, {$set: {value: "s2"}})
    s1.getDatabase("m040").a.find()
    s2.getDatabase("m040").a.find()
    s1.abortTransaction()
    s2.abortTransaction()
    s1.getDatabase("m040").a.find()
    s2.getDatabase("m040").a.find() // line 18

Which of the following is/are true?

Check all answers that apply:

 - The output of line 18 is
   {
     _id: 1,
     value: "s1"
   }
 - WriteConflict occurs on line 12
 - The output of line 11 is
   {
     _id: 1,
     value: "s2"
   }
 - The output of line 10 is
   {
     _id: 1,
     value: "s1"
   }

<details>
  <summary>Click here for the solution</summary>
    <ul>
      <li>WriteConflict occurs on line 12</li>
	  <li>The output of line 10 is
      {
        _id: 1,
        value: "s1"
      }</li>
    </ul>
</details>