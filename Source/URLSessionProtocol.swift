//
//  URLSessionProtocol.swift
//  DogYears
//
//  Created by Igor Clemente on 06/04/20.
//  Copyright © 2020 Razeware. All rights reserved.
//

import Foundation

protocol URLSessionProtocol {
    func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTaskProtocol 
}

extension URLSession : URLSessionProtocol {
    func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTaskProtocol {
        
        let task = dataTask(with: request, completionHandler: completionHandler) as URLSessionTask
        
        return task as URLSessionDataTaskProtocol
    }
}

extension URLSessionTask : URLSessionDataTaskProtocol {
    
}
