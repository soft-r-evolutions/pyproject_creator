log "---------------------------"
log "Initialize Project: ${project_name}" "end_user"

log "Check options:" "end_user"

if [[ "${has_erase_option}" == "True" ]]; then
    log "-- Previous folder erase requested..."
    run "[ -e ${project_path} ] && rm -rf ${project_path} && echo \"Previous existing folder was removed.\" || true" "display"
    log "Previous folder erased." "end_user"
else
    log "-- No previous folder erase requested..." "end_user"
fi

log "-- Check if the destination folder already exist:" "end_user"
run "[ -e ${project_path} ] && echo \"the folder ${project_path} already exists please move it or remove it ... Exiting\"; false || [ ! -e ${project_path} ] && echo OK" "display"
log "-- Check if template folder exists:" "end_user"
run "[ ! -d ${template_dir} ] && echo \"Unexisting template directory ... Exiting\"; false || [ -d ${template_dir} ] && echo OK" "display"

log "-- Creating the project directory..."
run "mkdir -p ${project_path}"
log "Project directory created."
log "Project ${project_name} Initialized." "end_user"
log "---------------------------"
