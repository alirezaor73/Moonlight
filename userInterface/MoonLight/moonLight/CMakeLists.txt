cmake_minimum_required(VERSION 3.16)

project(moonLight VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 COMPONENTS Core Quick Gui Widgets REQUIRED)

qt_standard_project_setup()

qt_add_executable(appmoonLight
    main.cpp
    networkmanager.h networkmanager.cpp
)

qt_add_qml_module(appmoonLight
    URI moonLight
    VERSION 1.0
    QML_FILES Main.qml
    QML_FILES MoonSwitch.qml
    QML_FILES MoonInput.qml
    QML_FILES MoonComboBox.qml
    QML_FILES MoonButton.qml
    QML_FILES MoonSpinBox.qml
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appmoonLight PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appmoonLight
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appmoonLight PRIVATE Qt6::Core Qt6::Quick Qt6::Gui Qt6::Widgets)

include(GNUInstallDirs)
install(TARGETS appmoonLight
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
