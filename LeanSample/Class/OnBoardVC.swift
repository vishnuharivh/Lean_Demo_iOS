//
//  OnBoardVC.swift
//  LeanSample
//
//  Created by Lulu Money Team.
//

import UIKit
import LeanSDK
import AnimatedGradientView

class OnBoardVC: UIViewController {
    @IBOutlet weak var gradientView: AnimatedGradientView!
    var linkPermissions = [LeanPermission.Identity, LeanPermission.Accounts,
                           LeanPermission.Transactions, LeanPermission.Balance]

    
    override func viewDidLoad() {
        super.viewDidLoad()
       
     //   let animatedGradient = AnimatedGradientView(frame: view.bounds)
        gradientView.direction = .up
        gradientView.animationValues = [(colors: ["#2BC0E4", "#EAECC6"], .up, .axial),
        (colors: ["#833ab4", "#f09090", "#fcb045"], .right, .axial),
        (colors: ["#003973", "#E5E5BE"], .down, .axial),
        (colors: ["#a9e39a", "#FFF200", "#ed9a9a"], .left, .axial)]
       
    // Lean SDK intialization
        
        Lean.manager.setup(appToken: "da9b810f-338a-41ae-ac80-445478e6158a", sandbox: true, version: "1.11.1")
       
    }
    
    
    // Create Payment method
    
    @IBAction func createPayment(_ sender: UIButton) {
        Lean.manager.createPaymentSource(
            presentingViewController: self,
            customerId: "f69673be-1894-43a5-adb2-85406d10f444",
            bankId: nil,
            success: {
                print("Create Lean Success")
                 },
            error: { (status) in
                
                print("Create Lean Failed \(status)")
            }
        )
    }
    
    
  
    
    
    //  Payment method
    
    @IBAction func Pay(_ sender: UIButton) {
    
    Lean.manager.pay(
        presentingViewController: self,
        paymentIntentId: "20c32a49-789c-473e-a379-bae7cbbe42dd",
        accountId: nil,
        success: {
            print("Lean Pay Success")
        },
        error: { (status) in
            print("Lean Pay Failed \(status)")
        }
    )
    
    }
}
