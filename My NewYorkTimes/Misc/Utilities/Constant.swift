//
//  Constant.swift
//  My NewYorkTimes
//
//  Created by Darshan on 08/07/19.
//  Copyright © 2019 Darshan. All rights reserved.
//

import UIKit

let domainUrl = "https://www.nytimes.com/"

struct ImageSize {
    static let imgWidth = "225"
    static let imgHeight = "150"
}

//************************** Screen size and Device type macros **************************//

struct ScreenSize {
    static let width         = UIScreen.main.bounds.size.width
    static let height        = UIScreen.main.bounds.size.height
    static let SCREEN_MAX_LENGTH    = max(ScreenSize.width, ScreenSize.height)
    static let SCREEN_MIN_LENGTH    = min(ScreenSize.width, ScreenSize.height)
}
