//
//  MSVennDiagram.h
//  VennDiagram
//
//  Created by Masud Shuvo on 6/5/16.
//  Copyright © 2016 Masud Shuvo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface MSVennDiagram : UIView

/**
 *  Color of set A representing circle.
 */
@property (nonatomic ,strong) UIColor *aSetAreaColor;

/**
 *  Color of set B representing circle.
 */
@property (nonatomic, strong) UIColor *bSetAreaColor;

/**
 *  Initialize this object with a frame.
 *  @param frame of the venn diagram view.
 *  @return An instance of this class based on the passed frame.
 */
-(instancetype)initWithFrame:(CGRect)frame;

/**
 *  Draw a venn diagram with passed parameters.
 *  @param setA value or count of set A.
 *  @param setB value or count of set B.
 *  @param setAintersectB value or count of set A intersect set B.
 */
- (void)vennDiagramForSetA:(float)setA setB:(float)setB setAintersectB:(float)setAintersectB;

@end
