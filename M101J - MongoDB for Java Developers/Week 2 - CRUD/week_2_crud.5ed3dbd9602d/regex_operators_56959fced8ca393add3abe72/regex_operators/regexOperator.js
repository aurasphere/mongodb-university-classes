db.movieDetails.find({ "awards.text": { $regex: /^Won.*/ } }).pretty()

db.movieDetails.find({ "awards.text": { $regex: /^Won.*/ } },
                     { title: 1, "awards": 1, _id: 0}).pretty()
