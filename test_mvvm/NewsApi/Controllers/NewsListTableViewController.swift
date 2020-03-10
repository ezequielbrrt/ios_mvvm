//
//  NewsListTableViewController.swift
//  test_mvvm
//
//  Created by beTech CAPITAL on 11/19/19.
//  Copyright © 2019 Ezequiel Barreto. All rights reserved.
//

import Foundation
import UIKit

class NewsListTableViewController: UITableViewController{
 
    private var articleListVM: ArticleListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    private func setup(){
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=3b3401ce295a40ebb6e30d804cd6048b")!
        
        Webservice().getArticles(url: url){ articles in
            
            if articles != nil {
                self.articleListVM = ArticleListViewModel(articles: articles!)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            
            
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.articleListVM == nil ? 0 : self.articleListVM.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListVM.numberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else{
            fatalError("ArticleTableViewCell not found")
        }
        
        let articleVM = self.articleListVM.articleAtIndex(indexPath.row)
        cell.titleLabel.text = articleVM.title
        cell.descriptionLabel.text = articleVM.description
        
        return cell
    }
    
}
