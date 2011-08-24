//
//  NSString+Extern.m
//  LayoutImageInText
//
//  Created by Haoxiang on 6/14/11.
//  Copyright 2011 DEV. All rights reserved.
//

#import "NSString+Extern.h"

@implementation NSString (Extern)

- (NSString *)reversedString {
    NSMutableString *retStr = [NSMutableString stringWithCapacity:[self length]];
    for (int i = 0; i < [self length]; i++)
    {
        [retStr appendString:[self substringWithRange:NSMakeRange(([self length] - i - 1), 1)]];
    }
    return retStr;
}

@end
