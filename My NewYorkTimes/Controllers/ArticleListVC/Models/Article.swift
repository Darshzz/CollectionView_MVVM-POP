//
//  Article.swift
//  My NewYorkTimes
//
//  Created by Darshan on 08/07/19.
//  Copyright © 2019 Darshan. All rights reserved.
//

import Foundation


struct ArticleApiResponse {

    let article: [Article]
}

extension ArticleApiResponse: Decodable {
    
    private enum ResponseCodingKeys: CodingKey {
        case response
    }
    
    private enum DocCodingKeys: CodingKey {
        case docs
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ResponseCodingKeys.self)
        let docs = try container.nestedContainer(keyedBy: DocCodingKeys.self, forKey: .response)
        article = try docs.decode([Article].self, forKey: .docs)
    }
}


struct Article: Decodable, ArticleDataModelProtocol {
    var snippet: String!
    var headline: String!
    var imgUrl: String! = ""
    
    private enum CodingKeys: CodingKey {
        case multimedia
        case snippet
        case headline
    }
    
    private enum HeadlineCodingKeys: CodingKey {
        case main
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        snippet = try container.decodeIfPresent(String.self, forKey: .snippet) ?? ""
        headline = try container.decodeIfPresent(Headline.self, forKey: .headline)?.main ?? ""
        let docs = try container.decodeIfPresent([Multimedia].self, forKey: .multimedia) ?? []
        if docs.count > 0 { imgUrl = domainUrl + docs[0].url }
    }
}

struct Headline: Decodable {
    let main: String
}

struct Multimedia: Decodable {
    let url: String
}
