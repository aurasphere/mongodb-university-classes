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
@REM DESCRIPTION : Sets up the DB for MongoDB University M101J's Week 2 homeworks. 
@REM AUTHOR : Donato Rimenti													   
@REM COPYRIGHT : Copyright (c) 2017 Donato Rimenti								   
@REM LICENSE : MIT																   
@REM																			   
@REM ==============================================================================

@REM Restores DB for Homework 2-2 and 2-3.
mongoimport --drop -d students -c grades week_2_crud.5ed3dbd9602d/grades.json 

@REM Restores DB for Homework 2-5 and 2-6.
mongorestore week_2_crud.5ed3dbd9602d/creating_documents_56959fced8ca393add3abe66/creating_documents/dump