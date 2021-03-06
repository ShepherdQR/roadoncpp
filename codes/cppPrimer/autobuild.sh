#************
#  * @Author: Shepherd Qirong
#  * @Date: 2020-05-12 00:16:46
#  * @Github: https://github.com/ShepherdQR
#  * @LastEditors: Shepherd Qirong
#  * @LastEditTime: 2020-08-01 21:49:52
#  * @Copyright (c) 2019--20xx Shepherd Qirong. All rights reserved.
#************
#!/bin/bash

## last modified on 2020020717:58

#current=`date "+%Y-%m-%d %H:%M:%S"`  
#timeStamp=`date -d "$current" +%s`   
#currentTimeStamp=$((timeStamp*1000+`date "+%N"`/1000000))


#------ match and delete the build+date folder
project_path=$(cd `dirname $0`; pwd)
build_name=${project_path##*/}
#echo $build_name

all_files=$(ls)
for one_file in $all_files
do
    #echo $one_file
    if [[ $one_file == build* ]]; then
        rm -rf $one_file
    fi
done
ls
#------



current2=`date "+%Y%m%d%H%M%S"`

mkdir build$current2
cd build$current2
cmake ..
make -j8
ls
#./main

cp -f main ../main
cd ..
ls

#./main

./main <./Datasets/testInBooks.qr> testOut.qr
## for ClassIndexBook1_3();