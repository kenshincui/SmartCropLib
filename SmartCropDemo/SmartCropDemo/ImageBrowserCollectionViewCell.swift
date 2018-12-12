//
//  PhotoBrowserCollectionViewCell.swift
//  SmartCropDemo
//
//  Created by Kenshin Cui on 2018/12/11.
//  Copyright © 2018 CMJStudio. All rights reserved.
//

import UIKit

class ImageBrowserCollectionViewCell: UICollectionViewCell {
    
    var dataItem:Int = 0 {
        didSet {
            if dataItem == 0 {
                self.imageView.image = nil
                return
            }
            if let image = UIImage(named: "\(dataItem)") {
                let screenSize = UIScreen.main.bounds.size;
                DispatchQueue.global().async {
                    let smartCropRect = SmartCropper.cropRect(with:image, size: CGSize(width: screenSize.width, height: screenSize.height-(Constants.isiPhoneXSeries ? 88 : 64)))
                    DispatchQueue.main.async {
                        self.imageView.image = cropImage
                    }
                }
                
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        self.contentView.addSubview(self.imageView)
    }
    
    private lazy var imageView:UIImageView = {
        let screenSize = UIScreen.main.bounds.size;
        let temp = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: screenSize.width, height: screenSize.height-(Constants.isiPhoneXSeries ? 88 : 64)))
        temp.contentMode = UIView.ContentMode.scaleAspectFit
        return temp
    }()
}
