//
//  WeatherManagerTests.swift
//  WeatherManagerTests
//
//  Created by Zakaria El Mouatassim on 21/06/2023.
//

import XCTest
@testable import WeatherNetworking

final class WeatherManagerTests: XCTestCase {

    func testFetchWeatherData_Success() {
        let expectation = XCTestExpectation(description: "Weather data fetch successful")
        WeatherManager.shared.fetchWeatherData(for: "Paris") { (weatherData, error) in
            XCTAssertNotNil(weatherData)
            XCTAssertNil(error)
            XCTAssertEqual(weatherData?.city.name, "Paris")

            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 5.0)
    }

    func testFetchWeatherData_Error() {
        let expectation = XCTestExpectation(description: "Weather data fetch with error")
        WeatherManager.shared.fetchWeatherData(for: "InvalidCity") { (weatherData, error) in
            XCTAssertNil(weatherData)
            XCTAssertNotNil(error)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 5.0)
    }
}
