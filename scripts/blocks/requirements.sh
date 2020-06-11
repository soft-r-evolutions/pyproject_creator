function init_requirements {
    run "cp ${template_dir}/requirements.txt ${project_path}/requirements.txt"
}

function process_requirements {
    true
}

function test_requirements {
    [ -e ${project_path}/requirements.txt ]
}

source ${W}/scripts/blocks/block.sh
execute

