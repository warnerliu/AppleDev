//
//  LabelWithBorder.m
//  AppleDev
//
//  Created by warner on 11/12/15.
//  Copyright © 2015 warner. All rights reserved.
//

#import "LabelWithBorder.h"

@implementation LabelWithBorder

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        CALayer *borderLayer = [[CALayer alloc]init];
        // frame是相对于父坐标系
        borderLayer.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        borderLayer.borderWidth  = 2;
        borderLayer.borderColor = [UIColor greenColor].CGColor;
        self.backgroundColor = [UIColor grayColor];
        [self.layer addSublayer:borderLayer];
    }
    return self;
}


@end
