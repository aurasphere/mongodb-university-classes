# Problem
This problem is provided as a supplementary learning opportunity. It is more challenging that the ordinary homework. It is ungraded. We do not ask you submit an answer.

Suppose our movie details documents are structured so that rather than contain an awards field that looks like this:

    "awards" : {
        "wins" : 56,
        "nominations" : 86,
        "text" : "Won 2 Oscars. Another 56 wins and 86 nominations."
    }

they are structured with an awards field as follows:

    "awards" : {
        "oscars" : [
            {"award": "bestAnimatedFeature", "result": "won"},
            {"award": "bestMusic", "result": "won"},
            {"award": "bestPicture", "result": "nominated"},
            {"award": "bestSoundEditing", "result": "nominated"},
            {"award": "bestScreenplay", "result": "nominated"}
        ],
        "wins" : 56,
        "nominations" : 86,
        "text" : "Won 2 Oscars. Another 56 wins and 86 nominations."
    }
	
What query would we use in the Mongo shell to return all movies in the video.movieDetails collection that either won or were nominated for a best picture Oscar? You may assume that an award will appear in the oscars array only if the movie won or was nominated. You will probably want to create a little sample data for yourself in order to work this problem.

HINT: For this question we are looking for the simplest query that will work. This problem has a very straightforward solution, but you will need to extrapolate a little from some of the information presented in the "Reading Documents" lesson.

<details>
  <summary>Click here for the solution</summary>
  - db.movieDetails.find({"awards.oscars.award": "bestPicture"})
</details>