#define MAXGAUSS  32

typedef struct
     { int    l;            /* angular momentum quantum number for the shell */
       int    lstart;       /* where the shell starts in the basis */
       int    ng;           /* Number of components */
       double a[MAXGAUSS];  /* orbital exponents */
       double d[MAXGAUSS];  /* expansion coefficients */
     } Basis;

static const char LLABEL[9][2] = {"s", "p", "d", "f", "g", "h", "i", "j", "k" };

// ---------------------------------------------------------------------
//   Dimensions of cartesian and spherical harmonics shells of functions
//   for a given L
// ---------------------------------------------------------------------
static const int LDIM[20] = { 1, 3, 5,  7,  9, 11, 13, 15, 17, 19, 21, 23, 25, 27, 29, 31, 33, 35, 37};
static const int CDIM[20] = { 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, 66, 78, 91, 105, 120, 136, 153, 171, 190, 210};