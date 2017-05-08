//
//  ImageListColecctionViewFlowLayout.swift
//  RedditImageBantz
//
//  Created by Galloway, John (Associate Software Developer) on 03/05/2017.
//  Copyright © 2017 Galloway, John (Associate Software Developer). All rights reserved.
//

import UIKit

class ImageListCollectionViewFlowLayout: NSObject, UICollectionViewDelegateFlowLayout {
    
    var presenter: ImagesListPresenter
    
    init(imageListPresenter: ImagesListPresenter) {
        presenter = imageListPresenter
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      
        guard let image = presenter.images?[indexPath.row].thumbnail else {
            return CGSize(width: 0, height: 0)
        }
        
        let aspectRatio = image.size.height / image.size.width
        let width = collectionView.bounds.width/2
        let height = width * aspectRatio
        let size = CGSize(width: width, height: height)
        
        return size 
    }
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
