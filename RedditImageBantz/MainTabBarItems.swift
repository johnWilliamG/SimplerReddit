//
//  TabBarItems.swift
//  RedditImageBantz
//
//  Created by Galloway, John (Associate Software Developer) on 22/04/2017.
//  Copyright © 2017 Galloway, John (Associate Software Developer). All rights reserved.
//

import UIKit

struct MainTabBarItems {
    
    private let firstTabBarItem = UITabBarItem(title: "List", image: nil, selectedImage: nil)
    private let secondTabBarItem = UITabBarItem(title: "Images", image: nil, selectedImage: nil)
    private let thirdTabBarItem = UITabBarItem(title: "Me", image: nil, selectedImage: nil)

    public var barItems: [MainTabBarItem] {
        get {
            let firstItem = MainTabBarItem(type: .list, barItem: firstTabBarItem)
            let secondItem = MainTabBarItem(type: .images, barItem: secondTabBarItem)
            let thirdItem = MainTabBarItem(type: .me, barItem: thirdTabBarItem)
            return [firstItem, secondItem, thirdItem]
        }
    }
}

struct MainTabBarItem {
    
    var type: MainBarItemType
    var barItem: UITabBarItem
}

enum MainBarItemType: String {
    
    case list = "List"
    case images = "Images"
    case me = "Me"
}
