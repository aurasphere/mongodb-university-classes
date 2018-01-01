@REM ==============================================================================
@REM MIT License                                                                   
@REM                                                                               
@REM Copyright (c) 2017 Donato Rimenti                                             
@REM                                                                               
@REM Permission is hereby granted, free of charge, to any person obtaining a copy  
@REM of this software and associated documentation files (the "Software"), to deal 
@REM in the Software without restriction, including without limitation the rights  
@REM to use, copy, modify, merge, publish, distribute, sublicense, and/or sell     
@REM copies of the Software, and to permit persons to whom the Software is         
@REM furnished to do so, subject to the following conditions:                      
@REM                                                                               
@REM The above copyright notice and this permission notice shall be included in    
@REM all copies or substantial portions of the Software.                           
@REM                                                                               
@REM THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR    
@REM IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,      
@REM FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE   
@REM AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER        
@REM LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, 
@REM OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE 
@REM SOFTWARE.                                                                     
@REM ==============================================================================
@REM																			   
@REM DESCRIPTION : Solution for MongoDB University M102's Final Exam Question 2.  
@REM AUTHOR : Donato Rimenti													   
@REM COPYRIGHT : Copyright (c) 2017 Donato Rimenti								   
@REM LICENSE : MIT																   
@REM																			   
@REM ==============================================================================

@REM Starts the servers with the provided script.
start ..\final_exam.127c39d04bb9\rollback_553ed0e3d8ca3966d777dfe0\a.bat

@REM Waits for the script to end.
timeout 5

@REM Inits the replica set.
mongo --port 27003 --eval "load('../final_exam.127c39d04bb9/rollback_553ed0e3d8ca3966d777dfe0/a.js'); ourinit();"

@REM Waits for the init.
timeout 20

@REM Steps down the first server in case it's the primary.
mongo --port 27001 --eval "rs.stepDown();"

@REM Waits for the stepdown.
timeout 2

@REM Inserts some record into the DB.
mongo test --port 27003 --eval "db.foo.insertMany( [{ _id : 1 }, { _id : 2 }, { _id : 3 }], { writeConcern : { w : 2 } } );" 

@REM Shutdown the first server.
mongo admin --port 27001 --eval "db.shutdownServer();"

@REM Waits for the server to shutdown.
timeout 5

@REM Inserts other records.
mongo test --port 27003 --eval "db.foo.insertMany( [{ _id : 4 }, { _id : 5 }, { _id : 6 }] );"

@REM Shutdown the other server.
mongo admin --port 27003 --eval "db.shutdownServer({force : true});"

@REM Starts the first server.
start mongod --port 27001 --dbpath data/z1 --replSet z 

@REM Waits for the server to startup.
timeout 10

@REM Adds a new record.
mongo --port 27001 --eval "db.foo.insert( { _id : 'last' } );"

@REM Starts the last server.
start mongod --port 27003 --dbpath data/z3 --replSet z 

@REM Waits for the server to startup.
timeout 10

@REM Prints the solution.
mongo --port 27001 --eval "rs.slaveOk(); var result = db.foo.find(); print('Solution : '); while (result.hasNext()) {printjson(result.next());}"