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
    @IBOutlet weak var customerIDTxField: UITextField!
    @IBOutlet weak var paymentIntentIDTxField: UITextField!
    @IBOutlet weak var gradientView: AnimatedGradientView!
    
    @IBOutlet weak var bottomView: UIView!
    var linkPermissions = [LeanPermission.Identity, LeanPermission.Accounts,
                           LeanPermission.Transactions, LeanPermission.Balance]

    
    override func viewDidLoad() {
        super.viewDidLoad()
       
       
        
     //   let animatedGradient = AnimatedGradientView(frame: view.bounds)
        gradientView.direction = .up
        gradientView.animationValues = [(colors: ["#2BC0E4", "#EAECC6"], .up, .axial),
        (colors: ["#003973", "#E5E5BE", "#fcb045"], .right, .axial)]
       
    // Lean SDK intialization
        
        Lean.manager.setup(appToken: "da9b810f-338a-41ae-ac80-445478e6158a", sandbox: true, version: "1.11.1")
       
    }
    
    
    // Create Payment method
    
    @IBAction func createPayment(_ sender: UIButton) {
        
        if customerIDTxField.text?.count == 0 {
            let alert = UIAlertController(title: "Error!!", message: "Please enter a valid customer id", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
               
            }))
            self.present(alert, animated: true, completion: nil)
        } else {
            Lean.manager.createPaymentSource(
                presentingViewController: self,
                customerId: customerIDTxField.text!,
                bankId: nil,
                success: {
                    print("Create Lean Success")
                     },
                error: { (status) in
                    
                    print("Create Lean Failed \(status)")
                }
            )
        }
    }
    
    
  
    
    
    //  Payment method
    
    @IBAction func Pay(_ sender: UIButton) {
        if paymentIntentIDTxField.text?.count == 0 {
            let alert = UIAlertController(title: "Error!!", message: "Please enter a valid payment intent id", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
               
            }))
            self.present(alert, animated: true, completion: nil)
        } else {
            Lean.manager.pay(
                presentingViewController: self,
                paymentIntentId: paymentIntentIDTxField.text!,
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
   
    @IBAction func customer_info(_ sender: Any) {
        
        let alert = UIAlertController(title: "INFO", message: "Generate a customer id using \"Create Customer\"  API" , preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
           
        }))
        self.present(alert, animated: true, completion: nil)
    }
    @IBAction func payment_info(_ sender: Any) {
        
        let alert = UIAlertController(title: "INFO", message: "Generate a payment intent id using \"Create Payment Intent\"  API", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
           
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
