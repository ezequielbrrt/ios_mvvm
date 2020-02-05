//
//  Webservice.swift
//  test_mvvm
//
//  Created by beTech CAPITAL on 11/19/19.
//  Copyright © 2019 Ezequiel Barreto. All rights reserved.
//

import Foundation


class Webservice {
    
    func getArticles(url: URL, completion: @escaping ([Article]?) -> ()){
        
        URLSession.shared.dataTask(with: url){ data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            }else if let data = data{
                
                let articlesList = try? JSONDecoder().decode(ArticleList.self, from:data)
                
                if articlesList != nil{
                    completion(articlesList?.articles)
                }

            }
            
        }.resume()
    }
}
