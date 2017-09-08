//
//  ImageListDataSource.swift
//  RedditImageBantz
//
//  Created by Galloway, John (Associate Software Developer) on 30/04/2017.
//  Copyright © 2017 Galloway, John (Associate Software Developer). All rights reserved.
//

import UIKit

class ImageListDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var presenter: ImagesListPresenter
    
    init(imageListPresenter: ImagesListPresenter) {
        presenter = imageListPresenter
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.images?.count ?? 0
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageListCollectionViewCell", for: indexPath) as? ImageListCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        guard let image = presenter.images?[indexPath.row] else {
            return cell
        }
        
        cell.configureCellWith(redditImage: image)
        return cell
    }
}
