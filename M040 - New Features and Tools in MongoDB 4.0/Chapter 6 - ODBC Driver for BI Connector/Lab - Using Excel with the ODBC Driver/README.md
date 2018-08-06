### Chapter 6: ODBC Driver for BI Connector
# Using Excel with the ODBC Driver

## Problem:

Note: This lab uses Microsoft Excel. If you do not have a license to use MS Excel, you can open the handout in an open-source alternative.

Well, now that we've discussed the new features in the BI Connector, it's time to try them out! Using the new ODBC Driver, we can import data directly into a Microsoft Excel spreadsheet.

Below are the instructions to do so; you may choose not to use Vagrant, in which case the "Inside Vagrant" steps should be completed on your host machine:

### Inside Vagrant...

 1. Start up a replica set with three nodes.
 2. Import the dataset /dataset/companies.json into the replica set.
 3. Start up a mongosqld process with the following flags (mongosqld has been loaded into Vagrant as an executable, and can be run by typing mongosqld from the command line):
 
   - Use the --addr option to bind it to the IP address 192.168.40.100 (this is necessary in order for the ODBC driver to communicate with the BI Connector while the BIC is running inside Vagrant!)
   - Use the --mongo-uri option to specify the replica set (this must be a valid URI string that specifies the entire replica set - read the docs if you need a refresher!)

### On your host machine...

 4. If you are using a Linux machine, download iODBC and the companies.json.tgz dataset file.
 5. Open the ODBC Manager and add a new "System DSN" with the MongoDB UNICODE ODBC and following keywords (your keywords may be different if you change the port where mongosqld is running, or the database of the companies dataset):

   - SERVER: 192.168.40.100
   - PORT: 3307
   - DATABASE: m040
   
 6. Download the Microsoft Excel handout - there should be a sheet called company_calculations with two columns, and a sheet called companies which is empty
 7. In the empty sheet called companies, import the data from the companies collection. Do not change any of this data; just return all of the data to the sheet.
 
The Excel sheet companies should now contain all the data from the companies dataset. In order to check that you imported all the data correctly, look at the sheet company_calculations - the "Size of Largest Company" column should now contain the number of employees at the biggest company in each industry.

If you accidentally delete the companies sheet, re-download the handout and reimport the data from MongoDB into Excel.

## Question:

How many employees work at the biggest company in the advertising industry?

Enter answer here:

<details>
  <summary>Click here for the solution</summary>
    <ul>
      <li>3160</li>
    </ul>
</details>