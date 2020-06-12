function init_readme {
    if [ ${app_layout} == 'simple' ]; then
        run "cp ${template_dir}/simple/README.md ${project_path}/README.md"
    fi
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

function test_readme {
    run "! grep \"\[EndUserProjectName\]\" ${project_path}/README.md"
    run "grep \"${end_user_project_name}\" ${project_path}/README.md"
    run "! grep \"\[ProjectName\]\" ${project_path}/README.md"

    #simple app readme contains . instead of project name
    if [ ${app_layout} != 'simple' ]; then
        run "grep \"${project_name}\" ${project_path}/README.md"
    fi

    if [ "${is_github}" == "True" ]; then
        run "! grep \"\[ProjectSpace\]\" ${project_path}/README.md"
        run "grep \"${project_space}\" ${project_path}/README.md"
    else
        run "! grep \"badge\" projects/my_project/README.md"
    fi
}

source ${W}/scripts/blocks/block.sh
execute

