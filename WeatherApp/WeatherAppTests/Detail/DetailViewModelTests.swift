//
//  DetailViewModelTests.swift
//  WeatherAppTests
//
//  Created by Zakaria El Mouatassim on 28/06/2023.
//

import XCTest
@testable import WeatherApp

final class DetailViewModelTests: XCTestCase {

    var viewModel: DetailViewModel!
    var view: DetailViewModelDelegateMock!

    func testFetchWeatherData_SuccessfulRequest() {
        let expectation = XCTestExpectation(description: "Successful request expectation")
        let mockDelegate = DetailViewModelDelegateMock(expectation: expectation)
        let detailViewModel = DetailViewModel(delegate: mockDelegate, cityName: "Paris")

        // Call the fetchWeatherData method
        detailViewModel.fetchWeatherData()

        // Wait for the expectation to be fulfilled
        wait(for: [expectation], timeout: 5.0)

        // Perform assertions to verify the expected behavior
        XCTAssertTrue(mockDelegate.didStartRequestCalled)
        XCTAssertNil(mockDelegate.error)
        XCTAssertNotNil(mockDelegate.weatherResponse)
    }

    func testFetchWeatherData_FailedRequest() {
           let expectation = XCTestExpectation(description: "Failed request expectation")
           let mockDelegate = DetailViewModelDelegateMock(expectation: expectation)
           let detailViewModel = DetailViewModel(delegate: mockDelegate, cityName: "InvalidCity")

           // Call the fetchWeatherData method
           detailViewModel.fetchWeatherData()

           // Wait for the expectation to be fulfilled
           wait(for: [expectation], timeout: 5.0)

           // Perform assertions to verify the expected behavior
           XCTAssertTrue(mockDelegate.didStartRequestCalled)
           XCTAssertNotNil(mockDelegate.error)
           XCTAssertNil(mockDelegate.weatherResponse)
       }
}
