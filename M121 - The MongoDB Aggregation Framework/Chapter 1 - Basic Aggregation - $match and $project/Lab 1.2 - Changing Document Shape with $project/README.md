# Problem
Download Handouts:
 - <a href="https://s3.amazonaws.com/edu-downloads.10gen.com/M121_2018_March/static/handouts/m121/chapter1.zip">m121/chapter1.zip</a>
 
Our first movie night was a success. Unfortunately, our ISP called to let us know we're close to our bandwidth quota, but we need another movie recommendation!

Using the same $match stage from the previous lab, add a $project stage to only display the the title and film rating (title and rated fields).

 - Assign the results to a variable called pipeline.

       var pipeline = [{ $match: {. . .} }, { $project: { . . . } }]

 - Load validateLab2.js which was included in the same handout as validateLab1.js and execute validateLab2(pipeline)?

       load('./validateLab2.js')

 - And run the validateLab2 validation method

       validateLab2(pipeline)

What is the answer?

Choose the best answer:
 - 15
 - 4
 - 7
 - 30

<details>
  <summary>Click here for the solution</summary>
    <ul>
      <li>15</li>
	</ul>
</details>
