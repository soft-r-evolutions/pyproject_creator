log "Check command line options:" "end_user"
if [[ "${options}" == *"erase"* ]]; then
    set_var "has_erase_option" "True" "end_user"
else
    set_var "has_erase_option" "false" "end_user"
fi

if [[ "${options}" == *"github"* ]] && [ "${project_space}" != "" ]; then
    set_var "is_github" "True" "end_user"
else
    set_var "is_github" "false" "end_user"
fi

if [[ "${options}" == *"simple"* ]]; then
    log "Simple application layout detected" "end_user"
    set_var app_layout "simple"
if [[ "${options}" == *"single"* ]]; then
    log "Single package layout detected" "end_user"
    set_var app_layout "single"
if [[ "${options}" == *"complex"* ]]; then
    log "Application with internal lib layout detected" "end_user"
    set_var app_layout "complex"
else
    log "No application layout detected: use simple as default. Use single or complex to change it." "end_user"
    set_var app_layout "simple"
fi
