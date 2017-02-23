db.movieDetails.find({ $or : [ { "tomato.meter": { $gt: 99 } },
                               { "metacritic": { $gt: 95 } } ] })


db.movieDetails.find({ $and : [ { "metacritic": { $ne: 100 } },
                                { "metacritic" { $exists: true } } ] })


