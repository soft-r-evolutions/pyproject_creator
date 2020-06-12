function init_simple {
    run "cp ${template_dir}/simple/project_name.py ${project_path}/${project_name}.py"
    run "cp ${template_dir}/simple/tests.py ${project_path}/tests.py"
    run "cp ${template_dir}/simple/.coveragerc ${project_path}/.coveragerc"
    run "cp ${template_dir}/simple/README.md ${project_path}/README.md"
}

function process_simple {
    set_var project_pascal_case "$(echo ${project_name} | sed -r 's/(^|_)([a-z])/\U\2/g')"
    run "sed -i 's/ProjectName/${project_pascal_case}/g' ${project_path}/${project_name}.py"
    run "sed -i 's/ProjectName/${project_pascal_case}/g' ${project_path}/tests.py"
    run "sed -i 's/ProjectName/${project_pascal_case}/g' ${project_path}/README.md"

    set_var project_camel_case "$(echo ${project_pascal_case} | sed 's/^./\l&/')"
    run "sed -i 's/projectName/${project_camel_case}/g' ${project_path}/${project_name}.py"
    run "sed -i 's/projectName/${project_camel_case}/g' ${project_path}/tests.py"
    run "sed -i 's/projectName/${project_camel_case}/g' ${project_path}/README.md"
}

function test_simple {
    run "[ -e ${project_path}/${project_name}.py ]"
    run "[ -e ${project_path}/tests.py ]"

    run "grep ${project_pascal_case} ${project_path}/${project_name}.py"
    run "grep ${project_camel_case} ${project_path}/${project_name}.py"
    run "grep ${project_pascal_case} ${project_path}/tests.py"
    run "grep ${project_camel_case} ${project_path}/tests.py"
}

source ${W}/scripts/blocks/block.sh
execute

