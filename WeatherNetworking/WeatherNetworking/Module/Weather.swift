//
//  WeatherResponse.swift
//  WeatherNetworking
//
//  Created by Zakaria El Mouatassim on 22/06/2023.
//

import Foundation

public struct WeatherResponse: Codable {
    public let cod: String
    public let message, cnt: Int
    public let list: [List]
    public let city: City
}

// MARK: - City
public struct City: Codable {
    public let id: Int
    public let name: String
    public let coord: Coord
    public let country: String
    public let population, timezone, sunrise, sunset: Int
}

// MARK: - Coord
public struct Coord: Codable {
    public let lat, lon: Double
}

// MARK: - List
public struct List: Codable {
    public let dt: Int
    public let main: Main
    public let weather: [Weather]
    public let clouds: Clouds
    public let wind: Wind
    public let visibility: Int
    public let pop: Double
    public let rain: Rain?
    public let sys: Sys
    public let dtTxt: String

    enum CodingKeys: String, CodingKey {
        case dt, main, weather, clouds, wind, visibility, pop, rain, sys
        case dtTxt = "dt_txt"
    }
}

// MARK: - Clouds
public struct Clouds: Codable {
    public let all: Int
}

// MARK: - Main
public struct Main: Codable {
    public let temp, feelsLike, tempMin, tempMax: Double
    public let pressure, seaLevel, grndLevel, humidity: Int
    public let tempKf: Double

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
        case humidity
        case tempKf = "temp_kf"
    }
}

// MARK: - Rain
public struct Rain: Codable {
    public let the3H: Double

    enum CodingKeys: String, CodingKey {
        case the3H = "3h"
    }
}

// MARK: - Sys
public struct Sys: Codable {
    public let pod: String
}

// MARK: - Weather
public struct Weather: Codable {
    public let id: Int
    public let main, description, icon: String
}

// MARK: - Wind
public struct Wind: Codable {
    public let speed: Double
    public let deg: Int
    public let gust: Double
}
