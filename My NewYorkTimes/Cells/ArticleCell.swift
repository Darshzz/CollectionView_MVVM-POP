//
//  ArticleCell.swift
//  My NewYorkTimes
//
//  Created by Darshan on 08/07/19.
//  Copyright © 2019 Darshan. All rights reserved.
//

import UIKit
import Kingfisher

class ArticleCell: UICollectionViewCell {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSnippet: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var constraintImgView_H: NSLayoutConstraint!
    
    lazy var width: NSLayoutConstraint = {
        let width = contentView.widthAnchor.constraint(equalToConstant: bounds.size.width)
        width.isActive = true
        return width
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        width.constant = bounds.size.width
        return contentView.systemLayoutSizeFitting(CGSize(width: targetSize.width, height: 1))
    }
    
    func configureCell(_ article: ArticleDataModelProtocol) {
        lblTitle.text = article.headline
        lblSnippet.text = article.snippet
        
        constraintImgView_H.constant = article.imgUrl == "" ? 0 : 140
        imgView.kf.setImage(with: URL(string: article.imgUrl))
    }
}
