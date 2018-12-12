//
//  ViewController.swift
//  SmartCropDemo
//
//  Created by Kenshin Cui on 2018/12/3.
//  Copyright © 2018 CMJStudio. All rights reserved.
//

import UIKit
import MobileCoreServices


class ViewController: UIViewController {

    @IBOutlet weak var originImageView: UIImageView!
    
    @IBOutlet weak var smartCropImageView: UIImageView!
    
    @IBOutlet weak var tipLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Smart Crop"
        self.navigationController?.navigationBar.isTranslucent = false
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.smartCropImageView.image = originImage
        self.tipLabel.isHidden = true
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        self.smartCropImageView.image = smartCropImage
        self.tipLabel.isHidden = false
    }
    
    
    @IBAction func photoPickerButtonClick(_ sender: UIButton) {
        self.navigationController?.present(self.photoPickPhotoController, animated: true, completion: {
            
        })
    }

    @IBAction func browserButtonClick(_ sender: UIButton) {
        let browserController = ImageBrowserViewController()
        let navController = UINavigationController(rootViewController: browserController)
        self.navigationController?.present(navController, animated: true, completion: nil)
    }
    
    
    private lazy var photoPickPhotoController: UIImagePickerController = {
        let temp = UIImagePickerController()
        if #available(iOS 11.0, *) {
            temp.imageExportPreset = .compatible
        }
        temp.delegate = self
        temp.sourceType = .photoLibrary
        temp.allowsEditing = false
        return temp
    }()
    
    fileprivate var originImage:UIImage? {
        didSet {
            guard let originImage = originImage else { return }
            let screenSize = UIScreen.main.bounds.size
            let imageSize = CGSize(width: screenSize.width, height: screenSize.height-(Constants.isiPhoneXSeries ? 88 : 64))
            self.originImageView.image = originImage
            
//            self.smartCropImage = smartCrop.crop(with: originImage, size: imageSize)
            self.smartCropImage = SmartCropper.cropImage(originImage, size: imageSize)
            
            self.smartCropImageView.image = self.smartCropImage
        }
    }
    
    fileprivate var smartCropImage:UIImage?

}


extension ViewController:UINavigationControllerDelegate,UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let mediaType = info[UIImagePickerController.InfoKey.mediaType]
        if mediaType as! String == String((kUTTypeImage as NSString)) {
            let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
            self.originImage = image
            self.photoPickPhotoController.dismiss(animated: true, completion: nil)
            self.tipLabel.isHidden = false
            self.tipLabel.text = "Press to view the original image"
        }
    }
}

struct Constants {
    public static let isiPhoneXSeries:Bool = {
        if let window = UIApplication.shared.delegate?.window as? UIWindow {
            if #available(iOS 11.0, *) {
                return window.safeAreaInsets.bottom > 0.0
            }
        }
        return false
    }()
}


