#!/bin/bash

# MIT License
# 
# Copyright (c) 2020 soft-r-evolutions
# Project at: https://github.com/soft-r-evolutions/bash_utils
# Version 1.0.0
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

function log() {
    msg=$1
    log_type=$2

    local time_log=$(date "+%Y%m%d_%H:%M:%S,%3N")
    log_msg="${time_log} ${msg}"

    if [[ "${log_type}" == *"end_user"* ]]; then
        echo ${log_msg}
    fi

    echo ${log_msg} >> ${log_file_name}
}

function display_var() {
    var_name=$1
    var_value=$2
    log_type=$3

    if [ "${log_type}" != "no_log" ]; then
        msg="Set ${var_name} to: '${var_value}'"
    else
        msg="Set ${var_name} to: '*********'"
    fi
    log "${msg}" "${log_type}"
}

function set_var() {
    var_name=$1
    var_value=$2
    log_type=$3

    export ${var_name}="${var_value}"
    display_var ${var_name} "${var_value}" "${log_type}"
}

export cmd_id=1
function run() {
    cmd=$1
    cmd_options=$2

    if [[ "${cmd_options}" == *"no_log"* ]]; then
        log "------ Launch not logged command (id:${cmd_id} - options: ${cmd_options}):"
    else
        log "------ Launch command (id:${cmd_id} - options ${cmd_options}): ${cmd}" "${cmd_options}"
        log "${cmd}" "${cmd_options}"
    fi

    if [[ "${cmd_options}" == *"display"* ]]; then
        bash -c "${cmd}" 2>&1 | tee -a ${log_file_name}
        result=${PIPESTATUS[0]}
    else
        bash -c "${cmd}" >> ${log_file_name} 2>&1
        result=$?
    fi

    if [ ${result} -eq 0 ]; then
        log "Command has successfully ended (id:${cmd_id})------"
    else
        if [[ "${cmd_options}" == *"no_exit"* ]]; then
            log "Command(id:${cmd_id}) has failed ------ no exit specified"
        else
            log "Command(id:${cmd_id}) has failed ------ exiting..."
            end_script ${result}
        fi
    fi
    ((cmd_id++))
}

function _start_script() {
    if [ "${is_log_append}" != "True" ] && [ -f ${log_file_name} ]; then
        rm "${log_file_name}"
    fi

    log "-- Start script: ${script_name}" "end_user"
    display_var root_path "${root_path}"
    if [ "${is_default_output_path}" == "True" ]; then
        log "No output_path variable defined set to default."
    fi
    display_var output_path "${output_path}"
    if [ "${is_default_log_file_name}" == "True" ]; then
        log "No log_file_name variable defined set to default."
    fi
    display_var log_file_name "${log_file_name}"
}

function _init_log() {
    if [ ! -d ${output_path} ]; then
        mkdir -p ${output_path}
    fi
}

function start_script() {
    script_name="$(basename $0)"
    root_path="$(realpath $(dirname $0))"

    if [ -z ${output_path} ]; then
        is_default_output_path="True"
        output_path="${root_path}"
    fi

    if [ -z ${log_file_name} ]; then
        local name=$(echo ${script_name} | cut -f1 -d'.')
        log_file_name="${output_path}/${name}.log"
        is_default_log_file_name="True"
    fi

    _init_log

    _start_script
}

function end_script() {
    result=$1

    log "-- Logs available at: ${log_file_name}" "end_user"
    if [ "${result}" == 0 ]; then
        log "-- Script ${script_name} ended Successfully" "end_user"
    else
        log "-- Script ${script_name} FAILED with status ${result}" "end_user"
    fi
    exit ${result}
}
