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

    init(service: ImageListNetworkService) {
        self.service = service
    }
    
    func loadData() {
        
        task = self.service.fetchImagesTask { (images, error) in
            print("hello")
        }
        
        task?.resume()
    }
}
