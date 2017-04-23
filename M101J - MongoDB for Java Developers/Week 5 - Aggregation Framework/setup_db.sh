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
# DESCRIPTION : Sets up the DB for MongoDB University M101J's Week 5 homeworks.  #
# AUTHOR : Donato Rimenti														 #
# COPYRIGHT : Copyright (c) 2017 Donato Rimenti									 #
# LICENSE : MIT																	 #
#																				 #
# ============================================================================== #

# Restores DB for Homework 5-1.
mongoimport --drop -d blog -c posts week_5_aggregation_framework.cf07060254ef/posts.json

# Restores DB for Homework 5-2.
mongoimport --drop -d test -c zips1 week_5_aggregation_framework.cf07060254ef/small_zips.json

# Restores DB for Homework 5-3.
mongoimport --drop -d test -c grades week_5_aggregation_framework.cf07060254ef/Small_grades_file/grades.json

# Restores DB for Homework 5-4.
mongoimport --drop -d test -c zips2 week_5_aggregation_framework.cf07060254ef/zips__code_data_sample_zip_52efe2cae2d423438505544e.json