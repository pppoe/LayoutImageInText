//
//  TestView.m
//  LayoutImageInText
//
//  Created by Haoxiang on 6/14/11.
//  Copyright 2011 DEV. All rights reserved.
//

#import "TestView.h"
#import "NSString+Extern.h"
#import <CoreText/CoreText.h>

#define kFixedWidthSpace @"　"

@implementation TestView
@synthesize image;
@synthesize text;

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.text = @"";
        self.image = [UIImage imageNamed:@"test.jpg"];
        
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2f];
        
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    
    [[UIColor whiteColor] set];
    [[UIBezierPath bezierPathWithRect:[self bounds]] fill];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    NSString *textStr = self.text;
    
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    
    CTFontRef font = CTFontCreateWithName(CFSTR("Times"), 12, NULL);
    
    CFStringRef keys[] = { kCTFontAttributeName };
    CFTypeRef values[] = { font };
    CFDictionaryRef attr = CFDictionaryCreate(NULL, (const void **)&keys, (const void **)&values,
                                              sizeof(keys) / sizeof(keys[0]), &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);    
    CFStringRef string = CFStringCreateWithCString(NULL, [textStr cStringUsingEncoding:NSUTF8StringEncoding], kCFStringEncodingUTF8);
    CFAttributedStringRef attrString = CFAttributedStringCreate(NULL, string, attr);
    CFRelease(attr);

    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString(attrString);

    float hPadding = 15.0f;
    
    CGPoint ctrPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect));
    CGAffineTransform pathTransform = CGAffineTransformMakeTranslation(ctrPoint.x, ctrPoint.y);
    pathTransform = CGAffineTransformRotate(pathTransform, M_PI);
    pathTransform = CGAffineTransformTranslate(pathTransform, -ctrPoint.x, -ctrPoint.y);
    pathTransform = CGAffineTransformTranslate(CGAffineTransformScale(CGAffineTransformTranslate(pathTransform, ctrPoint.x, 0), -1.0f, 1.0f), -ctrPoint.x, 0.0f);

    CGSize imageSize = CGSizeMake(60, 80);
    CGRect imageRect = CGRectMake(rect.size.width - hPadding - imageSize.width, hPadding, 
                                  imageSize.width, imageSize.height);
    CGMutablePathRef imagePath = CGPathCreateMutable();
    CGPathAddRect(imagePath, &pathTransform, imageRect);
    CGContextDrawImage(context, CGPathGetPathBoundingBox(imagePath), self.image.CGImage);
    CGPathRelease(imagePath);

    CGMutablePathRef path = CGPathCreateMutable();

    CGPathMoveToPoint(path, &pathTransform, hPadding, hPadding);
    CGPathAddLineToPoint(path, &pathTransform, CGRectGetMinX(imageRect), hPadding);
    CGPathAddLineToPoint(path, &pathTransform, CGRectGetMinX(imageRect), CGRectGetMaxY(imageRect));
    CGPathAddLineToPoint(path, &pathTransform, CGRectGetMaxX(imageRect), CGRectGetMaxY(imageRect));
    CGPathAddLineToPoint(path, &pathTransform, CGRectGetMaxX(imageRect), CGRectGetMaxY(rect) - hPadding);
    CGPathAddLineToPoint(path, &pathTransform, hPadding, CGRectGetMaxY(rect) - hPadding);
    CGPathAddLineToPoint(path, &pathTransform, hPadding, hPadding);
    
    CTFrameRef frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, 0), path, NULL);
    CTFrameDraw(frame, context);
    
    CGPathRelease(path);
    CFRelease(frame);
    CFRelease(framesetter);
    
}

- (void)dealloc {
    [text release];
    [image release];
    [super dealloc];
}


@end
