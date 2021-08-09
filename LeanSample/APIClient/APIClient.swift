//
//  APIClient.swift
//  LeanSample
//
//  Created by Ramsheer T on 09/08/21.
//

import Foundation
import Alamofire

class APIClient: NSObject {
    static let sharedInstance = APIClient()
    
    
    func CreateUser(params: [String:AnyObject],type: HTTPMethod, onSuccess: @escaping (Any) -> Void, onFailure: @escaping (Error) -> Void) {
        apiCallWithoutSuccess(urlString: Constants.APIUrlConstants.KCreateCustomer, method: type, paramsToBePassed: params, onSuccess: onSuccess, onFailure: onFailure)
    }
    
    
    
    
    
    private func apiCall(urlString:String, method: HTTPMethod, paramsToBePassed: Dictionary<String,AnyObject>?, onSuccess: @escaping (Any) -> Void, onFailure: @escaping (Error) -> Void) {
        
   
        let headers = HTTPHeaders(["Content-Type":"application/json", "lean-app-token":Constants.leanAPPToken])
        
        AF.request(URL(string: urlString)!, method: method, parameters: paramsToBePassed, encoding: URLEncoding.default, headers: headers).responseJSON { (response) in
            print("Response Result: \(response)")
            switch response.result {
            case .success(let jsonResponse):
                
                if let responseDic = response.value as? [String:AnyObject] {
                    if let status = responseDic["success"] as? Bool {
                        if status  {
                            onSuccess(jsonResponse)
                        } else {
                            if let message = responseDic["message"] as? String {
                                
                                onFailure(NSError(domain: "", code: 123, userInfo: [NSLocalizedDescriptionKey: message]))
                            }
                        }
                    } else{
                        onFailure(NSError(domain: "", code: 502, userInfo: [NSLocalizedDescriptionKey: "Stay in the loop! We will update soon"]))
                    }
//
//                   else if let status = responseDic["status"] as? Bool {
//                        if status  {
//                            onSuccess(jsonResponse)
//                        } else {
//                            if let message = responseDic["message"] as? String {
//
//                                onFailure(NSError(domain: "", code: 123, userInfo: [NSLocalizedDescriptionKey: message]))
//                            }
//                        }
//                    }
                    
                }
                
                break;
                
                
            case .failure(let error):
                onFailure(error)
                break;
            }
        }
    }
    
    
    
    
    private func apiCallWithoutSuccess(urlString:String, method: HTTPMethod, paramsToBePassed: Dictionary<String,AnyObject>?, onSuccess: @escaping (Any) -> Void, onFailure: @escaping (Error) -> Void) {
        
        
      
        
        let headers = HTTPHeaders(["Content-Type":"application/x-www-form-urlencoded"])
        AF.session.configuration.timeoutIntervalForRequest = 300
        AF.request(URL(string: urlString)!, method: method, parameters: paramsToBePassed, encoding: URLEncoding.default, headers: headers).responseJSON { (response) in
            print("Response Result: \(response)")
            switch response.result {
            case .success(let jsonResponse):
                onSuccess(jsonResponse)
//                if let responseDic = response.value as? [String:AnyObject] {
//                    if let status = responseDic["success"] as? Bool {
//                        if status  {
//                            onSuccess(jsonResponse)
//                        } else {
//                            if let message = responseDic["message"] as? String {
//
//                                onFailure(NSError(domain: "", code: 123, userInfo: [NSLocalizedDescriptionKey: message]))
//                            }
//                        }
//                    }
//                }
                break;
            case .failure(let error):
                onFailure(error)
                break;
            }
        }
    }
    

}
