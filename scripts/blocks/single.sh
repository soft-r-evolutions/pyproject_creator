function init_single {
    run "cp -r ${template_dir}/single/project_name ${project_path}/${project_name}"
    run "cp -r ${template_dir}/single/tests ${project_path}/"
    run "cp ${template_dir}/single/.coveragerc ${project_path}/.coveragerc"
    run "cp ${template_dir}/single/setup.py ${project_path}/setup.py"
    run "cp ${template_dir}/single/MANIFEST.in ${project_path}/MANIFEST.in"
    run "cp ${template_dir}/VERSION ${project_path}/VERSION"
}

function process_single {
    set_var project_pascal_case "$(echo ${project_name} | sed -r 's/(^|_)([a-z])/\U\2/g')"
    run "sed -i 's/project_name/${project_name}/g' ${project_path}/${project_name}/app.py"
    run "sed -i 's/project_name/${project_name}/g' ${project_path}/${project_name}/core.py"
    run "sed -i 's/project_name/${project_name}/g' ${project_path}/tests/test_app.py"
    run "sed -i 's/project_name/${project_name}/g' ${project_path}/tests/test_core.py"
    run "sed -i 's/project_name/${project_name}/g' ${project_path}/.coveragerc"

    run "sed -i 's/ProjectName/${project_pascal_case}/g' ${project_path}/${project_name}/app.py"
    run "sed -i 's/ProjectName/${project_pascal_case}/g' ${project_path}/${project_name}/core.py"
    run "sed -i 's/ProjectName/${project_pascal_case}/g' ${project_path}/tests/test_app.py"
    run "sed -i 's/ProjectName/${project_pascal_case}/g' ${project_path}/tests/test_core.py"
    run "sed -i 's/ProjectName/${project_pascal_case}/g' ${project_path}/README.md"

    set_var project_camel_case "$(echo ${project_pascal_case} | sed 's/^./\l&/')"
    run "sed -i 's/projectName/${project_camel_case}/g' ${project_path}/${project_name}/app.py"
    run "sed -i 's/projectName/${project_camel_case}/g' ${project_path}/${project_name}/core.py"
    run "sed -i 's/projectName/${project_camel_case}/g' ${project_path}/tests/test_app.py"
    run "sed -i 's/projectName/${project_camel_case}/g' ${project_path}/tests/test_core.py"
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

function test_single {
    run "[ -e ${project_path}/${project_name}/app.py ]"
    run "[ -e ${project_path}/${project_name}/core.py ]"
    run "[ -e ${project_path}/tests/test_core.py ]"
    run "[ -e ${project_path}/tests/test_app.py ]"
}

source ${W}/scripts/blocks/block.sh
execute

