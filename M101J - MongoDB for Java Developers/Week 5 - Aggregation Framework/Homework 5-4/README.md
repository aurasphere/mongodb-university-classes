# Problem
Download Handouts:
 - <a href="https://university.mongodb.com/static/MongoDB_2017_M101J_January/handouts/zips__code_data_sample_zip_52efe2cae2d423438505544e.4854d69c2ac3.json"> zips__code_data_sample_zip_52efe2cae2d423438505544e.json</a>

*Removing Rural Residents*
In this problem you will calculate the number of people who live in a zip code in the US where the city starts with a digit. We will take that to mean they don't really live in a city. Once again, you will be using the zip code collection, which you will find in the 'handouts' link in this page. Import it into your mongod using the following command from the command line:

    mongoimport --drop -d test -c zips zips.json
	
Note

This is raw data from the United States Postal Service. If you notice that while importing, there are a few duplicates fear not, this is expected and will not affect your answer.

If you imported it correctly, you can go to the test database in the mongo shell and conform that

    > db.zips.count()

yields 29,467 documents.
	
The project operator can extract the first digit from any field. For example, to extract the first digit from the city field, you could write this query:

    db.zips.aggregate([
        {$project:
         {
        first_char: {$substr : ["$city",0,1]},
         }
       }
    ])
	
Using the aggregation framework, calculate the sum total of people who are living in a zip code where the city starts with a digit. Choose the answer below.

You will need to probably change your projection to send more info through than just that first character. Also, you will need a filtering step to get rid of all documents where the city does not start with a digital (0-9).

Choose the best answer:
 - 298015
 - 345232
 - 245987
 - 312893
 - 158249
 - 543282

<details>
  <summary>Click here for the solution</summary>
  - 298015
</details>