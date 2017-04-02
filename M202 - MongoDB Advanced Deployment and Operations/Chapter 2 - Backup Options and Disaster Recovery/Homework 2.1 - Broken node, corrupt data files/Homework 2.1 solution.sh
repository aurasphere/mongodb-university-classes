#!/bin/bash

# ============================================================================== #
# MIT License                                                                    #
#                                                                                #
# Copyright (c) 2017 Donato Rimenti                                              #
#                                                                                #
# Permission is hereby granted, free of charge, to any person obtaining a copy   #
# of this software and associated documentation files (the "Software"), to deal  #
# in the Software without restriction, including without limitation the rights   #
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell      #
# copies of the Software, and to permit persons to whom the Software is          #
# furnished to do so, subject to the following conditions:                       #
#                                                                                #
# The above copyright notice and this permission notice shall be included in     #
# all copies or substantial portions of the Software.                            #
#                                                                                #
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR     #
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,       #
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE    #
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER         #
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,  #
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE  #
# SOFTWARE.                                                                      #
# ============================================================================== #
#																				 #
# DESCRIPTION : Solution for MongoDB University M202's Homework 2-1.             #
# AUTHOR : Donato Rimenti														 #				
# COPYRIGHT : Copyright (c) 2017 Donato Rimenti									 #
# LICENSE : MIT																	 # 
#																				 #
# ============================================================================== #

# Deletes the corrupted files from secondary (they will be resync'd from primary).
cd ../secondary_from_rs_with_corrupt_data_files_mmapv1/mongod-sec
rm -rf journal
rm -rf local.*
rm -rf testDB.*
rm -rf mongod*