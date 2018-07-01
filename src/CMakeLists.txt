set(torch_SRCS
    main.cpp
    )

qt5_add_resources(RESOURCES resources.qrc)
add_executable(torch ${torch_SRCS} ${RESOURCES})
target_link_libraries(torch Qt5::Core  Qt5::Qml Qt5::Quick Qt5::Svg Qt5::Multimedia Qt5::QuickControls2)
install(TARGETS torch ${KF5_INSTALL_TARGETS_DEFAULT_ARGS})
