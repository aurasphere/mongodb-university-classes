# Problem
You have a sharded system with three shards and have sharded the collections "students" in the "school" database across those shards. The output of sh.status() when connected to mongos looks like this:
    
    mongos> sh.status()
    --- Sharding Status ---
      sharding version: {
        "_id" : 1,
        "minCompatibleVersion" : 5,
        "currentVersion" : 6,
        "clusterId" : ObjectId("5531512ac723271f602db407")
    }
      shards:
        {  "_id" : "s0",  "host" : "s0/localhost:37017,localhost:37018,localhost:37019" }
        {  "_id" : "s1",  "host" : "s1/localhost:47017,localhost:47018,localhost:47019" }
        {  "_id" : "s2",  "host" : "s2/localhost:57017,localhost:57018,localhost:57019" }
      balancer:
        Currently enabled:  yes
        Currently running:  yes
            Balancer lock taken at Fri Apr 17 2015 14:32:02 GMT-0400 (EDT) by education-iMac-2.local:27017:1429295401:16807:Balancer:1622650073
        Collections with active migrations:
            school.students started at Fri Apr 17 2015 14:32:03 GMT-0400 (EDT)
        Failed balancer rounds in last 5 attempts:  0
        Migration Results for the last 24 hours:
            2 : Success
            1 : Failed with error 'migration already in progress', from s0 to s1
      databases:
        {  "_id" : "admin",  "partitioned" : false,  "primary" : "config" }
        {  "_id" : "school",  "partitioned" : true,  "primary" : "s0" }
            school.students
                shard key: { "student_id" : 1 }
                chunks:
                    s0  1
                    s1  3
                    s2  1
                { "student_id" : { "$minKey" : 1 } } -->> { "student_id" : 0 } on : s2 Timestamp(3, 0)
                { "student_id" : 0 } -->> { "student_id" : 2 } on : s0 Timestamp(3, 1)
                { "student_id" : 2 } -->> { "student_id" : 3497 } on : s1 Timestamp(3, 2)
                { "student_id" : 3497 } -->> { "student_id" : 7778 } on : s1 Timestamp(3, 3)
                { "student_id" : 7778 } -->> { "student_id" : { "$maxKey" : 1 } } on : s1 Timestamp(3, 4)
    
If you ran the query

    use school
    db.students.find({'student_id':2000})

Which shards would be involved in answering the query?

Choose the best answer:
 - s0, s1, and s2
 - s0
 - s1
 - s2

<details>
  <summary>Click here for the solution</summary>
    <ul>
      <li>s1</li>
	</ul>
</details>