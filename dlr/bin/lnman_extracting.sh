#!/bin/bash 
$LaN_MAN --log-level debug -c "$LaN_CFG_FILE" --start "$LaN_PROCESS" | awk -f $LOCALBASH_DLR_DIR/util/env_extractor.awk
