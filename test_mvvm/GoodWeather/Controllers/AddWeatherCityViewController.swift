//
//  AddWeatherCityViewController.swift
//  test_mvvm
//
//  Created by beTech CAPITAL on 24/03/20.
//  Copyright © 2020 Ezequiel Barreto. All rights reserved.
//

import Foundation
import UIKit

protocol AddWeatherDelegate{
    func addWeatherDidSave(vm: WeatherViewModel)
}
class AddWeatherCityViewController: UIViewController{
    
    var delegate: AddWeatherDelegate?
    
    @IBOutlet weak var cityNameTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var zipCodeTextField: UITextField!
    
    @IBAction func saveCityButtonPressed(){
        if let city = cityNameTextField.text {
            let weatherURL = URL(string: "https://samples.openweathermap.org/data/2.5/weather?q=\(city)&appid=91d86c6cfdcc208a553023b5acdea74b")!
            
            let weatherResource = ResourceW<WeatherViewModel>(url: weatherURL){ data in
                
                let weatherVM = try? JSONDecoder().decode(WeatherViewModel.self, from: data)
                return weatherVM
            }
            
            WebService().load(resource: weatherResource){[weak self] result in
                if let weatherVM = result{
                    if let delegate = self?.delegate{
                        delegate.addWeatherDidSave(vm: weatherVM)
                        self?.dismiss(animated: true, completion: nil)
                    }
                }
            }
        }
    }
    
    @IBAction func close(){
        self.dismiss(animated: true, completion: nil)
    }
}
