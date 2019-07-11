//
//  ArticleDetailCell.swift
//  My NewYorkTimes
//
//  Created by Darshan on 10/07/19.
//  Copyright © 2019 Darshan. All rights reserved.
//

import UIKit

class ArticleDetailCell: UICollectionViewCell {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSnippet: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    func configureCell(_ article: ArticleDataModelProtocol) {
        lblTitle.text = article.headline
        lblSnippet.text = article.snippet
        
        imgView.kf.setImage(with: URL(string: article.imgUrl))
    }
}
