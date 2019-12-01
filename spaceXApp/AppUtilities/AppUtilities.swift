//
//  AppUtilities.swift
//  spaceXApp
//
//  Created by Ahmet Muhammet Vural on 30.11.2019.
//  Copyright © 2019 Ahmet Muhammet Vural. All rights reserved.
//

import UIKit

extension UIViewController{
    func presentVC(vc: UIViewController, duration: CFTimeInterval, type: CATransitionSubtype) {
        let navControl = UINavigationController(rootViewController: vc)
        navControl.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0, green: 0.5628422499, blue: 0.3188166618, alpha: 1), NSAttributedString.Key.font: UIFont(name: "Futura-Medium", size: 17)!]
        navControl.navigationBar.tintColor = #colorLiteral(red: 0, green: 0.5628422499, blue: 0.3188166618, alpha: 1)
        if #available(iOS 11.0, *) {
            navControl.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0, green: 0.5628422499, blue: 0.3188166618, alpha: 1), NSAttributedString.Key.font: UIFont(name: "Futura-Medium", size: 34) ??  UIFont.systemFont(ofSize: 34)]
            navControl.navigationBar.prefersLargeTitles = true
        }
   
        let transition = CATransition()
        transition.duration = duration
        transition.type = CATransitionType.push
        transition.subtype = type
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        view.window!.layer.add(transition, forKey: kCATransition)
        navControl.modalPresentationStyle = .overFullScreen
        present(navControl, animated: false, completion: nil)
    }
    
    func blurEffect(view: UIView){
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(blurEffectView)
    }
    
    func removeBlurEffenct(view: UIView){
        for subview in view.subviews {
            if subview is UIVisualEffectView {
                subview.removeFromSuperview()
            }
        }
    }
    
    func roundCorners(corners: CACornerMask, radius: CGFloat,view: UIView) {
                view.clipsToBounds = true
                view.layer.cornerRadius = radius
                if #available(iOS 11.0, *) {
                    view.layer.maskedCorners = corners
                }
    //        * layerMaxXMaxYCorner - bottom right corner
    //        * layerMaxXMinYCorner - top right corner
    //        * layerMinXMaxYCorner - bottom left corner
    //        * layerMinXMinYCorner - top left corner
            }
}
