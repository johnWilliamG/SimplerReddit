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
                  let postHint = imageData["post_hint"] as! String?,
                  postHint == "image",
                  let thumbNailUrl = imageData["thumbnail"] as! String?,
                  let imageUrl = imageData["url"] as! String?,
                  let redditImageId = imageData["id"] as! String?,
                  let title = imageData["title"] as! String? else {
                continue
            }
            
            let redditImage = RedditImage(largeImageUrl: imageUrl, thumbnailUrl: thumbNailUrl, photoID: redditImageId, title: title)
            
            redditImages.append(redditImage)
        }
        
        return redditImages
    }
}
