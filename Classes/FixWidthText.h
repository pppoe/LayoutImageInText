//
//  FixWidthText.h
//  LayoutImageInText
//
//  Created by Haoxiang on 6/14/11.
//  Copyright 2011 DEV. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface FixWidthText : NSObject {
//    NSArray *originSyms;
//    NSArray *fixedWidthSyms;
    NSString *originSymStr;
    NSString *fixedWidthSymStr;
}

- (NSString *)textWithFixedWidth:(NSString *)originText;

@end
