//
//  TestView.h
//  LayoutImageInText
//
//  Created by Haoxiang on 6/14/11.
//  Copyright 2011 DEV. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface TestView : UIView {
    UIImage *image;
    NSString *text;
}

@property (nonatomic, retain) NSString *text;
@property (nonatomic, retain) UIImage *image;

@end
