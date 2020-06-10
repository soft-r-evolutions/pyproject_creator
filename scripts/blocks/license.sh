set_var blockname license

function init_license {
    run "cp ${template_dir}/LICENSE.mit ${project_path}/LICENSE"
}

function process_license {
    if [ "${is_github}" == "True" ]; then
        run "sed -i 's/\[ProjectSpace\]/${project_space}/g' ${project_path}/LICENSE"
    else
        run "sed -i '/\[ProjectSpace\]/d' ${project_path}/LICENSE"
    fi
}

function test_license {
    run "! grep \"\[ProjectSpace\]\" ${project_path}/README.md"
    if [ "${is_github}" == "True" ]; then
        run "grep \"${project_space}\" ${project_path}/README.md"
    fi
}

source ${W}/scripts/blocks/block.sh
execute

