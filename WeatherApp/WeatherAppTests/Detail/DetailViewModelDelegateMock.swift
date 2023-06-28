//
//  DetailViewModelDelegateMock.swift
//  WeatherAppTests
//
//  Created by Zakaria El Moutassim on 28/06/2023.
//

import Foundation
import XCTest
@testable import WeatherApp
@testable import WeatherNetworking

class DetailViewModelDelegateMock: DetailViewModelDelegate {
    var didStartRequestCalled = false
    var weatherResponse: WeatherResponse?
    var error: Error?
    let expectation: XCTestExpectation

    init(expectation: XCTestExpectation) {
        self.expectation = expectation
    }
    func willMakeRequest() {
        didStartRequestCalled = true
    }
    func didMakeSuccessfullRequest(result: WeatherResponse) {
        weatherResponse = result
        expectation.fulfill()
    }

    func didFinishRequestWithError(error: Error) {
        self.error = error
        expectation.fulfill()
    }
}
