//
//  Article.swift
//  test_mvvm
//
//  Created by beTech CAPITAL on 11/19/19.
//  Copyright © 2019 Ezequiel Barreto. All rights reserved.
//

import Foundation

struct ArticleList: Decodable{
    let articles: [Article]
}

struct Article: Decodable {
    let title: String
    let description: String?
}

