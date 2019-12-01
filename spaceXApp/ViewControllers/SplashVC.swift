//
//  SplashVC.swift
//  spaceXApp
//
//  Created by Ahmet Muhammet Vural on 28.11.2019.
//  Copyright © 2019 Ahmet Muhammet Vural. All rights reserved.
//

import UIKit
import Lottie

class SplashVC: UIViewController {

    @IBOutlet weak var animeView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
      override func viewDidAppear(_ animated: Bool) {
        
            let animationView = AnimationView(name: "9108-a-small-rocket(1)")
             animationView.frame = CGRect(x: 0, y: 0 , width: animeView.frame.width, height: animeView.frame.height)
        animationView.contentMode = .scaleAspectFit
             self.animeView.addSubview(animationView)
            animationView.play { (true) in
                let rocketListVC = self.storyboard!.instantiateViewController(withIdentifier: "RocketListVC") as! RocketListVC
                self.presentVC(vc: rocketListVC, duration: 0.3, type: .fromBottom)

            }
        }

 

}
