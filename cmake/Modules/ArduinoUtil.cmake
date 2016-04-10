function(install_absolute baseDir destDir matchPattern)
    file(REMOVE_RECURSE ${CMAKE_CURRENT_BINARY_DIR}/${destDir})
    file(COPY ${baseDir}/
        DESTINATION ${CMAKE_CURRENT_BINARY_DIR}/${destDir}
        FILES_MATCHING PATTERN ${matchPattern}
    )
    install(DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/${destDir}/
        DESTINATION ${destDir}
    )
endfunction()
