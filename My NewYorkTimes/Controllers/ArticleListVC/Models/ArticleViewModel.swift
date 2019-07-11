//
//  ArticleViewModel.swift
//  My NewYorkTimes
//
//  Created by Darshan on 08/07/19.
//  Copyright © 2019 Darshan. All rights reserved.
//

import UIKit

protocol ArticleModelProtocol {
    var dataModel: [ArticleDataModelProtocol] {get set}
    
    func getAllArticle(search: String, page: Int, callback: @escaping ((Bool) -> ()))
    func checkIfScrollViewAtBottom(_ scrollView: UIScrollView) -> Bool
}

class ArticleViewModel: ArticleModelProtocol {
    
    var dataModel: [ArticleDataModelProtocol]
    var networkManager: NetworkManager!
    
    init() {
        self.networkManager = NetworkManager()
        dataModel = []
    }
    
    func getAllArticle(search: String, page: Int, callback: @escaping ((Bool) -> ())) {
        networkManager.getArticles(search: search, page: page) { (articles, error) in
            
            guard error == nil else {
                print(error?.debugDescription ?? "")
                return
            }
            self.dataModel.append(contentsOf: articles ?? [])
            callback(true)
        }
    }
    
    func checkIfScrollViewAtBottom(_ scrollView: UIScrollView) -> Bool {
        
        let threshold:CGFloat = 100.0
        let contentOffset = scrollView.contentOffset.y
        let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height;
        return (maximumOffset - contentOffset <= threshold) && (maximumOffset - contentOffset != -5.0)
    }
}
