#!/bin/bash

count=1;
            echo 'grid_search_parall(1,3,1:16); exit;' | matlab -nojvm -nosplash &
            sleep 2
            echo 'grid_search_parall(2,3,17:32); exit;' | matlab -nojvm -nosplash &
            sleep 2
            echo 'grid_search_parall(3,3,33:49); exit;' | matlab -nojvm -nosplash &
            sleep 2
            echo 'grid_search_parall(1,2,1:12); exit;' | matlab -nojvm -nosplash &
            sleep 2
            echo 'grid_search_parall(2,2,13:25); exit;' | matlab -nojvm -nosplash &
            sleep 2
            echo 'grid_search_parall(3,2,26:38); exit;' | matlab -nojvm -nosplash &
            sleep 2
            


	    
            #echo $(($count*100/36))'% completed'

	    wait %$(($count+0)) %$(($count+1)) %$(($count+2)) %$(($count+3)) %$(($count+4)) %$(($count+5))
         
            echo 'merge_res(3,3); exit;' | matlab -nojvm -nosplash &
            sleep 2
            echo 'merge_res(2,3); exit;' | matlab -nojvm -nosplash &
            sleep 2
            

exit
