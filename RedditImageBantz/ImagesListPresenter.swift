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
    public var index: Int
    var images: [RedditImage]?
    public var subReddit: String?

    init(service: ImageListNetworkService) {
        self.service = service
        index = 1
        subReddit = "itookapicture"
    }
    
    func loadData() {
        
        task = self.service.fetchImagesTask(withCompletion: { images, error in
            
            guard let fetchedImages = images else {
                return
            }
            
            if fetchedImages.count > 0  && error == nil {
                
                if var images = self.images {
                    images = images + fetchedImages
                } else {
                    self.images = fetchedImages
                }
                
                _ = fetchedImages.map {
                    $0.delegate = self
                    $0.populate()
                }
            }
        }, subReddit, index)
        task?.resume()
    }
}

extension ImagesListPresenter: RedditImagePopulatorDelegate {
    func redditImageDidUpdate() {
        self.delegate?.presenterDidUpdate()
    }
}
