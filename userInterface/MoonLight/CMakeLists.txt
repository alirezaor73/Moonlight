
cmake_minimum_required(VERSION 3.12)

project(moonlight LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CMAKE_CXX_EXTENSIONS ON)

find_package(Qt6 COMPONENTS Core Quick Gui REQUIRED)

add_executable(moonlight
        main.cpp
        qml.qrc
        resources.qrc
        networkmanager.h networkmanager.cpp
        calibrator.h calibrator.cpp
        )


target_link_libraries(moonlight
        PRIVATE Qt6::Core Qt6::Quick Qt6::Gui
        )

set(QML_IMPORT_PATH "${CMAKE_SOURCE_DIR}/Components")
set(QML_IMPORT_PATH "${CMAKE_SOURCE_DIR}/Pages")



