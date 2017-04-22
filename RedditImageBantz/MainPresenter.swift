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
        return UIViewController()
    }
}
