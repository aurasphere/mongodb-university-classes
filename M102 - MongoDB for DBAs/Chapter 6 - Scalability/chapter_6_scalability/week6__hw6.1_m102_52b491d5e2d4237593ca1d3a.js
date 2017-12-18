// week6.js
// M102 course
// run: 
//   mongo --shell localhost/week6 week6.js

homework = { };

if( "week6" != db ) { 
    print("want 'db' to be 'week6' when the shell starts. terminating.");
    throw "use week6 db before running script";
}

homework.init = function() { 
    var t = db.trades;
    if( t.count() ) { 
        throw "week6.trades not empty, so won't init(). If you want to reinit, drop the collection first.";
    }
    o = { 
        ticker : 'abcd',
        time   : new Date(2012,2,3),
        price  : 110,
        shares : 200, 
        details : {
            asks : [ 110.07, 110.12, 110.30 ],
            bids : [ 109.90, 109.88, 109.70, 109.5 ], 
            system : 'abc',
            lag : 0
        }
    };
    t.insert(o);

    var j = 100;
    for( var i = 0; i < 1000000; i++ ) { 
        if( i % 10000 == 0 ) { 
            print(db.getLastError() + ' ' + i);
        }
        if( ++j >= 500 ) j = 100;
        o.ticker = 'z' + j;
        o.time = new Date(2012, 2, 3, 9, i%60, (i/60)%60, (i/3600)%1000);
        t.insert(o);
    }
    printjson( db.getLastErrorObj() );
    print("count: " + t.count());
}

homework.a = function() { assert( db == "week6" ); if( db.isMaster().msg != "isdbgrid" ) { throw "connect to a mongos not a mongod. try again."; } return db.trades.count();
}

homework.check1 = function() { 
    if( db.isMaster().msg != "isdbgrid" ) { 
        throw "connect to a mongos not a mongod. try again."; 
    }
    print('db.getSisterDB("config").shards.count() : ');
    var n = db.getSisterDB("config").shards.count();
    print(n);
    print("There are " + n + " shards in the cluster");
    if( n == 2 ) print("as expected");
    else print("expected 2 shards? something not as expected.");
}

homework.b = function() { 
    if( db.isMaster().msg != "isdbgrid" ) { throw "connect to a mongos not a mongod. try again."; }
    var x = db.getSisterDB("config").chunks.find({ns:"week6.trades"}).count();
    return x <= 2 ? x : 3;
}
homework.c = function() { 
    var x = db.getSisterDB("config").chunks.aggregate( [  { $match : { ns : "week6.trades" } } ,   { $group : { _id : "$shard" , n : { $sum : 1 } } } ] );
    return x.toArray().length
}
