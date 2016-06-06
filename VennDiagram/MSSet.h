//
//  MSSet.h
//  VennDiagram
//
//  Created by Masud Shuvo on 6/7/16.
//  Copyright © 2016 Masud Shuvo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface MSSet : NSObject

/**
 *  Diameter of the region which will represent the set.
 */
@property (nonatomic, assign) float diameter;

/**
 *  Area of the region which will represent the set.
 */
@property (nonatomic, assign) float area;

/**
 *  y position of the set representer.
 */
@property (nonatomic, assign) float yPosition;

/**
 *  Will draw the region to represent the set.
 */
@property (nonatomic, strong) CAShapeLayer *shapeLayer;

/**
 *  Color of the region.
 */
@property (nonatomic, strong) UIColor *areaColor;

@end
