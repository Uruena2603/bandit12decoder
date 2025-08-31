!/bin/bash
liand=$(7z l sombras.gzip | grep "Name" -A 2 | awk 'NF{print $NF}' | awk 'NR==3')
7z x sombras.gzip >/dev/null 2>&1
while true; do 
        7z l $liand >/dev/null 2>&1;
        if [ "$(echo $?)" == "0" ]; then
                woody=$(7z l $liand | grep "Name" -A 2 | awk 'NF{print $NF}' | awk 'NR==3')
                7z x $liand >/dev/null 2>&1 && liand=$woody;
        else
                cat $liand; rm data* 2>/dev/null
                echo "Done succesfully."
                exit 1;
        fi; 
done;