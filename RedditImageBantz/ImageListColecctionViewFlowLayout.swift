//
//  ImageListColecctionViewFlowLayout.swift
//  RedditImageBantz
//
//  Created by Galloway, John (Associate Software Developer) on 03/05/2017.
//  Copyright © 2017 Galloway, John (Associate Software Developer). All rights reserved.
//

import UIKit

class ImageListCollectionViewFlowLayout: NSObject, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 262, height: 301)
    } 
}
