function init_requirements {
    run "cp ${template_dir}/simple/project_name.py ${project_path}/${project_name}.py"
    run "cp ${template_dir}/simple/tests.py ${project_path}/tests.py"
}

function process_requirements {
    set_var project_pascal_case "$(echo \"$project_name\" | sed -r 's/(^|_)([a-z])/\U\2/g')"
    run "sed -i 's/ProjectName/${project_pascal_case}/g' ${project_path}/${project_name}.py"
    run "sed -i 's/ProjectName/${project_pascal_case}/g' ${project_path}/tests.py"
}

function test_requirements {
    [ -e ${project_path}/${project_name}.py ]
    [ -e ${project_path}/tests.py ]
}

source ${W}/scripts/blocks/block.sh
execute

