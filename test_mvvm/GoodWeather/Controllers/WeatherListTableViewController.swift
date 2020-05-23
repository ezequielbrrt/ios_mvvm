//
//  WeatherListTableViewController.swift
//  test_mvvm
//
//  Created by beTech CAPITAL on 24/03/20.
//  Copyright © 2020 Ezequiel Barreto. All rights reserved.
//

import Foundation
import UIKit

class WeatherListTableViewController: UITableViewController, AddWeatherDelegate{
    
    private var weatherListViewModel = WeatherListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.weatherListViewModel.numberOfRows(section)
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as! WeatherCell
        
        let weatherVM = self.weatherListViewModel.modelAt(indexPath.row)
        cell.configure(weatherVM)
        
        return cell
    }
    
    func addWeatherDidSave(vm: WeatherViewModel) {
        self.weatherListViewModel.addWeatherViewModel(vm)
        self.tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "AddWeatherCityViewController"{
            prepareSegueForAddWeatherCity(segue: segue)
        }else if segue.identifier == "SettingsTableViewController"{
            prepareSegueSettingsWeather(segue: segue)
        }else if segue.identifier == "WeatherDetailsViewController"{
            prepareSegueForWeatherDetailsViewController(segue: segue)
        }
    
    }
    
    private func prepareSegueForWeatherDetailsViewController(segue: UIStoryboardSegue){

        
        guard let weatherDetailsVC = segue.destination as? WeatherDetailsViewController, let indexPath = self.tableView.indexPathForSelectedRow else{
            fatalError("AddWeatherCityViewController not found")
            return
        }
        
        let weatherVM = self.weatherListViewModel.modelAt(indexPath.row)
        weatherDetailsVC.weatherViewModel = weatherVM
        
    }
    
    private func prepareSegueForAddWeatherCity(segue: UIStoryboardSegue){
        guard let nav = segue.destination as? UINavigationController else{
            fatalError("NavigationController not found")
        }
        
        guard let addWeatherCityVC = nav.viewControllers.first as? AddWeatherCityViewController else{
            fatalError("AddWeatherCityViewController not found")
        }
        
        addWeatherCityVC.delegate = self
    }
    
    private func prepareSegueSettingsWeather(segue: UIStoryboardSegue){
        guard let nav = segue.destination as? UINavigationController else{
            fatalError("NavitationController not found")
            
        }
        
        guard let settingsTVC = nav.viewControllers.first as? SettingsTableViewController else{
            fatalError("AddWeatherCityViewController not found")
        }
        
        settingsTVC.delegate = self
    }
}

extension WeatherListTableViewController: SettingsDelegate{
    func settingsDone(vm: SettingsViewModel) {
        self.weatherListViewModel.updateUnit(to: vm.selectedUnit)
        self.tableView.reloadData()
    }
}
