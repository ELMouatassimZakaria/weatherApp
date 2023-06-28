//
//  AddCityViewModel.swift
//  WeatherApp
//
//  Created by Zakaria El Mouatassim on 24/06/2023.
//

import Foundation

class AddCityViewModel {

    func saveCity(_ cityName: String) {
        CityManager.saveCity(cityName)
    }
}
