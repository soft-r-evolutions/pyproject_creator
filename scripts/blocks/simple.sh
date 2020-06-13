function init_simple {
    run "cp ${template_dir}/simple/project_name.py ${project_path}/${project_name}.py"
    run "cp ${template_dir}/simple/test_project_name.py ${project_path}/test_${project_name}.py"
    run "cp ${template_dir}/simple/.coveragerc ${project_path}/.coveragerc"
    run "cp ${template_dir}/simple/setup.py ${project_path}/setup.py"
    run "cp ${template_dir}/VERSION ${project_path}/VERSION"
}

function process_simple {
    set_var project_pascal_case "$(echo ${project_name} | sed -r 's/(^|_)([a-z])/\U\2/g')"
    run "sed -i 's/project_name/${project_name}/g' ${project_path}/${project_name}.py"
    run "sed -i 's/project_name/${project_name}/g' ${project_path}/test_${project_name}.py"
    run "sed -i 's/project_name/${project_name}/g' ${project_path}/.coveragerc"

    run "sed -i 's/ProjectName/${project_pascal_case}/g' ${project_path}/${project_name}.py"
    run "sed -i 's/ProjectName/${project_pascal_case}/g' ${project_path}/test_${project_name}.py"
    run "sed -i 's/ProjectName/${project_pascal_case}/g' ${project_path}/README.md"

    set_var project_camel_case "$(echo ${project_pascal_case} | sed 's/^./\l&/')"
    run "sed -i 's/projectName/${project_camel_case}/g' ${project_path}/${project_name}.py"
    run "sed -i 's/projectName/${project_camel_case}/g' ${project_path}/test_${project_name}.py"
    run "sed -i 's/projectName/${project_camel_case}/g' ${project_path}/README.md"

    run "sed -i 's/\[project_name\]/${project_name}/g' ${project_path}/setup.py"
    run "sed -i 's/\[ProjectName\]/${project_pascal_case}/g' ${project_path}/setup.py"
    run "sed -i 's/\[EndUserProjectName\]/${end_user_project_name}/g' ${project_path}/setup.py"
    if [ "${is_github}" == "True" ]; then
        run "sed -i 's/\[ProjectSpace\]/${project_space}/g' ${project_path}/setup.py"
    else
        run "sed -i '/\[ProjectSpace\]/d' ${project_path}/setup.py"
    fi
}

function test_simple {
    run "[ -e ${project_path}/${project_name}.py ]"
    run "[ -e ${project_path}/test_${project_name}.py ]"
    run "[ -e ${project_path}/test_${project_name}.py ]"

    run "grep ${project_pascal_case} ${project_path}/${project_name}.py"
    run "grep ${project_camel_case} ${project_path}/${project_name}.py"
    run "grep ${project_pascal_case} ${project_path}/test_${project_name}.py"
    run "grep ${project_camel_case} ${project_path}/test_${project_name}.py"
}

source ${W}/scripts/blocks/block.sh
execute

