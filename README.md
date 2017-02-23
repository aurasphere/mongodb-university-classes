# MongoDB University 
Courseware and solutions of problems from MongoDB University's classes that I've attended.

This repository is organized into different folders. Each folder represents a class that I've attended at MongoDB University. Each class  directory will contain a directory for each week of duration (each one with a different topic) plus one with the final exam and its solution. In each week folder you will find the following:

 - A zip file with the week's handouts and other courseware material.
 - A batch and a shell script called setup_db which will import the databases/collections used for the weekly exercises. In order to work, this script assumes that you already have a MongoDB instance running on localhost and that you have the MongoDB bin folder on system path and that the handouts zip has been unzipped on the same folder of the script.
 - A folder for each homework of the week. This folder will contain a README file with the problem statement and, if the solution requires the use of the Mongo shell, a javascript file with the query used (you can test it by passing the javascript file as an argument when opening the Mongo shell).
