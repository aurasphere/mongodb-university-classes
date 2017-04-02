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
@REM DESCRIPTION : Solution for MongoDB University M202's Homework 2-1. 
@REM AUTHOR : Donato Rimenti																	
@REM COPYRIGHT : Copyright (c) 2017 Donato Rimenti								
@REM LICENSE : MIT																 
@REM																			
@REM ================================================================================

@REM Deletes the corrupted files from secondary (they will be resync'd from primary).
cd ../secondary_from_rs_with_corrupt_data_files_mmapv1/mongod-sec
del /q journal 
del /q local.*
del /q testDB.*
del /q mongod*