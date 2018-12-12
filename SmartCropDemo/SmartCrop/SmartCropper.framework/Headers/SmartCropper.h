//
//  SmartCrop.h
//  SmartCrop-iOS
//
//  Created by Kenshin Cui on 2018/11/26.
//  Copyright © 2018 CMJStudio. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SmartCropper : NSObject


/**
 Get smart cropped image
 
 @param image To crop image
 @param size Crop size
 @return Cropped image
 */
+(UIImage *)cropImage:(UIImage *)image size:(CGSize)size;


/**
 Get smart cropped Area
 
 @param image To crop image
 @param size Crop size
 @return The coordinates of the crop area
 */
+(CGRect)cropRectWithImage:(UIImage *)image size:(CGSize)size;

@end

NS_ASSUME_NONNULL_END
