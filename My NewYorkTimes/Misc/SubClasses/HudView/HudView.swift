//
//  HudView.swift
//  My NewYorkTimes
//
//  Created by Darshan on 08/07/19.
//  Copyright © 2019 Darshan. All rights reserved.
//

import UIKit

class HudView: UIView {
    
    @IBOutlet weak var imgVSpinner: UIImageView!
    
    static var hudView : HudView?
    var isStop = false
    
    class func show() {
        DispatchQueue.main.async {
            self.remove()
            hudView = UINib(nibName: "HudView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as? HudView
            hudView!.frame = UIScreen.main.bounds
            UIApplication.currentViewController()?.view.addSubview(hudView!)
            
            hudView?.isStop = false
            self.showHud()
        }
    }
    
    // MARK: Private
    private class func showHud(){
        
        hudView?.imgVSpinner.transform = CGAffineTransform(scaleX: 0, y: 0)
        hudView?.rotateSpinner()
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: [.curveEaseOut], animations: {
            
            hudView?.imgVSpinner.transform = CGAffineTransform(scaleX: 1, y: 1)
            hudView?.backgroundColor = Color.rgba(0, 0, 0, 0.5)
            
        }, completion: nil)
    }
    
    private func rotateSpinner() {
        let rotationAnimation =  CABasicAnimation(keyPath: "transform.rotation.z")
        rotationAnimation.toValue = CGFloat.pi * 2.0
        rotationAnimation.duration = 0.8
        rotationAnimation.isCumulative = true
        rotationAnimation.repeatCount = HUGE
        imgVSpinner.layer.add(rotationAnimation, forKey: "rotationAnimation")
    }
    
    private class func remove(){
        if hudView != nil {
            hudView!.imgVSpinner.layer.removeAllAnimations()
            hudView!.removeFromSuperview()
            hudView = nil
        }
    }
    
    class func kill(){
        DispatchQueue.main.async {
            if hudView != nil {
                UIView.animate(withDuration: 0.1, animations: {
                    hudView!.transform = CGAffineTransform(scaleX: 0, y: 0)
                    hudView!.backgroundColor = .clear
                }, completion: { (isFinished : Bool) in
                    self.remove()
                })
            }
        }
    }
}

