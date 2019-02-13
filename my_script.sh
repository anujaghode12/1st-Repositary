#!/bin/bash
#create a folder
echo "Enter a directory name:"
read filename
mkdir -p $filename

#create multiple file with different content
cd $filename
for i in 1 2 3 4
do
 	echo $i >"anu $i.txt"
 done

 #create zip folder of that files
 
cd ..
zip -r $filename.zip $filename

#tar -zcvf anu.tar.gz $filename
# revese the folder name 

len=${#filename}
echo $len
for((j=$len-1;j>=0;j--))
do
    reversefolder="$reversefolder${filename:$j:1}"
done
 mkdir -p $reversefolder

#extract files from zip folder  

unzip $filename.zip -d $reversefolder

cp $filename/* $reversefolder

#print content of the files
cd $reversefolder
 rm -rf $filename
find -name "*.txt" -print -exec cat {} \;