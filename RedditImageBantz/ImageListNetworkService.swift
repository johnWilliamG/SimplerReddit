//
//  ImageListNetworkService.swift
//  RedditImageBantz
//
//  Created by Galloway, John (Associate Software Developer) on 22/04/2017.
//  Copyright © 2017 Galloway, John (Associate Software Developer). All rights reserved.
//

import UIKit

class ImageListNetworkService {
    
    func fetchImagesTask(withCompletion completion: @escaping ([RedditImage]?, Error?)-> ()) -> URLSessionDataTask {
        
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
        
            guard let redditImages = formattedJson.0 else {
                completion(nil,nil)
                return
            }
        
            let populatedImages = self.addThumbNailToRedditImages(redditImages)
            let populatedBigImages = self.populatedBigImages(populatedImages)
            completion(populatedBigImages, formattedJson.1)
        }
    }
    
    
    func populatedBigImages(_ redditImages: [RedditImage]) -> [RedditImage] {
        
        
        var populatedRedditImages: [RedditImage] = []
        
        for redditImage in redditImages {
            
            guard let bigImageUrl = URL(string: redditImage.largeImageUrl),
                let imageData = try? Data(contentsOf: bigImageUrl) else {
                continue
            }
            
            if let image = UIImage(data: imageData) {
                redditImage.largeImage = image
                populatedRedditImages.append(redditImage)
            }
            
        }
        
        return populatedRedditImages
    }

    
    // Downloads and adds the thumbnail to reddit images
    func addThumbNailToRedditImages(_ redditImages: [RedditImage]) -> [RedditImage] {
        
        var populatedRedditImages: [RedditImage] = []
        
        for redditImage in redditImages {
            
            guard let thumbailUrl = URL(string: redditImage.thumbnailUrl),
                  let thumbnailData = try? Data(contentsOf: thumbailUrl) else {
                break
            }
        
            if let thumbnailImage = UIImage(data: thumbnailData) {
                redditImage.thumbnail = thumbnailImage
                populatedRedditImages.append(redditImage)
            }
        }
        
        return populatedRedditImages
    }
    
    func formatImageJson(from data: Data) -> ([RedditImage]?, Error?) {
        
        do {
            
            guard let parsedData = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] else {
                return (nil, nil)
            }
            
            guard let redditImages = try RedditImageObjectMapper.formatRedditImages(json: parsedData) else {
                return (nil, nil)
            }
            return (redditImages, nil)
            
        } catch let error as NSError {
            
            return(nil, error)
        }
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
        let mgsUrl = URL(string: "https://www.reddit.com/r/villageporn/.json")
        return URLRequest(url: mgsUrl!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 30)
    }
}
