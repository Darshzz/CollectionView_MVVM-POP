//
//  ArticleDataModelProtocol.swift
//  My NewYorkTimes
//
//  Created by Darshan on 11/07/19.
//  Copyright © 2019 Darshan. All rights reserved.
//

import Foundation

protocol ArticleDataModelProtocol {
    //var articles: [ArticleDataModelProtocol] {get set}
    var snippet: String! {get set}
    var headline: String! {get set}
    var imgUrl: String! {get set}
}
