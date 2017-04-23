//
//  ImageListViewController.swift
//  RedditImageBantz
//
//  Created by Galloway, John (Associate Software Developer) on 22/04/2017.
//  Copyright © 2017 Galloway, John (Associate Software Developer). All rights reserved.
//

import UIKit

class ImageListViewController: UIViewController {
    
    var presenter: ImagesListPresenter!
    
    var collectionView: UICollectionView
    
    var refreshControl: UIRefreshControl = UIRefreshControl()
    
    /// Convenience init with a default collection view flow layout and properties.
    convenience init() {
        
        let collectionViewLayout = UICollectionViewFlowLayout()
        
        collectionViewLayout.sectionInset            = UIEdgeInsets(top: 6, left: 0, bottom: 6, right: 0)
        collectionViewLayout.minimumLineSpacing      = 4
        collectionViewLayout.minimumInteritemSpacing = 0
        
        self.init(collectionViewLayout: collectionViewLayout)
    }
    
    /// init with a custom collection view layout.
    init(collectionViewLayout: UICollectionViewLayout) {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        super.init(nibName: nil, bundle: nil)
    }
    
    //Don't use this yet
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.frame            = view.bounds
        collectionView.autoresizingMask = [ .flexibleWidth, .flexibleHeight ]
//        collectionView.backgroundColor  = Colors.transparent
        
//        collectionView.dataSource = listAdapter
//        collectionView.delegate   = listAdapter
        
        collectionView.remembersLastFocusedIndexPath = true
        
        refreshControl.addTarget(self, action: #selector(refreshValueDidChange), for: .valueChanged)
        
        collectionView.alwaysBounceVertical = true
        
        if #available(iOS 10.0, *) {
            collectionView.refreshControl = refreshControl
        } else {
            collectionView.insertSubview(refreshControl, at: 0)
        }
        
        refreshControl.superview?.sendSubview(toBack: refreshControl)
        
        if #available(iOS 10.0, *) {
            collectionView.isPrefetchingEnabled = true
//            collectionView.prefetchDataSource   = listAdapter
        }
        
        view.addSubview(collectionView)
        
        presenter.delegate = self
        
//        presenter.register(with: collectionView)
        presenter.loadData()
    }
    
    func refreshValueDidChange() {
        presenter.loadData()
    }
}


extension ImageListViewController: PresenterDelegate {
    
    
    func presenterDidUpdate() {
    }
    
    func presenterDidFailWithError() -> Error? {
        return nil
    }
    
}
