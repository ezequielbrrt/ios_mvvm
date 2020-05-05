//
//  AddWeatherCityViewController.swift
//  test_mvvm
//
//  Created by beTech CAPITAL on 24/03/20.
//  Copyright © 2020 Ezequiel Barreto. All rights reserved.
//

import Foundation
import UIKit

class AddWeatherCityViewController: UIViewController{
    @IBOutlet weak var cityNameTextField: UITextField!
    
    @IBAction func saveCityButtonPressed(){
        if let city = cityNameTextField.text {
            let weatherURL = URL(string: "https://samples.openweathermap.org/data/2.5/weather?q=\(city),uk&appid=439d4b804bc8187953eb36d2a8c26a02")!
            
            let weatherResource = ResourceW<Any>(url: weatherURL){ data in
                return data
            }
            
            WebService().load(resource: weatherResource){ result in
                
            }
        }
    }
    
    @IBAction func close(){
        self.dismiss(animated: true, completion: nil)
    }
}
