//
//  TabBarItems.swift
//  RedditImageBantz
//
//  Created by Galloway, John (Associate Software Developer) on 22/04/2017.
//  Copyright © 2017 Galloway, John (Associate Software Developer). All rights reserved.
//

import UIKit

struct MainTabBarItems {
    
    private let firstBarItem = UITabBarItem(title: "List" , image: nil, selectedImage: nil)
    private let secondBarItem = UITabBarItem(title: "Videos", image: nil, selectedImage: nil)
    private let thirdBarItem = UITabBarItem(title: "Me", image: nil, selectedImage: nil)

    public var barItems: [UITabBarItem] {
        get {
            return [firstBarItem, secondBarItem, thirdBarItem]
        }
    }
}
