add_custom_target(autopilot)

function(declare_autopilot_test TEST_NAME TEST_SUITE WORKING_DIR)
    add_custom_target(autopilot-${TEST_NAME}
        COMMAND LANG=C UBUNTU_ICON_THEME=suru QML2_IMPORT_PATH=${SHELL_INSTALL_QML}/mocks autopilot run ${TEST_SUITE}
        WORKING_DIRECTORY ${WORKING_DIR}
        DEPENDS fake_install
    )

    add_custom_target(fake_install
        COMMAND cmake --build ${CMAKE_BINARY_DIR} --target install
    )

    add_dependencies(autopilot autopilot-${TEST_NAME})
endfunction()
