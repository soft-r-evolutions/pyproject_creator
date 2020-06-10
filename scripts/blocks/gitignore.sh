function init_gitignore {
    run "cp ${template_dir}/.gitignore ${project_path}/.gitignore"
}

function process_gitignore {
    true
}

function test_gitignore {
    run "[ -e ${project_path}/.gitignore ]"
}

source ${W}/scripts/blocks/block.sh
execute

