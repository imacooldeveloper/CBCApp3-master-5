//
//  ActionUserUpdate.swift
////  CBCApp3
////
////  Created by Martin Gallardo on 9/13/18.
////  Copyright © 2018 Martin Gallardo. All rights reserved.
////
//import UIKit
//import Alamofire
//
//class ActionUserUpdate {
//    let url = "https://preview2.rockefeller.edu:8088/api/authenticate"
//    let manager = NetworkConnection.sharedManager.manager
//    
//    func updateUser(_ token: String, tokenType: String, expiresIn: Int, params: [String : String])  {
//        let headers = NetworkConnection.addAuthorizationHeader(token, tokenType: tokenType)
//        manager?.request(url, method: .put, parameters: params, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
//            print(response.description)
//            print(response.debugDescription)
//            print(response.request)  // original URL request
//            print(response.response) // URL response
//            print(response.data)     // server data
//            print(response.result)   // result of response serialization
//        }
//    }
//}
