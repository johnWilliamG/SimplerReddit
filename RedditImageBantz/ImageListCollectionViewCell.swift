//
//  ImageListCollectionViewCell.swift
//  RedditImageBantz
//
//  Created by Galloway, John (Associate Software Developer) on 30/04/2017.
//  Copyright © 2017 Galloway, John (Associate Software Developer). All rights reserved.
//

import UIKit

class ImageListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var thumbNailIcon: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    
    public func configureCellWith(redditImage: RedditImage) {
        
        thumbNailIcon.image = redditImage.thumbnail
        titleLabel.text = redditImage.thumbnailUrl
    }
}
