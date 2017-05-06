//
//  RedditImageObjectMapper.swift
//  RedditImageBantz
//
//  Created by Galloway, John (Associate Software Developer) on 29/04/2017.
//  Copyright © 2017 Galloway, John (Associate Software Developer). All rights reserved.
//

import Foundation

enum RedditImageObjectMapperErrors: Error {
    
    case unexpectedJsonKeys
}


class RedditImageObjectMapper {
    
    static public func formatRedditImages(json: [String: Any]) throws -> [RedditImage]? {
        
        guard let listObjects = json["data"] as! [String: Any]? else {
            throw  RedditImageObjectMapperErrors.unexpectedJsonKeys
        }
        
        guard let listItems = listObjects["children"] as! [[String: Any]]? else {
            throw RedditImageObjectMapperErrors.unexpectedJsonKeys
        }
        
        var redditImages: [RedditImage] = []
        
        for listItem in listItems {
            
            guard let imageData = listItem["data"] as! [String: Any]?,
                  let thumbNailUrl = imageData["thumbnail"] as! String?,
                  let imageUrl = imageData["url"] as! String?,
                  let redditImageId = imageData["id"] as! String?,
                  let postHint = imageData["post_hint"] as! String? else {
                continue
            }
            
            if postHint == "image" {
                let redditImage = RedditImage(largeImageUrl: imageUrl, thumbnailUrl: thumbNailUrl, photoID: redditImageId)
                redditImages.append(redditImage)
            }
        }
        
        return redditImages
    }
}
