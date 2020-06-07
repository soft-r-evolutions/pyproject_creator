log "Check command line options:" "end_user"
if [[ "${options}" == *"erase"* ]]; then
    set_var "has_erase_option" "True" "end_user"
else
    set_var "has_erase_option" "false" "end_user"
fi

if [[ ${options} == *"github"* ]] && [ "${project_space}" != "" ]; then
    set_var "is_github" "True" "end_user"
else
    set_var "is_github" "false" "end_user"
fi
