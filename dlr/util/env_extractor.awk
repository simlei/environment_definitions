# config: "EXTRACTOR_LOG_FILE marks where the unfiltered output goes"
#         "EXTRACTOR_OUTFILE" marks the output file for env.variables

BEGIN {
    CFGOUT = ENVIRON["EXTRACTOR_OUTFILE"]
    opened=0
}
{
    print $0 > ENVIRON["EXTRACTOR_LOG_FILE"]
#     if (match($0,/export LN_MANAGER=([0-9\.:]*)/,m)) 
#     {
#         print m[0] > CFGOUT;
#         opened = 1;
#         #close(CFGOUT);
#         print ">>> Extracted " m[0] " as LN instance!"
#     }
#     if (match($0,/export PYTHONPATH=(.*)/,m)) 
#     {
#         print m[0] > CFGOUT;
#         opened = 1;
#         #close(CFGOUT);
#         print ">>> Extracted " m[0] " as PYTHONPATH!"
#     }
    if (match($0,/export ([A-Za-z][a-zA-Z0-9_]*)=(.*)/,m)) 
    {
        print m[0] > CFGOUT;
        opened = 1;
        #close(CFGOUT);
        print ">>> Extracted " m[1]
    }
    if (! match($0,/export .*/,m)) 
    {
        if(opened == 1) 
        {
            close(CFGOUT);
            opened = 0;
            print ">>> Closed environment file!"
        }
    }
}
