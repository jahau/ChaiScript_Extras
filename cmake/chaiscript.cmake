set(CHAISCRIPT_VERSION 5.8.6)
find_package(chaiscript ${CHAISCRIPT_VERSION} QUIET)

if (NOT chaiscript_FOUND)
  include(FetchContent)

  FetchContent_Declare(
    chaiscript
    GIT_REPOSITORY https://github.com/ChaiScript/ChaiScript.git
    GIT_TAG v${CHAISCRIPT_VERSION}
  )

  FetchContent_GetProperties(chaiscript)
  if (NOT chaiscript_POPULATED)
    set(FETCHCONTENT_QUIET NO)
    FetchContent_Populate(chaiscript)

    set(BUILD_SAMPLES OFF CACHE BOOL "" FORCE)
    set(BUILD_MODULES ON CACHE BOOL "" FORCE)
    set(BUILD_TESTING OFF CACHE BOOL "" FORCE)
    set(BUILD_LIBFUZZ_TESTER OFF CACHE BOOL "" FORCE)

    add_subdirectory(${chaiscript_SOURCE_DIR} ${chaiscript_BINARY_DIR})
  endif()
endif()
