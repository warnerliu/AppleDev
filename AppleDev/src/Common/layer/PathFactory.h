//
//  PathFactory.h
//  AppleDev
//
//  Created by warner on 11/13/15.
//  Copyright © 2015 warner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PathFactory : NSObject

+(UIBezierPath *) linePath;
+(UIBezierPath *) circlePath;
@end
