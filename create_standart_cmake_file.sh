cmake_file="CMakeLists.txt"
if ( test -f ./$cmake_file  ); then 
    echo "$cmake_file exists"
    read -p 'Создать резервный файл проекта? Yes or No: ' answar
    if [[ $answar == "Yes" ]]; then
        echo "Создаем бэкап"
        mv $cmake_file ${cmake_file}.bac`date +%S%H%M%d%Y`
    elif [[ $answar == "No" ]]; then
        echo "Бэкап не будет создан"
    else 
        echo "Ошибка ввода"
        exit
    fi
fi
project_name=''
while [[ ${project_name} == '' ]]; do
    read -p 'Project name: ' project_name
done
echo -e "cmake_minimum_required(VERSION `cmake --version | awk 'NR == 1 {print $3}'`)\nproject(${project_name})\nadd_executable($project_name ${project_name}.cpp)" > $cmake_file

answar=Yes
if [[ $answar == "Yes" ]]; then
    echo -e "#include <iostream>\nint main(void){\n\tputs(\"Hello, World!\");\n\treturn 0;\n}" > ${project_name}.cpp
fi
