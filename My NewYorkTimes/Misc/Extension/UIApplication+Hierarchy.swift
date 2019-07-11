//
//  UIApplication+Hierarchy.swift
//  My NewYorkTimes
//
//  Created by Darshan on 06/07/19.
//  Copyright © 2019 Darshan. All rights reserved.
//

import UIKit

public extension UIApplication {
    
    // Returns current Top Most ViewController in hierarchy of Window.
    class public func topMostWindowController()->UIViewController? {
        
        var topController = UIApplication.shared.keyWindow?.rootViewController
        
        while let presentedController = topController?.presentedViewController {
            topController = presentedController
        }
        
        return topController
    }
    
    // Returns the topViewController from stack of topMostWindowController (if in navigation).
    class public func currentViewController()->UIViewController? {
        
        var currentViewController = UIApplication.topMostWindowController()
        
        while currentViewController != nil && currentViewController is UINavigationController && (currentViewController as! UINavigationController).topViewController != nil {
            currentViewController = (currentViewController as! UINavigationController).topViewController
        }
        
        return currentViewController
    }
}
