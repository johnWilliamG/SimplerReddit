//
//  MainPresenter.swift
//  RedditImageBantz
//
//  Created by Galloway, John (Associate Software Developer) on 22/04/2017.
//  Copyright © 2017 Galloway, John (Associate Software Developer). All rights reserved.
//

import UIKit

public protocol Presenter {
    
    associatedtype ViewController: UIViewController
    
    weak var viewController: ViewController? { get set }
    
    weak var delegate: PresenterDelegate? { get }
    
    func loadData()
    
//    optional func cease()
}

public protocol PresenterDelegate: class {
    
    func presenterDidFailWithError() -> Error?
    
    func presenterDidUpdate()
}
