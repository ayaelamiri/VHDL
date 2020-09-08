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

#ifndef H_Work_gcd_gcd_arc_H
#define H_Work_gcd_gcd_arc_H
#ifdef __MINGW32__
#include "xsimMinGW.h"
#else
#include "xsim.h"
#endif


class Work_gcd_gcd_arc: public HSim__s6 {
public:

    HSim__s1 SE[6];

    HSim__s1 SA[13];
    Work_gcd_gcd_arc(const char * name);
    ~Work_gcd_gcd_arc();
    void constructObject();
    void constructPorts();
    void reset();
    void architectureInstantiate(HSimConfigDecl* cfg);
    virtual void vhdlArchImplement();
};



HSim__s6 *createWork_gcd_gcd_arc(const char *name);

#endif
