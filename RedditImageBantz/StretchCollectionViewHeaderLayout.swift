//
//  StretchCollectionViewHeaderLayout.swift
//  RedditImageBantz
//
//  Created by Galloway, John (Associate Software Developer) on 22/04/2017.
//  Copyright © 2017 Galloway, John (Associate Software Developer). All rights reserved.
//

import UIKit

class StretchCollectionViewHeaderLayout: UICollectionViewFlowLayout {
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        let attributes = super.layoutAttributesForElements(in: rect)
        let inset = collectionView?.contentInset
        let offset = collectionView?.contentOffset
        
        guard let verticalOffset = offset?.y else {
            return attributes
        }
        
        guard var minY = inset?.top else {
            return attributes
        }

        minY = minY * -1
        
        if verticalOffset < minY {
            
            let  changeInY = verticalOffset - minY
            
            for attr in attributes! where attr.representedElementKind == UICollectionElementKindSectionHeader {
                let headerSize = headerReferenceSize
                var headerRect = attr.frame
                
                headerRect.size.height = max(minY, headerSize.height + changeInY)
                headerRect.origin.y = headerRect.origin.y - changeInY
                attr.frame = headerRect
                break
            }
            
            
        }
        return attributes
    }
}
