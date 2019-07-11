//
//  UIViewController+Storyboard.swift
//  My NewYorkTimes
//
//  Created by Darshan on 06/07/19.
//  Copyright © 2019 Darshan. All rights reserved.
//

import UIKit

extension UIViewController {
    
    class func instance() -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let identifier = NSStringFromClass(self).components(separatedBy: ".").last!
        return storyboard.instantiateViewController(withIdentifier: identifier)
    }
}
