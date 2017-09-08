//
//  RedditImage.swift
//  RedditImageBantz
//
//  Created by Galloway, John (Associate Software Developer) on 29/04/2017.
//  Copyright © 2017 Galloway, John (Associate Software Developer). All rights reserved.
//

import UIKit

class RedditImage {
    
    var thumbnail : UIImage?
    var largeImage : UIImage?
    let photoID : String
    let largeImageUrl: String
    let thumbnailUrl: String
    let title: String
    var delegate: RedditImagePopulatorDelegate?
    
    var currentDisplayedImage: UIImage? {
        return largeImage == nil ? thumbnail : largeImage
    }
    
    init(largeImageUrl: String, thumbnailUrl: String, photoID: String, title: String) {
        self.largeImageUrl = largeImageUrl
        self.thumbnailUrl = thumbnailUrl
        self.title = title
        self.photoID = photoID
    }
    
}
