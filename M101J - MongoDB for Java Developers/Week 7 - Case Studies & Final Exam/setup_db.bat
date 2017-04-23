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
@REM DESCRIPTION : Sets up the DB for MongoDB University M101J's Final Exam.       
@REM AUTHOR : Donato Rimenti													   
@REM COPYRIGHT : Copyright (c) 2017 Donato Rimenti								   
@REM LICENSE : MIT																   
@REM																			   
@REM ==============================================================================

@REM Restores DB for Question 1-2-3.
mongorestore final_exam.885e11cb609a/enron/dump

@REM Restores DB for Question 4.
mongoimport --drop -d blog -c posts final_exam.885e11cb609a/posts__f4_m101j_m101js_m101p_52d94c86e2d423744501ce90.json

@REM Restores DB for Question 7.
mongoimport --drop -d photos -c albums final_exam.885e11cb609a/final7__f7_m101_52e000fde2d423744501d031/final7/albums.json
mongoimport --drop -d photos -c images final_exam.885e11cb609a/final7__f7_m101_52e000fde2d423744501d031/final7/images.json