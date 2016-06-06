//
//  MSSet.m
//  VennDiagram
//
//  Created by Masud Shuvo on 6/7/16.
//  Copyright © 2016 Masud Shuvo. All rights reserved.
//

#import "MSSet.h"

@implementation MSSet

-(instancetype)init
{
    self = [super init];
    if (self) {
        self.shapeLayer = [CAShapeLayer layer];
    }
    return self;
}

@end
