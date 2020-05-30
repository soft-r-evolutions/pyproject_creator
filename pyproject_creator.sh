#!/bin/bash

function usage {
    error_code=$1
    echo "Initialize a python project" 
    echo "./pyproject-creator.sh PROJECT_NAME [OPTIONS]"
    echo "With:"
    echo "PROJECT_NAME: your Python project name"
    echo "OPTIONS can be combined by any seperator except space."
    echo "Option list are: "
    echo "- simple: your module contain a single file."
    echo "- github: your module integrate a github workflow."
    echo "- erase: your module integrate a github workflow."
    echo ""
    echo "The new project will be written to projects folder."
    echo "If the output folder already exists the project will exit"
    echo "in error."
    exit ${error_code}
}

if [ "$1" == "--help" ] || [ "$1" == "-h" ]; then
    usage 0
fi

if [ "$#" -lt 1 ]; then
    usage 1
fi

W=$(dirname $(realpath $0))
source ${W}/data/scripts/bash_utils.sh


export output_path="${W}/projects"
export log_file_name="${W}/projects/$1_creation.log"

start_script

function add_file_vars {
    set_var var_name $1
    set_var filename $2

    local template_name=template_${var_name}
    set_var ${template_name} "${template_dir}/${filename}"
    local output_name=output_${var_name}
    set_var ${output_name} "${project_path}/${filename}"
    #set_var ${var_name} ${filename}
}

set_var project_name "$1" "end_user"
set_var project_path "${output_path}/${project_name}" "end_user"
set_var options "$2" "end_user"
if [[ "${options}" == *"erase"* ]]; then
    log "Previous folder erase requested" "end_user"
    run "[ -e ${project_path} ] && rm -rf ${project_path} && echo \"Previous existing folder was removed.\" || true" "display"
fi

set_var template_dir "${W}/template"
add_file_vars readme "README.md"

log "Check conditions:" "end_user"
log "-- Check if the destination folder already exist:" "end_user"
run "[ -e ${project_path} ] && echo \"the folder ${project_path} already exists please move it or remove it ... Exiting\"; false || [ ! -e ${project_path} ] && echo OK" "display"
log "-- Check if template readme exists:" "end_user"
run "[ ! -d ${template_dir} ] && echo \"Unexisting template directory ... Exiting\"; false || [ -d ${template_dir} ] && echo OK" "display"

log "Initialize project: ${project_name}"

log "-- Create the project directory" "end_user"
run "mkdir -p ${project_path}"

log "-- Add the README" "end_user"
run "cp ${template_dir}/README.md ${project_path}/README.md"

run "tree ${project_path}" "display"

end_script 0
