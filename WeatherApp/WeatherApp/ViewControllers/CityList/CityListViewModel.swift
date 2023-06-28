//
//  CityListViewModel.swift
//  WeatherApp
//
//  Created by Zakaria El Mouatassim on 24/06/2023.
//

import Foundation

class CityListViewModel {
    var cities: [String] = []
    let lastSearchText = "Recherches récentes"
    let navigationTitle = "Météo"

    init() {}
    
    func fetchCities() {
        // Retrieve the list of cities from UserDefaults
        cities = CityManager.getCities()
    }
}
