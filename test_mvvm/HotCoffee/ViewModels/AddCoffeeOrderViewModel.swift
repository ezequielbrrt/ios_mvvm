//
//  AddCoffeeOrderViewModel.swift
//  test_mvvm
//
//  Created by beTech CAPITAL on 14/02/20.
//  Copyright © 2020 Ezequiel Barreto. All rights reserved.
//

import Foundation

struct AddCoffeeOrderViewModel{
    var name: String?
    var email: String?
    
    var selectedType: String?
    var selectedSize: String?
    
    var types: [String]{
        return CoffeeType.allCases.map { $0.rawValue.capitalized }
    }
    
    var sizes: [String]{
        return CoffeeSize.allCases.map { $0.rawValue.capitalized }
    }
}
