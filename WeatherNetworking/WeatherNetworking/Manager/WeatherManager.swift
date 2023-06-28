//
//  WeatherManager.swift
//  WeatherNetworking
//
//  Created by Zakaria El Mouatassim on 22/06/2023.
//

import Foundation

public class WeatherManager {
    private let apiKey = "d80fc7ed224416c9e6ba9dec5523988b"
    private let baseUrl = "https://api.openweathermap.org/data/2.5/forecast"
    private let weatherDataPersistence: WeatherDataPersistenceType
    private let totalItemCount: Int = 12
    public static let shared = WeatherManager()

    private init() {
        weatherDataPersistence = UserDefaultsWeatherDataPersistence()
    }

    public func fetchWeatherData(for city: String, completion: @escaping (WeatherResponse?, Error?) -> Void) {
        if let cachedWeatherData = weatherDataPersistence.getCachedWeatherData(for: city) {
            // Return cached data if available
            completion(cachedWeatherData, nil)
            return
        }

        guard let url = makeWeatherDataURL(for: city) else {
            let error = NSError(domain: "CityURLError", code: 0, userInfo: nil)
            completion(nil, error)
            return
        }

        fetchData(from: url) { (data, error) in
            if let error = error {
                completion(nil, error)
            } else if let data = data {
                if let weatherData = self.decodeWeatherData(data: data) {
                    self.cacheWeatherData(city, weatherData: weatherData)
                    completion(weatherData, nil)
                } else {
                    let decodingError = NSError(domain: "WeatherDataDecodingError", code: 0, userInfo: nil)
                    completion(nil, decodingError)
                }
            }
        }
    }

    private func makeWeatherDataURL(for city: String) -> URL? {
        guard let encodedCity = city.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            return nil
        }

        return URL(string: "\(baseUrl)?q=\(encodedCity)&apiKey=\(apiKey)&units=metric&cnt=\(totalItemCount)")
    }

    private func fetchData(from url: URL, completion: @escaping (Data?, Error?) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            completion(data, error)
        }
        task.resume()
    }

    private func decodeWeatherData(data: Data) -> WeatherResponse? {
        let decoder = JSONDecoder()
        do {
            let weatherData = try decoder.decode(WeatherResponse.self, from: data)
            return weatherData
        } catch {
            print("Error parsing weather data: \(error.localizedDescription)")
        }
        return nil
    }

    private func cacheWeatherData(_ city: String, weatherData: WeatherResponse) {
        weatherDataPersistence.cacheWeatherData(for: city, weatherData: weatherData)
    }
}
