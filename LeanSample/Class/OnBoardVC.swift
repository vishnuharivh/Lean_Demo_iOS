//
//  OnBoardVC.swift
//  LeanSample
//
//  Created by Ramsheer T on 06/08/21.
//

import UIKit
import LeanSDK

class OnBoardVC: UIViewController {
    var linkPermissions = [LeanPermission.Identity]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Lean.manager.setup(appToken: "da9b810f-338a-41ae-ac80-445478e6158a", sandbox: true, version: "1.0.4")
       
    }
    
    
    @IBAction func createPayment(_ sender: UIButton) {
        Lean.manager.createPaymentSource(
            presentingViewController: self,
            customerId: "6aa4e4dd-f622-42af-9304-8f2d9ad5300e",
            bankId: "LEANMB2_SAU",
            success: {
                print("Create Lean Success")
                 },
            error: { (status) in
                
                print("Create Lean Failed \(status)")
            }
        )
    }
    
    
    
    @IBAction func LinkLean(_ sender: UIButton) {
        Lean.manager.link(
            presentingViewController: self,
            customerId: "6aa4e4dd-f622-42af-9304-8f2d9ad5300e",
            permissions: linkPermissions,
            bankId: "LEANMB2_SAU",
            success: {
                print("Link Lean Success")
            },
            error: { (status) in
                print("Link Lean Failed \(status)")
            }
        )
    }
    
    
    
    
    
//        func login(){
//   
//            let params = ["":""] as [String:AnyObject]
//            
//            APIClient.sharedInstance.CreateUser(params: params, type: .post, onSuccess: {
//                (response) in
//                DispatchQueue.main.async {
//                    
//                    guard let responseDic = response as? Dictionary<String, Any> else {return}
//                                   
//                    let successValue = responseDic["success"] as? Int
//                    if successValue == 1 {
//                        
//                    }
//                   
//                }
//            }, onFailure: { (error) in
//                DispatchQueue.main.async {
//                  
//                    let errorCode = ((error as? NSError)?.code)
//                    print("Error code : \(String(describing: errorCode))")
//                    if errorCode == 404 {
//                        print("Error : \(error.localizedDescription)")
//                       
//                    }
//                    
//                   
//                }
//                
//            })
//            
//        }
    
    
    
    
}