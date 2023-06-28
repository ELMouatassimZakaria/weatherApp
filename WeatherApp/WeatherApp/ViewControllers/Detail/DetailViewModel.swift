//
//  File.swift
//  WeatherApp
//
//  Created by Zakaria El Mouatassim on 24/06/2023.
//

import Foundation
import WeatherNetworking

protocol DetailViewModelDelegate: AnyObject {
    func willMakeRequest()
    func didMakeSuccessfullRequest(result: WeatherResponse)
    func didFinishRequestWithError(error: Error)
}

class DetailViewModel {
    var delegate: DetailViewModelDelegate!
    var results: WeatherResponse!
    let weatherFetcher = WeatherManager.shared
    let cityName: String

    init(delegate: DetailViewModelDelegate? = nil, cityName: String){
        self.delegate = delegate
        self.cityName = cityName
    }

    func fetchWeatherData() {
        self.delegate.willMakeRequest()

        weatherFetcher.fetchWeatherData(for: cityName) { [weak self] (weatherData, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                self?.delegate.didFinishRequestWithError(error: error)
            } else if let weatherData = weatherData {
                DispatchQueue.main.async {
                    self?.delegate.didMakeSuccessfullRequest(result: weatherData)
                }
            }
        }
    }
}
