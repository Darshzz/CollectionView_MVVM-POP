//
//  MovieEndPoint.swift
//  My NewYorkTimes
//
//  Created by Darshan on 07/07/19.
//  Copyright © 2019 Darshan. All rights reserved.
//

import Foundation


enum NetworkEnvironment {
    case staging
}

public enum NYArticleApi {
    case newArticle(search:String, page:Int)
}

extension NYArticleApi: EndPointType {
   
    var environmentBaseURL : String {
        switch NetworkManager.environment {
        case .staging: return "https://api.nytimes.com/svc/search/v2/"
        }
    }
    
    var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured.")}
        return url
    }
    
    var path: String {
        switch self {
        case .newArticle:
            return "articlesearch.json"
        }
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var task: HTTPTask {
        switch self {
        case .newArticle(let search, let page):
            return .requestParameters(bodyParameters: nil,
                                      bodyEncoding: .urlEncoding,
                                      urlParameters: ["api-key":NetworkManager.articleAPIKey,
                                                      "q":search,
                                                      "page":page])
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
}


