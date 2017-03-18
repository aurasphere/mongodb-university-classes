#Problem
Download Handouts:
 - <a href="https://university.mongodb.com/static/MongoDB_2017_M123_March/handouts/city_inspections.f0f8f35a43e9.zip>city_inspections.zip</a>
 
Now let's load some data into our cluster. First, in the "Security" tab, create a new user called testuser for readWrite on the test database. Next, download the handout for this lab and unzip the dataset it contains. Finally, use mongoimport to load this dataset into our cluster using a command similar to the following.

    mongoimport --drop --host PRIMARY_HOSTNAME --port 27017 --ssl --username testuser --password PASSWORD --authenticationDatabase admin -d test -c inspections city_inspections.json
	
Note that this command assumes that the city_inspections.json file is in the current directory. Please replace PRIMARY_HOSTNAME and PASSWORD with the appropriate values based on the cluster connection string and the pasword you created for testuser when typing this command for yourself.

Once import completes, please answer the following question. Assuming you issued the mongoimport command correctly, how many documents were imported into the test.inspections collection? When you have successfully completed this lab, please terminate your cluster.

Choose the best answer:
 - 76016
 - 78113
 - 79334
 - 80000
 - 81047
 - 82334
 - 84171
 - 85238
 - 90134
 - 99875

<details>
  <summary>Click here for the solution</summary>
  -	81047
</details>