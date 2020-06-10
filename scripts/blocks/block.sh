function init {
    log "-- Initializing ${blockname}..."
    init_${blockname}
    log "--${blockname} Initialized."
}

function process {
    log "-- Processing ${blockname}..."
    process_${blockname}
    log "--${blockname} Processed."
}

function test_result {
    log "-- Processing ${blockname}..."
    process_${blockname}
    log "--${blockname} Processed."
}

function execute {
    log "---------------------------"
    log "Execute ${blockname} block:"
    init
    process
    test_result
    log "---------------------------"
}
