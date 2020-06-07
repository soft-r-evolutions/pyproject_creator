#!/bin/bash

source ${W}/scripts/check_launch_errors.sh

W=$(dirname $(realpath $0))
source ${W}/data/scripts/bash_utils.sh

export output_path="${W}/projects"
export log_file_name="${W}/projects/$1_creation.log"

start_script

source ${W}/scripts/set_constants.sh
source ${W}/scripts/check_args.sh

if [[ "${has_erase_option}" == "True" ]]; then
    log "Previous folder erase requested" "end_user"
    run "[ -e ${project_path} ] && rm -rf ${project_path} && echo \"Previous existing folder was removed.\" || true" "display"
fi

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
run "sed -i 's/\[EndUserProjectName\]/${end_user_project_name}/g' ${project_path}/README.md"
run "sed -i 's/\[ProjectName\]/${project_name}/g' ${project_path}/README.md"
if [ "${is_github}" == "True" ]; then
    run "sed -i 's/\[ProjectSpace\]/${project_space}/g' ${project_path}/README.md"
else
    run "sed -i '/\[ProjectSpace\]/d' ${project_path}/README.md"
fi

log "-- Add the MIT LICENSE" "end_user"
run "cp ${template_dir}/LICENSE.mit ${project_path}/LICENSE"
if [ "${is_github}" == "True" ]; then
    run "sed -i 's/\[ProjectSpace\]/${project_space}/g' ${project_path}/LICENSE"
else
    run "sed -i '/\[ProjectSpace\]/d' ${project_path}/LICENSE"
fi

log "-- Add the .gitignore" "end_user"
run "cp ${template_dir}/.gitignore ${project_path}/.gitignore"

run "tree ${project_path} || true" "display"

end_script 0
