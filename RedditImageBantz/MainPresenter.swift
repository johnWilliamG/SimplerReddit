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
        
        let tabBarViewControllers = MainTabBarItems().barItems.map { (item: UITabBarItem) -> UIViewController in
            
            let viewController = UIViewController()
            viewController.tabBarItem = item
            return viewController
        }
        
        viewController?.viewControllers = tabBarViewControllers
        delegate?.presenterDidUpdate()
    }
    
    func makeViewController() {
        
    }
}
