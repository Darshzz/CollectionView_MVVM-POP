//
//  ArticleListVC.swift
//  My NewYorkTimes
//
//  Created by Darshan on 08/07/19.
//  Copyright © 2019 Darshan. All rights reserved.
//

import UIKit

class ArticleListVC: UIViewController {

    // Properties
    @IBOutlet weak var collectionView: UICollectionView!
    
    var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        let width = UIScreen.main.bounds.size.width
        layout.estimatedItemSize = CGSize(width: width, height: 10)
        return layout
    }()
    
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.sizeToFit()
        searchBar.placeholder = "Search"
        return searchBar
    }()
    
    // Pagination configuration
    fileprivate var currentPage = 0
    fileprivate var isFetching = false
    fileprivate var isInitialFetchComplete = false
    
    var articleVM: ArticleModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
        getArticles()
    }
    
    // MARK: Private Methods
    private func setUpView() {
        collectionView?.collectionViewLayout = layout

        // the UIViewController comes with a navigationItem property
        // this will automatically be initialized for you if when the
        // view controller is added to a navigation controller's stack
        // you just need to set the titleView to be the search bar
        navigationItem.titleView = searchBar
        searchBar.delegate = self
    }
    
    private func getArticles(_ text: String = "", page: Int = 0) {
        articleVM.getAllArticle(search: text, page: page) { [weak self] (success) in
            
            // Make self weak/unowned as in callback it captures it strongly.
            guard let weakSelf = self else { return }
            guard success else { return }
            
            DispatchQueue.main.async {
                weakSelf.collectionView.reloadData()
            }
            
            if !weakSelf.isInitialFetchComplete {
                weakSelf.isInitialFetchComplete = true
            }
            weakSelf.isFetching = false
            weakSelf.currentPage += 1
        }
    }
    
    private func resetPagination() {
        currentPage = 0
        articleVM.dataModel.removeAll()
        collectionView.reloadData()
    }
  
}


extension ArticleListVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articleVM.dataModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ArticleCell", for: indexPath) as! ArticleCell
        cell.configureCell(articleVM.dataModel[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let detailVC = ArticleDetailVC.instance() as! ArticleDetailVC
        detailVC.articles = articleVM.dataModel
        detailVC.selectedIndex = indexPath.row
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension ArticleListVC: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        resetPagination()
        getArticles(searchBar.text ?? "")
        searchBar.resignFirstResponder()
    }
}

// MARK: UIScrollView Delegate
extension ArticleListVC {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        if articleVM.checkIfScrollViewAtBottom(scrollView) {
            if isInitialFetchComplete, !isFetching {
                getArticles(searchBar.text ?? "", page: currentPage)
                isFetching = true
            }
        }
    }
}
