//
//  CityManager.swift
//  WeatherApp
//
//  Created by Zakaria El Moutassim on 22/06/2023.
//

import Foundation

final class CityManager {
    
    private static let citiesKey = "SavedCities"

    static func saveCity(_ city: String) {
        var savedCities = getCities()
        savedCities.append(city)
        UserDefaults.standard.set(savedCities, forKey: citiesKey)
    }
    
    static func getCities() -> [String] {
        guard let savedCities = UserDefaults.standard.array(forKey: citiesKey) as? [String] else {
            return []
        }
        return savedCities
    }
}
