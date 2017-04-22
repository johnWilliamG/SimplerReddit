//
//  File.swift
//  RedditImageBantz
//
//  Created by Galloway, John (Associate Software Developer) on 22/04/2017.
//  Copyright © 2017 Galloway, John (Associate Software Developer). All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    
    var presenter: MainPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.delegate = self
        presenter.viewController = self
        presenter.loadData()
    }
}

extension MainTabBarController: PresenterDelegate {
    
    func presenterDidUpdate() {
        print(self.viewControllers?.count ?? "failed")
    }
    
    func presenterDidFailWithError() -> Error? {
        return nil
    }
}


extension MainTabBarController {
    
    enum Storyboard: String {
        case name = "Main"
    }
}
