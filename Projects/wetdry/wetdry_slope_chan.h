/*
** svn $Id: shoreface.h 139 2008-01-10 00:17:29Z arango $
*******************************************************************************
** Copyright (c) 2002-2008 The ROMS/TOMS Group                               **
**   Licensed under a MIT/X style license                                    **
**   See License_ROMS.txt                                                    **
*******************************************************************************
**
** Options for Shore Face Planar Beach Test Case.
**
** Application flag:   WETDRY_SLOPE_CHAN
*/

#define WET_DRY
#define OUT_DOUBLE
#undef  UV_ADV
#define TS_U3HADVECTION
#define DJ_GRADPS
#undef  SALINITY
#undef  SOLVE3D
#define SPLINES
#define NORTHERN_WALL
#define SOUTHERN_WALL
#define WESTERN_WALL
#define EAST_FSCLAMPED
#define EAST_M2REDUCED
#define FSOBC_REDUCED
#define EAST_M3GRADIENT

#define ANA_INITIAL
#define ANA_GRID
#define ANA_FSOBC
#define ANA_M2OBC
#define ANA_SMFLUX
#define UV_LDRAG

#ifdef SOLVE3D
# define ANA_STFLUX
# define ANA_SSFLUX
# define ANA_BPFLUX
# define ANA_BTFLUX
# define ANA_BSFLUX
# define ANA_SPFLUX
# define ANA_SRFLUX
# define ANA_MASK
# undef  ANA_VMIX

# define GLS_MIXING
# if defined GLS_MIXING
#  define KANTHA_CLAYSON
#  define N2S2_HORAVG
# endif

#endif