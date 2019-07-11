//
//  EndPoint.swift
//  My NewYorkTimes
//
//  Created by Darshan on 07/07/19.
//  Copyright © 2019 Darshan. All rights reserved.
//

import Foundation

protocol EndPointType {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
    var headers: HTTPHeaders? { get }
}

