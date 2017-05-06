//
//  ImageListViewController.swift
//  RedditImageBantz
//
//  Created by Galloway, John (Associate Software Developer) on 22/04/2017.
//  Copyright © 2017 Galloway, John (Associate Software Developer). All rights reserved.
//

import UIKit

class ImageListViewController: UIViewController, UICollectionViewDelegate {
    
    public var presenter: ImagesListPresenter!
    
    var collectionView: UICollectionView
    
    var refreshControl: UIRefreshControl = UIRefreshControl()
    
    var dataSource: ImageListDataSource
    
    var delegate: ImageListCollectionViewFlowLayout
    
    /// init with a custom collection view layout.
    init(collectionViewLayout: UICollectionViewLayout, imagePresenter: ImagesListPresenter) {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        presenter = imagePresenter
        dataSource = ImageListDataSource(imageListPresenter: presenter)
        delegate = ImageListCollectionViewFlowLayout()
        super.init(nibName: nil, bundle: nil)
    }
    
    //Don't use this yet
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLayoutSubviews() {
        collectionView.frame = view.bounds
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        collectionView.contentSize = view.bounds.size
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = dataSource
        collectionView.delegate = delegate
        collectionView.register(UINib(nibName: "ImageListCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ImageListCollectionViewCell")
        collectionView.backgroundColor = .clear
        view.addSubview(collectionView)

        presenter.delegate = self
        presenter.loadData()
    }
    
    func refreshValueDidChange() {
        presenter.loadData()
    }
}


extension ImageListViewController: PresenterDelegate {
    
    
    func presenterDidUpdate() {
        collectionView.reloadData()
    }
    
    func presenterDidFailWithError() -> Error? {
        return nil
    }
    
}
