find_package(PkgConfig)

PKG_CHECK_MODULES(PC_GR_TTLTOOLS gnuradio-ttltools)

FIND_PATH(
    GR_TTLTOOLS_INCLUDE_DIRS
    NAMES gnuradio/ttltools/api.h
    HINTS $ENV{TTLTOOLS_DIR}/include
        ${PC_TTLTOOLS_INCLUDEDIR}
    PATHS ${CMAKE_INSTALL_PREFIX}/include
          /usr/local/include
          /usr/include
)

FIND_LIBRARY(
    GR_TTLTOOLS_LIBRARIES
    NAMES gnuradio-ttltools
    HINTS $ENV{TTLTOOLS_DIR}/lib
        ${PC_TTLTOOLS_LIBDIR}
    PATHS ${CMAKE_INSTALL_PREFIX}/lib
          ${CMAKE_INSTALL_PREFIX}/lib64
          /usr/local/lib
          /usr/local/lib64
          /usr/lib
          /usr/lib64
          )

include("${CMAKE_CURRENT_LIST_DIR}/gnuradio-ttltoolsTarget.cmake")

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(GR_TTLTOOLS DEFAULT_MSG GR_TTLTOOLS_LIBRARIES GR_TTLTOOLS_INCLUDE_DIRS)
MARK_AS_ADVANCED(GR_TTLTOOLS_LIBRARIES GR_TTLTOOLS_INCLUDE_DIRS)
