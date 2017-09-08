//
//  ImageListViewController.swift
//  RedditImageBantz
//
//  Created by Galloway, John (Associate Software Developer) on 22/04/2017.
//  Copyright © 2017 Galloway, John (Associate Software Developer). All rights reserved.
//

import UIKit

class ImageListViewController: UIViewController {
    
    public var presenter: ImagesListPresenter!
    
    var collectionView: UICollectionView
    
    var refreshControl: UIRefreshControl = UIRefreshControl()
    
    var dataSource: ImageListDataSource
    
    var delegate: ImageListCollectionViewFlowLayout
    
    init(collectionViewLayout: UICollectionViewLayout, imagePresenter: ImagesListPresenter) {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        presenter = imagePresenter
        dataSource = ImageListDataSource(imageListPresenter: presenter)
        delegate = ImageListCollectionViewFlowLayout(imageListPresenter: presenter)
        super.init(nibName: nil, bundle: nil)
    }
    
    //Don't use this yet
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = dataSource
        collectionView.delegate = delegate
        collectionView.register(UINib(nibName: "ImageListCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ImageListCollectionViewCell")
        collectionView.frame = view.bounds
        collectionView.contentInset = UIEdgeInsetsMake(8, 0, 0, 0)
        
        collectionView.backgroundColor = .clear
        view.addSubview(collectionView)

        presenter.delegate = self
        presenter.loadData()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        DispatchQueue.main.async {
            self.collectionView.layoutIfNeeded()
        }
    }
}


extension ImageListViewController: PresenterDelegate {
    
    func presenterDidUpdate() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func presenterDidFailWithError() -> Error? {
        return nil
    }
}
