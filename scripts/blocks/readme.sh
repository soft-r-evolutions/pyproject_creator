set_var blockname readme

function init_readme {
    run "cp ${template_dir}/README.md ${project_path}/README.md"
}

function process_readme {
    run "sed -i 's/\[EndUserProjectName\]/${end_user_project_name}/g' ${project_path}/README.md"
    run "sed -i 's/\[ProjectName\]/${project_name}/g' ${project_path}/README.md"
    if [ "${is_github}" == "True" ]; then
        run "sed -i 's/\[ProjectSpace\]/${project_space}/g' ${project_path}/README.md"
    else
        run "sed -i '/\[ProjectSpace\]/d' ${project_path}/README.md"
    fi
}

source ${W}/scripts/blocks/block.sh
execute

