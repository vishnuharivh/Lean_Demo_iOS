//
//  Constants.swift
//  LeanSample
//
//  Created by Ramsheer T on 09/08/21.
//

import Foundation
class Constants: NSObject {
    
    static let leanAPPToken = "da9b810f-338a-41ae-ac80-445478e6158a"
    
    enum Urls: String {
        case test_URL = "https://sandbox.leantech.me/"
    }

    struct APIUrlConstants {
        static let BASE_URL = Urls.test_URL.rawValue
        static let KCreateCustomer = BASE_URL + "customers/v1/"
    }
}

