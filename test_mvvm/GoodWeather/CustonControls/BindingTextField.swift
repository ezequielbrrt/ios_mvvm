//
//  BindingTextField.swift
//  test_mvvm
//
//  Created by beTech CAPITAL on 14/05/20.
//  Copyright © 2020 Ezequiel Barreto. All rights reserved.
//

import Foundation
import UIKit

class BindingTextField: UITextField{
    
    var textChangeClosure: (String) -> () = {_ in}
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()

    }
    
    func bind(callback: @escaping (String) -> ()){
        self.textChangeClosure = callback
    }
    
    private func commonInit(){
        self.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(_ textfield: UITextField){
        if let text = textfield.text{
            self.textChangeClosure(text)
        }
        
    }

}
