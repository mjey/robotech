
set(EXTRA_SRC)
if(BUILD_TESTING)
	list(APPEND EXTRA_SRC
		LogDownloadTest.cc
	)
endif()

add_library(AnalyzeView
	ExifParser.cc
	GeoTagController.cc
	LogDownloadController.cc
	MavlinkConsoleController.cc
	PX4LogParser.cc
	ULogParser.cc
	${EXTRA_SRC}
)

target_link_libraries(AnalyzeView
	PUBLIC
		Qt5::Location
		Qt5::SerialPort
		Qt5::TextToSpeech
		Qt5::Widgets

		qgc
)

target_include_directories(AnalyzeView PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
