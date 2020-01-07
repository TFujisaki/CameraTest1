//
//  OpenCV.m
//  CameraTest1
//
//  Created by 藤崎達也 on 2020/01/08.
//  Copyright © 2020 藤崎達也. All rights reserved.
//

/*#import "OpenCV.h"

@implementation OpenCV

@end*/


#import <opencv2/opencv.hpp>
#import <opencv2/imgcodecs/ios.h>

#import "OpenCV.h"

@implementation OpenCV

+(UIImage *)GrayScale:(UIImage *)image{
    // convert image to mat
    cv::Mat mat;
    UIImageToMat(image, mat);

    // convert mat to gray scale
    cv::Mat gray;
    cv::cvtColor(mat, gray, cv::COLOR_BGR2GRAY);

    // convert to image
    UIImage * grayImg = MatToUIImage(gray);

    return grayImg;
}

@end
