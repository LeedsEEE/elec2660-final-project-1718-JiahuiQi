//
//  ThreeTableViewController.m
//  TRIPADVISOR
//
//  Created by Jiahui Qi on 2017/12/7.
//  Copyright © 2017年 University of Leeds. All rights reserved.
//

#import "ThreeTableViewController.h"
#import "ThreeTableViewCell.h"
#import "FourViewController.h"

@interface ThreeTableViewController ()
@property (strong, nonatomic) NSArray *titleArr;
@property (strong, nonatomic) NSArray *picArr;

@end

@implementation ThreeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if ([self.country isEqualToString:@"China"]) {
        self.titleArr = @[@"BeiJing",
                          ];
        self.picArr = @[@"BeiJing",
                        ];
    }
    if ([self.country isEqualToString:@"Japan"]) {
        self.titleArr = @[@"Tokyo",
                          ];
        self.picArr = @[@"Tokyo",
                        ];
    }
    if ([self.country isEqualToString:@"United Kingdom"]) {
        self.titleArr = @[@"London",@"Leeds"
                          ];
        self.picArr = @[@"London",@"Leeds"
                        ];
    }
    if ([self.country isEqualToString:@"Frankreich"]) {
        self.titleArr = @[@"Paris",
                          ];
        self.picArr = @[@"Paris",
                        ];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark UITableVIew代理方法

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  self.titleArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identiferCell = @"cells";
    ThreeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identiferCell forIndexPath:indexPath];
    if (!cell) {
        cell = [[ThreeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identiferCell];
    }
    cell.titles.text = self.titleArr[indexPath.row];
    [cell.pic setImage:[UIImage imageNamed:self.picArr[indexPath.row]]];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 133;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    FourViewController *vc= [sb instantiateViewControllerWithIdentifier:@"FourViewController"];
    [self.navigationController pushViewController:vc animated:YES];
}





@end
