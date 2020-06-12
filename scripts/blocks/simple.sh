function init_simple {
    run "cp ${template_dir}/simple/project_name.py ${project_path}/${project_name}.py"
    run "cp ${template_dir}/simple/test_project_name.py ${project_path}/test_${project_name}.py"
    run "cp ${template_dir}/simple/.coveragerc ${project_path}/.coveragerc"
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
}

function test_simple {
    run "[ -e ${project_path}/${project_name}.py ]"
    run "[ -e ${project_path}/test_${project_name}.py ]"

    run "grep ${project_pascal_case} ${project_path}/${project_name}.py"
    run "grep ${project_camel_case} ${project_path}/${project_name}.py"
    run "grep ${project_pascal_case} ${project_path}/test_${project_name}.py"
    run "grep ${project_camel_case} ${project_path}/test_${project_name}.py"
}

source ${W}/scripts/blocks/block.sh
execute

