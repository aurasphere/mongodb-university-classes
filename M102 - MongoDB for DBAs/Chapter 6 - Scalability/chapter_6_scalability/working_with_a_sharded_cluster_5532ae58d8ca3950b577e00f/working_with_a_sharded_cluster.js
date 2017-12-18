db.example.drop();
db.example.createIndex( { b : 1, c : 1, d : 1 } );
sh.enableSharding("test");
sh.shardCollection("test.example", { b : 1, c : 1, d : 1 } );
sh.splitAt("test.example", { b : 2, c : 1, d : 1 } );
sh.splitAt("test.example", { b : 3, c : 1, d : 1 } );
sh.splitAt("test.example", { b : 4, c : 1, d : 1 } );
sh.splitAt("test.example", { b : 5, c : 1, d : 1 } );
sh.splitAt("test.example", { b : 6, c : 1, d : 1 } );
sh.splitAt("test.example", { b : 7, c : 1, d : 1 } );
sh.splitAt("test.example", { b : 8, c : 1, d : 1 } );
sh.splitAt("test.example", { b : 9, c : 1, d : 1 } );
sh.splitAt("test.example", { b : 10, c : 1, d : 1 } );
sleep(30000); // gives the balancer a little time to move some chunks.
sh.status();

for (i=1; i<=10; i++) { 
    for (j=1; j<=10; j++) { 
        for (k=1; k<=10; k++) { 
            var x = [];
            for (l=1; l<=10; l++) { 
                for (m=1; m<=10; m++) { 
                    for (n=1; n<=10; n++) { 
                    x.push( { a : i, b : j, c : k, d : l, e: m, f: n } );
                    }
                }
            };
            db.example.insert(x);
        };
    };
};

db.example.remove( { b : 5, c : 5, d : 5,
                     $or : 
                         [ { e : { $ne : 5 } },
                           { f : { $ne : 5 } },
                           { a : { $ne : 5 } } 
                         ] } );
db.example.remove( { e : 5, f : 5, a : 5,
                     $or : [ { b : { $ne : 5 } },
                             { c : { $ne : 5 } },
                             { d : { $ne : 5 } } 
                           ] } );
exp = db.example.explain("executionStats")
