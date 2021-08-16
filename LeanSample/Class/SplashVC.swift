//
//  SplashVC.swift
//  LeanSample
//
//  Created by Vishnu C Hari on 16/08/21.
//

import UIKit
import Lottie
class SplashVC: UIViewController {

    @IBOutlet weak var animationView: AnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
         animationView.contentMode = .scaleAspectFit
         animationView.loopMode = .loop
         animationView.animationSpeed = 0.5
         animationView.play()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 7.0) {
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "OnBoardVC") as? OnBoardVC
            self.navigationController?.pushViewController(vc!, animated: true)
        }
    }
    

  
}
