//
//  PhotoBrowserViewController.swift
//  SmartCropDemo
//
//  Created by Kenshin Cui on 2018/12/11.
//  Copyright © 2018 CMJStudio. All rights reserved.
//

import UIKit

class ImageBrowserViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.title = "Real-time cropping"
        self.navigationController?.navigationBar.isTranslucent = false
        self.view.backgroundColor = UIColor.white
        self.navigationItem.rightBarButtonItem = self.rightBarButtonItem
        self.collectionView.register(ImageBrowserCollectionViewCell.self, forCellWithReuseIdentifier: "PhotoBrowserCollectionViewCell")
        self.view.addSubview(self.collectionView)
        self.collectionView.contentInsetAdjustmentBehavior = .never
        
        self.loadData()
    }
    
    @objc func closeButtonClick(_ sender:UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func loadData() {
        self.data += [1,2,3,4,5,6,7,8,9,10]
        self.collectionView.reloadData()
    }
    
    fileprivate lazy var collectionView:UICollectionView = {
        let screenSize = UIScreen.main.bounds.size;
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0.0
        layout.minimumInteritemSpacing = 0.0
        layout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        layout.itemSize = CGSize(width: screenSize.width, height: screenSize.height-(Constants.isiPhoneXSeries ? 88 : 64))
        let temp = UICollectionView(frame: CGRect(x: 0.0, y: 0.0, width: screenSize.width, height: screenSize.height - ( Constants.isiPhoneXSeries ? 88 : 64)), collectionViewLayout: layout)
        temp.isPagingEnabled = true
        temp.dataSource = self
        temp.delegate = self
        temp.showsHorizontalScrollIndicator = false
        temp.showsVerticalScrollIndicator = false
        temp.backgroundColor = UIColor.white
        temp.contentInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
        return temp
    }()
    
    private lazy var rightBarButtonItem:UIBarButtonItem = {
        let temp = UIBarButtonItem(title: "Close", style: UIBarButtonItem.Style.plain, target: self, action: #selector(closeButtonClick(_:)))
        return temp
    }()
    
    fileprivate var data = [Int]()
}

extension ImageBrowserViewController:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSourcePrefetching {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoBrowserCollectionViewCell", for: indexPath) as! ImageBrowserCollectionViewCell
        cell.dataItem = 0
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let dataItem = self.data[indexPath.item]
        (cell as? ImageBrowserCollectionViewCell)?.dataItem = dataItem
    }
}
