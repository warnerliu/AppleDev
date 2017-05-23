//
//  LayerTest.m
//  NativeStorage
//
//  Created by warner on 11/11/15.
//  Copyright © 2015 warner. All rights reserved.
//

#import "LayerTest.h"

@implementation LayerTest

- (void)drawInContext:(CGContextRef)ctx{
    
    if (self.frame.size.width > self.frame.size.height) {
        CGContextAddEllipseInRect(ctx, CGRectMake((self.frame.size.width - self.frame.size.height ) / 2, 0, self.frame.size.height, self.frame.size.height));
    }else{
        CGContextAddEllipseInRect(ctx, CGRectMake(0, (self.frame.size.height - self.frame.size.width ) / 2, self.frame.size.width, self.frame.size.width));
    }

    CGContextSetAlpha(ctx, 0.5);
    CGContextSetLineWidth(ctx, 5);
    CGContextSetRGBStrokeColor(ctx, 1, 0, 0, 1);
//    CGContextSetRGBFillColor(ctx, 0, 0, 1, 1);
    CGContextStrokePath(ctx);
}
@end
