#ifndef BASIS_SET_HPP
#define BASIS_SET_HPP

/* -----------------------------------------------------------------------------
   Definition of basis functions
   ----------------------------------------------------------------------------- */
#define MAXGAUSS  32

typedef struct
     { int    l;            /* angular momentum quantum number for the shell */
       int    lstart;       /* where the shell starts in the basis */
       int    ng;           /* Number of components */
       double a[MAXGAUSS];  /* orbital exponents */
       double d[MAXGAUSS];  /* expansion coefficients */
     } BFNGauss;



#endif
