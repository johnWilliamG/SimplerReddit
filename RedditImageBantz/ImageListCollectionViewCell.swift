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

    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .white
        let color = UIColor(red: 40/255, green: 40/255, blue: 40/255, alpha: 1.0)
        titleLabel.textColor = color
    }    
    
    public func configureCellWith(redditImage: RedditImage) {
        thumbNailIcon.image = redditImage.currentDisplayedImage
        titleLabel.text = redditImage.title
    }
}
