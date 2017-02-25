#Problem
Download Handouts:
 - <a href="https://university.mongodb.com/static/MongoDB_2017_M101J_January/handouts/create_blog_authors__mongoproc_hw2.3_m101j_version_52d46451e2d423570a05ba43.bf8f3b53573e.zip">create_blog_authors__mongoproc_hw2.3_m101j_version_52d46451e2d423570a05ba43.zip</a>

##Homework: Homework 2.4 (MongoProc)

This is a mongoProc problem. If you have any difficulty using MongoProc, here are <a href="http://www.youtube.com/playlist?list=PL4RCxklHWZ9vb8rR55iKEffkY-5GhCGvC">Two video lectures</a> showing how to set it up.

Download Mongoproc clients from <a href="https://university.mongodb.com/mongoproc">here</a> if you haven't done so, yet.

Also, download the handout from the Download Handout link above, and unpack.

This is the beginning of the blog project with the UI for creating and logging in blog authors. You will not yet be building functionality for displaying posts. Don't worry, that will come later.

In the handout is a pom.xml file that describes the project. If you are using IntelliJ, you can import the blog project using this file.

The project roughly follows the model/view/controller paradigm. BlogController.java is the controller and the model. The templates comprise the view. Here is a description of the directories and files.

    /src/main/java/course - contains source code
    /src/main/resources/freemarker - contains templates
    run.sh - the mvn command that starts it running if you don't want to use an IDE

If everything is working properly, you should be able to start the blog by typing either:

    mvn compile exec:java -Dexec.mainClass=course.BlogController

or:

    bash run.sh

If you goto http://localhost:8082 , you should see a message, this is a placeholder for the blog

Here are some URLs that must work when you are done.

    http://localhost:8082/signup
    http://localhost:8082/login
    http://localhost:8082/logout

When you login or sign-up, the blog will redirect to:

    http://localhost:8082/welcome

and that must work properly, welcoming the user by username.

We have removed four Java statements from UserDAO and marked the areas where you need to work with XXX. You should not need to touch any other code. The java statements that you are going to add will add a new user upon sign-up and validate a login by retrieving the right user document.

The blog stores its data in the blog database in two collections, users and sessions. Here are two example docs for a username 'erlichson' with password 'fubar'. You can insert these specific documents if you like, but you shouldn't need to.

    > db.users.find()
    { "_id" : "erlichson", "password" : "VH9IFu+/vUNSKTzZsFZEOsK1,-1924261330" }
    >
    > db.sessions.find()
    { "_id" : "AN4M7warH+fdKOszU8qnd2Hmfn8JZFFZ9sff4zcPRpw=", "username" : "erlichson" }
    >
	
Once you have the the project working, the following steps should work:

 - go to http://localhost:8082/signup
 - create a user

It should redirect you to the welcome page and say welcome username, where username is the user you signed up with. Now:

 - Goto http://localhost:8082/logout
 - Now login http://localhost:8082/login.

Ok, now it's time to validate that you got it all working.

From the top of this page, there was one additional program that should have been downloaded: mongoProc.

With it, you can test your code and look at the Feedback section. When it says "user creation successful" and "user login successful", you can Turn in your assignment.

You will see a message below about your number of submissions, but you must submit this assignment using MongoProc.

Tip: Be sure to go to settings in mongoProc, and point mongod1 to your mongod (probably localhost:27017), and web1 to your web url (probably localhost:8082)