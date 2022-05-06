#!/bin/bash
echo 'Give mysql user'
read user
echo 'Give mysql password'
read password
mysqldump   -h127.0.0.1 -u$user -p$password hostel > stf_blank.sql 
git add *
git commit -a
git push https://github.com/nishishailesh/stf main

