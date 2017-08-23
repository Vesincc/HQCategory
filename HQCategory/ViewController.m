//
//  ViewController.m
//  HQCategory
//
//  Created by HanQi on 2017/8/21.
//  Copyright © 2017年 HanQi. All rights reserved.
//

#import "ViewController.h"
#import "HQCategory.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    view.backgroundColor = [UIColor cyanColor];
    [view hq_addCornerRadius:50];
    
    [self.view addSubview:view];
    
    view = [[UIView alloc] initWithFrame:CGRectMake(100, 0, 100, 100)];
    view.backgroundColor = [UIColor hq_randomColor];
    view.layer.cornerRadius = 50;
    view.layer.masksToBounds = YES;
    
    [self.view addSubview:view];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 100, 100, 100)];
    button.backgroundColor = [UIColor hq_randomColor];
    [button hq_addTouchZoneWithEdge:30];
    [self.view addSubview:button];
    
    [button addTarget:self action:@selector(action) forControlEvents:UIControlEventTouchUpInside];
 
}

- (void)action {
    
    NSLog(@"123");

}


@end
