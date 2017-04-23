//
//  ImageListNetworkService.swift
//  RedditImageBantz
//
//  Created by Galloway, John (Associate Software Developer) on 22/04/2017.
//  Copyright © 2017 Galloway, John (Associate Software Developer). All rights reserved.
//

import UIKit

class ImageListNetworkService {
    
    func fetchImagesTask(withCompletion completion: @escaping ([UIImage]?, Error?)-> ()) -> URLSessionDataTask {
        
       return perfromNetworkRequest(session: URLSession(configuration: .default), request: makeGetRequest()) { data, networkError in
            
            if let error = networkError {
                completion(nil, error)
                return
            }
            
            guard let responseData = data else {
                completion(nil,nil)
                return
            }
            
            let formattedJson = self.formatImageJson(from: responseData)
            
            completion(formattedJson.0, formattedJson.1)
        }
    }
    
    func formatImageJson(from data: Data) -> ([UIImage]?, Error?) {
        
        do {
            
            guard let parsedData = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] else {
                return (nil, nil)
            }
            
            print(parsedData)
        } catch let error as NSError {
            
            return(nil, error)
        }
        return (nil, nil)
    }
    
    func perfromNetworkRequest(session: URLSession, request resquest: URLRequest, completion:@escaping (Data?, Error?) -> ())  -> URLSessionDataTask {
        
        return session.dataTask(with: resquest) { data, response, Error in
        
            if let error = Error {
                completion(nil,error)
            }
            completion(data,nil)
        }
    }
    
    func makeGetRequest() -> URLRequest {
        let mgsUrl = URL(string: "https://www.reddit.com/r/metalgearsolid/.json")
        return URLRequest(url: mgsUrl!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 30)
    }
}
