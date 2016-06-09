//
//  MSVennDiagram.m
//  VennDiagram
//
//  Created by Masud Shuvo on 6/5/16.
//  Copyright © 2016 Masud Shuvo. All rights reserved.
//

#import "MSVennDiagram.h"
#import "MSSet.h"

@interface MSVennDiagram ()

@property (nonatomic, assign) float setAIntersectBArea;
@property (nonatomic, assign) BOOL isSetBSmallerSet;
@property (nonatomic, strong) MSSet *aSet;
@property (nonatomic, strong) MSSet *bSet;
@property (nonatomic, strong) UIView *vennView;

@end

@implementation MSVennDiagram

-(instancetype)init
{
    return [self initWithFrame:CGRectMake(0, 0, 400, 200)];
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initializeVariables];
    }
    return self;
}

- (void)initializeVariables
{
    self.aSet = [[MSSet alloc] init];
    self.bSet = [[MSSet alloc] init];
    
    self.aSet.areaColor = [UIColor colorWithRed:53.0/255.0 green:196.0/255.0 blue:181.0/255.0 alpha:0.5];
    self.bSet.areaColor = [UIColor colorWithRed:74.0/255.0 green:144.0/255.0 blue:226.0/255.0 alpha:0.5];
    
    self.vennView = [[UIView alloc] init];
    self.vennView.frame = self.bounds;
    [self addSubview:self.vennView];
    
    [[self.vennView layer] addSublayer:self.aSet.shapeLayer];
    [[self.vennView layer] addSublayer:self.bSet.shapeLayer];
}

- (void)setASetAreaColor:(UIColor *)aSetAreaColor
{
    self.aSet.areaColor = aSetAreaColor;
}

- (void)setBSetAreaColor:(UIColor *)bSetAreaColor
{
    self.bSet.areaColor = bSetAreaColor;
}

- (void)vennDiagramForSetA:(float)setA setB:(float)setB setAintersectB:(float)setAintersectB {
    
    [self populateSetObjects:setA setB:setB setAintersectB:setAintersectB viewWidth:self.frame.size.width];
    float distanceBetweenCircleCenters = [self distanceBetweenTwoCircleWithCirclesIntersectArea:self.setAIntersectBArea];
    
    [self.aSet.shapeLayer setPath:[[UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, self.aSet.yPosition, self.aSet.diameter, self.aSet.diameter)] CGPath]];
    [self.aSet.shapeLayer setFillColor:[self.aSet.areaColor CGColor]];
    
    [self.bSet.shapeLayer setPath:[[UIBezierPath bezierPathWithOvalInRect:CGRectMake(self.aSet.diameter - distanceBetweenCircleCenters, self.bSet.yPosition, self.bSet.diameter, self.bSet.diameter)] CGPath]];
    [self.bSet.shapeLayer setFillColor:[self.bSet.areaColor CGColor]];
    
    CGFloat width = self.aSet.diameter + self.bSet.diameter - distanceBetweenCircleCenters;
    CGFloat height = [self radiusOfLargeSet] * 2;
    
    self.vennView.frame = CGRectMake((self.bounds.size.width - width)/2, (self.bounds.size.height - height)/2, width, height);
}

- (void)populateSetObjects:(float)setA setB:(float)setB setAintersectB:(float)setAintersectB viewWidth:(float)viewWidth
{
    if(setA == 0 && setB == 0)
        return;
    if (setA >= setB) {
        self.aSet.diameter = viewWidth / 2;
        self.bSet.diameter = [self diameterForArea:((setB / setA) * [self areaWithDiameter:self.aSet.diameter])];
        
        self.aSet.yPosition = 0;
        self.bSet.yPosition = (self.aSet.diameter - self.bSet.diameter)/2;
        self.setAIntersectBArea = (setAintersectB / setA) * [self areaWithDiameter:self.aSet.diameter];
        self.isSetBSmallerSet = YES;
    }
    else {
        self.bSet.diameter = viewWidth / 2;
        self.aSet.diameter = [self diameterForArea:((setA / setB) * [self areaWithDiameter:self.bSet.diameter])];
        self.bSet.yPosition = 0;
        self.aSet.yPosition = (self.bSet.diameter - self.aSet.diameter)/2;
        self.setAIntersectBArea = (setAintersectB / setB) * [self areaWithDiameter:self.bSet.diameter];
        self.isSetBSmallerSet = NO;
    }
}

- (float)diameterForArea:(float)area
{
    return 2*sqrt(area/M_PI);
}

- (float)areaOfSmallerSet {
    if (self.isSetBSmallerSet) {
        return [self areaWithDiameter:self.bSet.diameter];
    }
    return [self areaWithDiameter:self.aSet.diameter];
}

- (float)radiusOfSmallSet {
    if (self.isSetBSmallerSet) {
        return self.bSet.diameter / 2;
    }
    return self.aSet.diameter / 2;
}

- (float)radiusOfLargeSet {
    if (self.isSetBSmallerSet) {
        return self.aSet.diameter / 2;
    }
    return self.bSet.diameter / 2;
}

- (float)distanceBetweenTwoCircleWithCirclesIntersectArea:(float)ciclesIntersectArea
{
    if (ciclesIntersectArea >= [self areaOfSmallerSet]) {
        return [self radiusOfSmallSet];
    }
    int i = 0;
    float theta, sigma = 0;
    float A = 0;
    do
    {
        i++;
        
        theta = [self angleWithHypotenuse:self.aSet.diameter/2 withAdjacent:self.aSet.diameter/2 - i];
        sigma = [self angleWithHypotenuse:self.bSet.diameter/2 withAdjacent:self.bSet.diameter/2 - i];
        
        A = (pow(self.aSet.diameter / 2, 2) * (theta - sin(2*theta) / 2 )) + (pow(self.bSet.diameter / 2, 2) * (sigma - sin(2*sigma) / 2));
        
    } while(A <= ciclesIntersectArea);
    
    return i * 2;
}

- (float)angleWithHypotenuse:(float)hypotenuse withAdjacent:(float)adjacent
{
    return acos(adjacent / hypotenuse);
}

- (float)areaWithDiameter:(float)diameter
{
    return M_PI * pow(diameter / 2, 2) ;
}

@end
