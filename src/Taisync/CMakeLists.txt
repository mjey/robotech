set(SOURCES
        TaisyncHandler.cc
        TaisyncManager.cc
        TaisyncSettings.cc
        )
if(ANDROID) # Should also be expanded to iOS
set(SOURCES
        ${SOURCES}
        TaisyncTelemetry.cc
        TaisyncVideoReceiver.cc
        )
endif()

find_package(Qt6 COMPONENTS Core REQUIRED)
find_package(Qt6 COMPONENTS Network REQUIRED)

add_library(Taisync ${SOURCES})
target_link_libraries(Taisync PUBLIC FactSystem)
target_link_libraries(Taisync PUBLIC Settings)
target_link_libraries(Taisync PUBLIC Qt6::Core)
target_link_libraries(Taisync PUBLIC Qt6::Network)
target_include_directories(Taisync PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
