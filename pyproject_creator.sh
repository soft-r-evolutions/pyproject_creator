#!/bin/bash

source ${W}/scripts/check_launch_errors.sh

W=$(dirname $(realpath $0))
source ${W}/data/scripts/bash_utils.sh

export output_path="${W}/projects"
export log_file_name="${W}/projects/$1_creation.log"

start_script

source ${W}/scripts/set_constants.sh
source ${W}/scripts/check_args.sh

source ${W}/scripts/init_project.sh

source ${W}/scripts/blocks/readme.sh

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
