//
//  WeatherDataPersistenceType.swift
//  WeatherNetworking
//
//  Created by Zakaria El Mouatassim on 28/06/2023.
//

import Foundation

protocol WeatherDataPersistenceType {
    func cacheWeatherData(for city: String, weatherData: WeatherResponse)
    func getCachedWeatherData(for city: String) -> WeatherResponse?

}

final class UserDefaultsWeatherDataPersistence: WeatherDataPersistenceType {
    private let userDefaults = UserDefaults.standard
    private let weatherDataKey = "WeatherData"

    func cacheWeatherData(for city: String, weatherData: WeatherResponse) {
        var cachedData = getCachedDataDictionary()
        cachedData[city] = weatherData

        do {
            let encodedData = try JSONEncoder().encode(cachedData)
            userDefaults.set(encodedData, forKey: weatherDataKey)
        } catch {
            print("Error caching weather data: \(error.localizedDescription)")
        }
    }

    func getCachedWeatherData(for city: String) -> WeatherResponse? {
        let cachedData = getCachedDataDictionary()
        return cachedData[city]
    }

    private func getCachedDataDictionary() -> [String: WeatherResponse] {
        if let encodedData = userDefaults.data(forKey: weatherDataKey) {
            do {
                let cachedData = try JSONDecoder().decode([String: WeatherResponse].self, from: encodedData)
                return cachedData
            } catch {
                print("Error retrieving cached weather data: \(error.localizedDescription)")
            }
        }
        return [:]
    }
}
