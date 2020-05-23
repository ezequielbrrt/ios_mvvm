//
//  WeatherCell.swift
//  test_mvvm
//
//  Created by beTech CAPITAL on 24/03/20.
//  Copyright © 2020 Ezequiel Barreto. All rights reserved.
//

import Foundation

import UIKit

class WeatherCell: UITableViewCell{
    @IBOutlet weak var cityNameLabel: UILabel?
    @IBOutlet weak var temperatureLabel: UILabel?
   
    func configure(_ vm: WeatherViewModel){
        self.cityNameLabel?.text = vm.name.value
        self.temperatureLabel?.text = vm.currentTemperature.temperature.value.formatAsDegree
    }
}
