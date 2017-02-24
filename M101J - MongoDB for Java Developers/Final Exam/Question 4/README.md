#Problem
Download Handouts:
 - <a href="https://university.mongodb.com/static/MongoDB_2017_M101J_January/handouts/final-problem4__driver-3.0_m101j_5536a98bd8ca396a7a77dfca.825ce298453f.zip">final-problem4__driver-3.0_m101j_5536a98bd8ca396a7a77dfca.zip</a>
 - <a href="https://university.mongodb.com/static/MongoDB_2017_M101J_January/handouts/posts__f4_m101j_m101js_m101p_52d94c86e2d423744501ce90.f52bca51f2fb.json">posts__f4_m101j_m101js_m101p_52d94c86e2d423744501ce90.json</a>

##Final: Question 4

###Enhancing the Blog to support viewers liking certain comments

In this problem, you will be enhancing the blog project to support users liking certain comments and the like counts showing up the in the permalink page.

Start by downloading the code in final-problem4.zip and posts.json files from the Download Handout link. Load up the blog dataset posts.json. The user interface has already been implemented for you. It's not fancy. The /post URL shows the like counts next to each comment and displays a Like button that you can click on. That Like button POSTS to the /like URL on the blog, makes the necessary changes to the database state (you are implementing this), and then redirects the browser back to the permalink page.

This full round trip and redisplay of the entire web page is not how you would implement liking in a modern web app, but it makes it easier for us to reason about, so we will go with it.

Your job is to search the code for the string "XXX work here" and make the necessary changes. You can choose whatever schema you want, but you should note that the entry_template makes some assumptions about the how the like value will be encoded and if you go with a different convention than it assumes, you will need to make some adjustments.

MongoProc will fetch your blog, go to the first post's permalink page and attempt to increment the vote count. Remember that the blog needs to be running as well as MongoDB.

Once you have tested your code using MongoProc, submit it (also using MongoProc).