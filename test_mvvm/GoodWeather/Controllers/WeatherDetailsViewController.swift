//
//  WeatherDetailsViewController.swift
//  test_mvvm
//
//  Created by beTech CAPITAL on 22/05/20.
//  Copyright © 2020 Ezequiel Barreto. All rights reserved.
//

import UIKit
import Foundation

class WeatherDetailsViewController: UIViewController{
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var currentTemperatureLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var minTempLAbel: UILabel!
    
    var weatherViewModel: WeatherViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpVMBinding()
    }
    
    private func setUpVMBinding(){
        if let weatherVM = self.weatherViewModel{
            weatherVM.name.bind {self.cityNameLabel.text = $0}
            weatherVM.currentTemperature.temperature.bind{self.currentTemperatureLabel.text = $0.formatAsDegree}
            //weatherVM.currentTemperature.temperature.bind{self.currentTemperatureLabel.text = $0.formatAsDegree}
        }
        
        // change the value after few seconds
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
            self.weatherViewModel?.name.value = "boston"
        }
    }
}
