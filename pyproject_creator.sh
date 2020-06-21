#!/bin/bash

W=$(dirname $(realpath $0))
source ${W}/scripts/check_launch_errors.sh
source ${W}/data/scripts/bash_utils.sh

export output_path="${W}/projects"
export log_file_name="${W}/projects/$1_creation.log"

start_script

source ${W}/scripts/set_constants.sh
source ${W}/scripts/check_args.sh

source ${W}/scripts/init_project.sh

source ${W}/scripts/blocks/readme.sh
source ${W}/scripts/blocks/license.sh
source ${W}/scripts/blocks/gitignore.sh
source ${W}/scripts/blocks/requirements.sh

if [ "${app_layout}" == "simple" ]; then
    source ${W}/scripts/blocks/simple.sh
else
    source ${W}/scripts/blocks/single.sh
fi

echo "You can now go to edit the project description in README.md"
echo "You can now go to edit your name, email, license in setup.py"

run "tree ${project_path} || true" "display"

end_script 0
