@REM ================================================================================
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
@REM ================================================================================
@REM																			
@REM DESCRIPTION : Sets up the DB for MongoDB University M101J's Week 6 homeworks. 
@REM AUTHOR : Donato Rimenti																	
@REM COPYRIGHT : Copyright (c) 2017 Donato Rimenti								
@REM LICENSE : MIT																 
@REM																			
@REM ================================================================================

@REM Creates the data directories.
mkdir \data\rs1 \data\rs2 \data\rs3

@REM Starts 3 mongod instances which will be part of the replicaSet for Homework 6-5.
start mongod --replSet m101 --logpath 1.log --dbpath \data\rs1 --port 27017 --smallfiles --oplogSize 64
start mongod --replSet m101 --logpath 2.log --dbpath \data\rs2 --port 27018 --smallfiles --oplogSize 64
start mongod --replSet m101 --logpath 3.log --dbpath \data\rs3 --port 27019 --smallfiles --oplogSize 64