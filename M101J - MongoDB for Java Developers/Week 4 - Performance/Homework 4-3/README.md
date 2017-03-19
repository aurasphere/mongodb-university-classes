# Problem
Download Handouts:
 - <a href="https://university.mongodb.com/static/MongoDB_2017_M101J_January/handouts/m101j-blog-indexes.14f2dcc030f8.zip">m101j-blog-indexes.zip</a>

##Homework: Homework 4.3 (MongoProc)

*Making the Blog fast*
Please download hw4-3.zip from the Download Handout link to get started. This assignment requires MongoDB 2.2 or above.

In this homework assignment you will be adding some indexes to the post collection to make the blog fast.

We have provided the full code for the blog application and you don't need to make any changes, or even run the blog. But you can, for fun.

We are also providing a patriotic (if you are an American) data set for the blog. There are 1000 entries with lots of comments and tags. You must load this dataset to complete the problem.

    // from the mongo shell
    use blog;
    db.posts.drop();
    
	# from the terminal window 
	mongoimport --drop -d blog -c posts posts.json

The blog has been enhanced so that it can also display the top 10 most recent posts by tag. There are hyperlinks from the post tags to the page that displays the 10 most recent blog entries for that tag. (run the blog and it will be obvious)

Your assignment is to make the following blog pages fast:

 - The blog home page
 - The page that displays blog posts by tag (http://localhost:8082/tag/whatever)
 - The page that displays a blog entry by permalink (http://localhost:8082/post/permalink)

By fast, we mean that indexes should be in place to satisfy these queries such that we only need to scan the number of documents we are going to return.

To figure out what queries you need to optimize, you can read the code and see what it does to display those pages. Isolate those queries and use explain to explore.

When you believe you have solved the problem correctly, test your solution in MongoProc. When you see confirmation that your solution is correct, turn it in.

You will see a message below about the number of times you have submitted a solution through MongoProc. You should not submit until testing in MongoProc confirms that your solution is correct.

Tip: Be sure to go to settings in mongoProc, and point mongod1 to your mongod (probably localhost:27017), and web1 to your web url (probably localhost:8082)