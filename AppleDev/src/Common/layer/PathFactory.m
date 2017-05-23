//
//  PathFactory.m
//  AppleDev
//
//  Created by warner on 11/13/15.
//  Copyright © 2015 warner. All rights reserved.
//

#import "PathFactory.h"

@interface PathFactory (){
    
}

@end

@implementation PathFactory

+(UIBezierPath *) linePath{
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(30, 30)];
    [path addLineToPoint:CGPointMake(50, 110)];
    [path addLineToPoint:CGPointMake(70, 160)];
    [path addLineToPoint:CGPointMake(90, 190)];
    [path addLineToPoint:CGPointMake(100, 210)];
    [path addLineToPoint:CGPointMake(200, 310)];
    //    [path addLineToPoint:CGPointMake(self.view.frame.size.width, 110)];
    //双点控制
    [path addCurveToPoint:CGPointMake(400, 110) controlPoint1:CGPointMake(30, 200) controlPoint2:CGPointMake(120, 300)];
    //单点控制
    //    [path addQuadCurveToPoint:CGPointMake(self.view.frame.size.width, 110) controlPoint:CGPointMake(100, 150)];
    //闭合曲线
    [path closePath];
    return path;
}

+(UIBezierPath *) circlePath{
    
    //创建出圆形贝塞尔曲线
//    UIBezierPath *circlePath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 200, 200)];
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(100, 100) radius:100 startAngle:0 endAngle:M_PI_2*3 clockwise:YES];
    return circlePath;
}

@end
