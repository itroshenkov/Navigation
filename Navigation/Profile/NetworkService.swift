////
////  NetworkService.swift
////  Navigation
////
////  Created by itroshenkov on 17.06.2022.
////
//
//import Foundation
//
//struct NetworkServis{
//    static let shared = NetworkServis()
//    private  init() {
//    }
//    
//    func urlSession(stringURL: String) {
//        if let url = URL(string: stringURL) {
//            let task = URLSession.shared.dataTask(with: url) { data, response, error in
//                
//                if error == nil, let data = data, let response = response as? HTTPURLResponse {
//                    
//                    print("data: \(String(decoding: data, as: UTF8.self))")
//                    print("statusCode: \(response.statusCode) ")
//                    print("headerFields: \(response.allHeaderFields) ")
//                    
//                    
//                } else if let error = error {
//                    print("error: \(error.localizedDescription) ")
//                    
//                }
//            }
//            
//            task.resume()
//        }
//    }
//}
//
//// при выключеном интернете error: The Internet connection appears to be offline.
//
