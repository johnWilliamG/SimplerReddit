//
//  ImagesListPresenter.swift
//  RedditImageBantz
//
//  Created by Galloway, John (Associate Software Developer) on 22/04/2017.
//  Copyright © 2017 Galloway, John (Associate Software Developer). All rights reserved.
//

import UIKit

class ImagesListPresenter: Presenter {
    
    weak var viewController: ImageListViewController?
    weak var delegate: PresenterDelegate?
    
    let service: ImageListNetworkService!
    var task: URLSessionDataTask?
    
    var images: [RedditImage]?

    init(service: ImageListNetworkService) {
        self.service = service
    }
    
    func loadData() {
        
        task = self.service.fetchImagesTask { (images, error) in

            guard let fetchedImages = images else {
                return
            }
            
            if fetchedImages.count > 0  && error == nil {
                self.images = fetchedImages
                self.delegate?.presenterDidUpdate()
            }
        }
        
        task?.resume()
    }
}
