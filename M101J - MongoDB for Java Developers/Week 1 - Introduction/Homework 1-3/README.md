# Problem
Download Handouts:
 - <a href="https://university.mongodb.com/static/MongoDB_2017_M101J_January/handouts/hw1-3__hw1.3_m101j_zip_5258466de2d423353776533c.6655f3bb14f1.zip">hw1-3__hw1.3_m101j_zip_5258466de2d423353776533c.zip</a>
 
In this problem, we want to test that you have a working JDK, that maven is installed and that you can run maven-based projects. Please install JDK for Java version 6 or 7, as well as Maven 3.1. If they are not already installed, you can find them in the courseware.

Download hw1-3.zip from Download Handout link, uncompress it, cd into the hw1-3 directory (there should be a pom.xml file in there), and run Maven as follows:

    mvn compile exec:java -Dexec.mainClass=com.mongodb.SparkHomework

It requires Maven to be installed correctly to work. If you run it correctly, you should be able to go to localhost:4567 in your browser, or simply curl it.

If everything is set up correctly, you will see the following:

    The answer is:

Type the number that appears after the colon into the box below. No spaces, nothing but digits.

<details>
  <summary>Click here for the solution</summary>
  - 523258
</details>