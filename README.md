![](https://github.com/kenshincui/SmartCropLib/blob/master/Resources/SmartCrop_Logo.jpg)

[![Weibo](https://img.shields.io/badge/Weibo-%40KenshinCui-yellow.svg?style=flat)](https://m.weibo.cn/p/1005051869326357)
![](https://img.shields.io/github/license/mashape/apistatus.svg)

**SmartCrop.framework** is an efficient picture smart clipping library

- [Usage](#usage)
    - **[Prepare](#Prepare)**
    - **[Code](#Code)**
- [Demo](#Demo)
    - **[Demo run](#Demo-run)**
    - **[Output result](#Output-result)**
- [License](#license)

# Usage

## Prepare

1. Drag and drop **SmartCrop.framework** from the **SmartCrop** folder into the project 
2. Add **SmartCrop.framework** to **Embedded Binaries**
3. Add **libc++.tbd** to **Linked Frameworks and Libraries**
4. Add **opencv2.framework** into the project (You can download opencv2.framework from [here](https://github.com/opencv/opencv/releases/download/3.4.4/opencv-3.4.4-ios-framework.zip) , it is recommended to use version 3.4.4.)

## Code

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

![](https://github.com/kenshincui/SmartCropLib/blob/master/Resources/1.jpg)

After smart crop

![](https://github.com/kenshincui/SmartCropLib/blob/master/Resources/1-output.jpg)

Original image2

![](https://github.com/kenshincui/SmartCropLib/blob/master/Resources/2.jpg)

After smart crop

![](https://github.com/kenshincui/SmartCropLib/blob/master/Resources/2-output.jpg)

Original image3

![](https://github.com/kenshincui/SmartCropLib/blob/master/Resources/3.jpg)

After smart crop

![](https://github.com/kenshincui/SmartCropLib/blob/master/Resources/3-output.jpg)


# License

SmartCrop is released under the MIT license. See [LICENSE](https://github.com/kenshincui/SmartCropLib/blob/master/LICENSE.md/LICENSE.md) for details.



