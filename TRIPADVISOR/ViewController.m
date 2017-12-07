//
//  ViewController.m
//  TRIPADVISOR
//
//  Created by Jiahui Qi on 2017/11/22.
//  Copyright © 2017年 University of Leeds. All rights reserved.
//

#import "ViewController.h"
#import "TwoViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btn_start;

@end

@implementation ViewController
- (void)btn_startAction{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    TwoViewController *viewcontroller = [sb instantiateViewControllerWithIdentifier:@"TwoViewController"];
    [self.navigationController pushViewController:viewcontroller animated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.btn_start addTarget:self action:@selector(btn_startAction) forControlEvents:UIControlEventTouchUpInside];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
