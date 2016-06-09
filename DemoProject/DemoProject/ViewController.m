//
//  ViewController.m
//  DemoProject
//
//  Created by Masud Shuvo on 6/7/16.
//  Copyright © 2016 Masud Shuvo. All rights reserved.
//

#import "ViewController.h"
#import "MSVennDiagram.h"

@interface ViewController ()

@property (nonatomic, strong) MSVennDiagram *vennDiagram;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.vennDiagram = [[MSVennDiagram alloc] init];
    
    //if want a customise view for venn diagram
    //self.vennDiagram = [[MSVennDiagram alloc] initWithFrame:CGRectMake(100, 150, 300, 150)];
    
    //if want to customise color for set representing circles
    //self.vennDiagram.aSetAreaColor = [UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:0.5];
    //self.vennDiagram.bSetAreaColor = [UIColor colorWithRed:0.0 green:1.0 blue:0.0 alpha:0.5];
    
    self.vennDiagram.frame = CGRectMake(0, 150, self.vennDiagram.frame.size.width, self.vennDiagram.frame.size.height);
    
    [self.vennDiagram vennDiagramForSetA:100 setB:100 setAintersectB:50];
    [self.view addSubview:self.vennDiagram];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
