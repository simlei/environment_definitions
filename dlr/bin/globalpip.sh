#!/bin/bash
eval "$(rmpm_do env --env-format embed_sh sw.common.pip2 | xargs)"; pip2 $@
