# Problem
Download Handouts:
 - <a href="https://university.mongodb.com/static/MongoDB_2017_M123_March/handouts/final-exam-mongodump.565c8138f13f.zip">final-exam-mongodump.zip</a>
 
Download and unpack the handout. When you do, you will find that it contains a directory called final-exam-mongodump. You will need to mongorestore it to an Atlas cluster, where it will put a single document into the messages collection of the finalExam database.

You may find the following example string useful when connecting to your instance:

    mongorestore --host HOSTNAME --port 37017 --authenticationDatabase admin --ssl --username USERNAME --password PASSWORD final-exam-mongodump/

The value of the messages field will be a string. Please input the string below. Be sure to include the quotation marks around the string, but no other part of the document. For instance, if the document were:

    { "_id" : "message-from-will", "message" : "This is the correct answer." }

then you would input:

    "This is the correct answer."

Please input your answer below.

<details>
  <summary>Click here for the solution</summary>
  - "Keep up the good work!"
</details>