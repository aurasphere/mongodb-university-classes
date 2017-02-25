#Problem
Download Handouts:
 - <a href="https://university.mongodb.com/static/MongoDB_2017_M201_February/handouts/people.a74d7de502b1.json">people.json</a>

Welcome to your first lab in M201! In this lab you're going to install MongoDB Enterprise 3.4 and import the people dataset.

While MongoDB Enterprise is available as part of the MongoDB Enterprise Advanced subscription it's permitted to be ran outside of production environments.

In order to install MongoDB you're going to need to head over to our online documentation and follow the <a href="https://docs.mongodb.com/manual/administration/install-enterprise/?_ga=1.97552155.566621725.1483393028">instructions on installing MongoDB</a>.

After you've successfully installed MongoDB you should start a standalone server. Once your sever is up and running you should be able to download the people.json handout and import it with mongoimport. Make sure to import the documents into the *m201* database and the *people* collection.

To confirm that you've successfully completed these steps run the following query on the *m201* database from the mongo shell and paste it's output into the submission area below:

    > db.people.findOne({ "email" : "fcamacho@gmail.com" })
	
<details>
  <summary>Click here for the solution</summary>
  - {
        "_id" : ObjectId("57d7a135fa937f710a7d6c62"),
        "last_name" : "Webster",
        "quote" : "Reiciendis consectetur ad quibusdam animi deleniti.",
        "job" : "Geophysicist/field seismologist",
        "ssn" : "543-27-2503",
        "address" : {
                "city" : "Lindsayton",
                "street" : "9764 Brianna View Suite 628",
                "zip" : "24521"
        },
        "first_name" : "James",
        "company_id" : ObjectId("57d7a135fa937f710a7d6c54"),
        "employer" : "Vasquez, Watson and Ross",
        "birthday" : ISODate("2010-03-10T16:54:58Z"),
        "email" : "fcamacho@gmail.com"
    }
</details>