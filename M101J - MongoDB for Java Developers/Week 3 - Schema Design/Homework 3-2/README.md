Download Handouts:
 - <a href="https://university.mongodb.com/static/MongoDB_2017_M101J_January/handouts/blog-accepting-posts-and-comments-m101j.7f288e767a21.zip">blog-accepting-posts-and-comments-m101j.zip</a>

##Homework: Homework 3.2 (MongoProc)

*Making your blog accept posts*

In this homework you will be enhancing the blog project to insert entries into the posts collection. After this, the blog will work. It will allow you to add blog posts with a title, body and tags and have it be added to the posts collection properly.

We have provided the code that creates users and allows you to login (the assignment from last week). To get started, please download blog.zip from the Download Handout link and unpack. You will be using these file for this homework and for homework 3.3.

The areas where you need to add code are marked with "XXX". You need only touch the BlogPostDAO class. There are three locations for you to add code for this problem. Scan that file for XXX to see where to work.

Here is an example of valid blog post:

    > db.posts.find().pretty()
    {
        "_id" : ObjectId("513d396da0ee6e58987bae74"),
        "title" : "Martians to use MongoDB",
        "author" : "andrew",
        "body" : "Representatives from the planet Mars announced today that the planet would adopt MongoDB as a planetary standard. Head Martian Flipblip said that MongoDB was the perfect tool to store the diversity of life that exists on Mars.",
        "permalink" : "martians_to_use_mongodb",
        "tags" : [
            "martians",
            "seti",
            "nosql",
            "worlddomination"
        ],
        "comments" : [ ],
        "date" : ISODate("2013-03-11T01:54:53.692Z")
    }
	
*Note:* You must add at least one post like the one above to the posts collection before running the blog.

As a reminder, to run your blog you type:

    mvn compile exec:java -Dexec.mainClass=course.BlogController

Or, use an IDE to run it.

To play with the blog you can navigate to the following URLs:

    http://localhost:8082/
    http://localhost:8082/signup
    http://localhost:8082/login
    http://localhost:8082/newpost

Ok, now it's time to validate that you got it all working using MongoProc. To do that, locate this problem in the homework browser pane in MongoProc. When you believe you have solved the problem correctly, test your solution using the "Test" button. When you see confirmation that you have completed the assignment successfully in the feedback window, you can Turn in your assignment.

You will see a message below about your number of submissions at the bottom of this page, but you must submit this assignment using MongoProc.

Tip: Be sure to go to settings in mongoProc, and point mongod1 to your mongod (probably localhost:27017), and web1 to your web url (probably localhost:8082)