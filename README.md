**SmartCrop.framework** is an efficient picture smart clipping library

# Usage

## Prepare

1. Drag and drop **SmartCrop.framework** from the **SmartCrop** folder into the project 
2. Add **SmartCrop.framework** to **Embedded Binaries**
3. Add **libc++.tbd** to **Linked Frameworks and Libraries**
4. Add **opencv2.framework** into the project (You can download opencv2.framework from [here](https://github.com/opencv/opencv/releases/download/3.4.4/opencv-3.4.4-ios-framework.zip) , it is recommended to use version 3.4.4.)

## code

If you want to get a smart cropped image

```swift
let image = UIImage(named:"demo.jpg")
let smartCropImage = SmartCropper.cropImage(image, size: CGSize(width: 1080, height:1920))
```

If you want to get smart clipping coordinates

```swift
let image = UIImage(named:"demo.jpg")
let smartCropRect = SmartCropper.cropRect(with:image, size: CGSize(width: 1080, height:1920))
```

# Demo

## Demo run

If you want to run SmartCropDemo, just follow the instructions above to download [opencv2.framework](https://github.com/opencv/opencv/releases/download/3.4.4/opencv-3.4.4-ios-framework.zip) and drag it to the SmartCrop folder (note the zip file).

## Output result

Original image1

![]()

After smart crop

Original image2

After smart crop

Original image3

After smart crop


# License

SmartCrop is released under the MIT license. See [LICENSE](https://github.com/kenshincui/SmartCropLib/blob/master/LICENSE.md/LICENSE.md) for details.



