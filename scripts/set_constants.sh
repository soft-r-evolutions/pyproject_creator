log "Initialize variables:" "end_user"

set_var project_name "$1" "end_user"
set_var project_path "${output_path}/${project_name}" "end_user"
set_var end_user_project_name "$2" "end_user"
set_var options "$3" "end_user"
set_var project_space "$4" "end_user"
set_var template_dir "${W}/template"
