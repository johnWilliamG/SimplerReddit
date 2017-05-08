//
//  MainPresenter.swift
//  RedditImageBantz
//
//  Created by Galloway, John (Associate Software Developer) on 22/04/2017.
//  Copyright © 2017 Galloway, John (Associate Software Developer). All rights reserved.
//

import UIKit

class MainPresenter: Presenter {
    
    weak var delegate: PresenterDelegate?
    weak var viewController: MainTabBarController?
    
    func loadData() {
        
        let tabBarViewControllers = MainTabBarItems().barItems.map { (item: MainTabBarItem) -> UIViewController in
            
            let viewController = UINavigationController(rootViewController: makeViewController(mainBarItemType: item.type))
            
            viewController.tabBarItem = item.barItem
            return viewController
        }
        viewController?.viewControllers = tabBarViewControllers
        delegate?.presenterDidUpdate()
    }
    
    func makeViewController(mainBarItemType type:MainBarItemType) -> UIViewController {
        
        switch type {
        case .images:
            
            return makeImagesViewController()
        default:
            return UIViewController()
        }
    }
    
    func makeImagesViewController() -> UIViewController {
        
        let collectionViewLayout = StretchCollectionViewHeaderLayout()
        collectionViewLayout.sectionInset = UIEdgeInsets(top: -10, left: 0, bottom: 8, right: 0)
        collectionViewLayout.minimumLineSpacing      = 8
        collectionViewLayout.minimumInteritemSpacing = 0
        
        let imageListPresenter = ImagesListPresenter(service: ImageListNetworkService())
        let imageListViewController = ImageListViewController(collectionViewLayout: StretchCollectionViewHeaderLayout(), imagePresenter: imageListPresenter)
        
        return imageListViewController
    }
}
