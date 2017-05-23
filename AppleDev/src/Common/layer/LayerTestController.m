//
//  LayerTestController.m
//  AppleDev
//
//  Created by warner on 11/12/15.
//  Copyright © 2015 warner. All rights reserved.
//

#import "LayerTestController.h"
#import "LabelWithBorder.h"
#import "LayerTest.h"
#import "PathFactory.h"

@interface LayerTestController (){
    
}

- (void)initLayer;

@end
@implementation LayerTestController

- (void)viewDidLoad{
    
//    [self initLayer];
    self.view.backgroundColor = [UIColor whiteColor];
    [self drawLineLayer];
}

- (void)addTestLayer{
    
    LayerTest *testLayer = [[LayerTest alloc]init];
    testLayer.frame = self.view.frame;
    testLayer.backgroundColor = [[UIColor greenColor] CGColor];
    [testLayer setNeedsDisplay];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view.layer addSublayer:testLayer];
}

- (void)initLayer{
    
    LabelWithBorder *borderLabel = [[LabelWithBorder alloc]initWithFrame:CGRectMake(50, 50, 100, 100)];
    [self.view addSubview:borderLabel];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)drawLineLayer{
    
    CAShapeLayer *pathLayer = [[CAShapeLayer alloc]init];
    pathLayer.frame = self.view.bounds;
    pathLayer.path = [PathFactory circlePath].CGPath;
    pathLayer.backgroundColor = [UIColor greenColor].CGColor;
    pathLayer.cornerRadius = 20.0;
    pathLayer.strokeColor = [[UIColor redColor] CGColor];
    pathLayer.fillColor = nil;
    pathLayer.lineWidth = 2.0f;
    pathLayer.lineJoin = kCALineJoinBevel;
//    pathLayer.strokeStart = 0;
//    pathLayer.strokeEnd = 0.75;
    [self.view.layer addSublayer:pathLayer];
    
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration = 2.0;
    pathAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
    pathAnimation.toValue = [NSNumber numberWithFloat:1.0f];
    [pathLayer addAnimation:pathAnimation forKey:@"strokeEnd"];
    
}

@end
