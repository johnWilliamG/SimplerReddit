//
//  RedditImage+Populator.swift
//  RedditImageBantz
//
//  Created by Galloway, John (Associate Software Developer) on 25/06/2017.
//  Copyright © 2017 Galloway, John (Associate Software Developer). All rights reserved.
//

import Foundation
import UIKit

extension RedditImage {
    
    public func populate(){
        
        let smallImagetask = populateSmallImagesTask()
        smallImagetask?.resume()
        
        let largeImageTask = populateLargeImage {
            smallImagetask?.cancel()
        }
        
        DispatchQueue.global().async {
            largeImageTask?.resume()
        }
    }
    
    func populateSmallImagesTask() -> URLSessionTask? {
        
        guard let requestURL = URL(string: thumbnailUrl) else {
            return nil
        }
        
        let task = URLSession.shared.dataTask(with: requestURL) { data, _, error in
            
            guard let data = data else {
                return
            }
            
            let image = UIImage(data: data)
            
            if (image != nil && error == nil) {
                
                DispatchQueue.main.async {
                    self.thumbnail = image
                    self.delegate?.redditImageDidUpdate()
                }
            }
        }
        
        return task
    }
    
    func populateLargeImage(completion:@escaping () -> ()) -> URLSessionTask? {
        
        guard let requestURL = URL(string: largeImageUrl) else {
            return nil
        }
        
        let task = URLSession.shared.dataTask(with: requestURL) { data, _, error in
            
            guard let data = data else {
                return
            }
            
            let image = UIImage(data: data)
            
            if (image != nil && error == nil) {
                
                DispatchQueue.main.async {
                    self.largeImage = image
                    self.delegate?.redditImageDidUpdate()
                    completion()
                }
            }
        }
        return task
    }
}

protocol RedditImagePopulatorDelegate {
    
    func redditImageDidUpdate()
    
}
