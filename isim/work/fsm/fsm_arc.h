////////////////////////////////////////////////////////////////////////////////
//   ____  ____   
//  /   /\/   /  
// /___/  \  /   
// \   \   \/  
//  \   \        Copyright (c) 2003-2004 Xilinx, Inc.
//  /   /        All Right Reserved. 
// /---/   /\     
// \   \  /  \  
//  \___\/\___\
////////////////////////////////////////////////////////////////////////////////

#ifndef H_Work_fsm_fsm_arc_H
#define H_Work_fsm_fsm_arc_H
#ifdef __MINGW32__
#include "xsimMinGW.h"
#else
#include "xsim.h"
#endif


class Work_fsm_fsm_arc: public HSim__s6 {
public:

    HSim__s1 SE[9];

  HSimEnumType States;
    HSim__s1 SA[2];
    Work_fsm_fsm_arc(const char * name);
    ~Work_fsm_fsm_arc();
    void constructObject();
    void constructPorts();
    void reset();
    void architectureInstantiate(HSimConfigDecl* cfg);
    virtual void vhdlArchImplement();
};



HSim__s6 *createWork_fsm_fsm_arc(const char *name);

#endif
