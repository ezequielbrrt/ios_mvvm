//
//  WeatherListViewModel.swift
//  test_mvvm
//
//  Created by beTech CAPITAL on 05/05/20.
//  Copyright © 2020 Ezequiel Barreto. All rights reserved.
//

import Foundation

struct WeatherListViewModel{
    private var weatherViewModel = [WeatherViewModel]()
    
}


struct WeatherViewModel: Decodable{
    let name: String
    let currentTemperature: TemperatureViewModel
    
    private enum CodingKeys: String, CodingKey{
        case name
        case currentTemperature = "main"
    }
}

struct TemperatureViewModel: Decodable{
    let temperature: Double
    let temperatureMin: Double
    let temperatureMax: Double
    
    private enum CodingKeys: String, CodingKey{
        case temperature = "temp"
        case temperatureMin = "temp_min"
        case temperatureMax = "temp_max"
    }
}
