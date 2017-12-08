//
//  FiveTableViewController.m
//  TRIPADVISOR
//
//  Created by Jiahui Qi on 2017/12/8.
//  Copyright © 2017年 University of Leeds. All rights reserved.
//

#import "FiveTableViewController.h"
#import "FiveTableViewCell.h"
#import "ThreeTableViewController.h"

@interface FiveTableViewController ()
@property (strong, nonatomic) NSArray *titleArr;
@property (strong, nonatomic) NSArray *picArr;

@end

@implementation FiveTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    switch (self.indexs) {
        case 0:
            self.titleArr = @[@"China",@"Japan"
                              ];
            self.picArr = @[@"China",@"Japan"];
            
            break;
        case 1:
            self.titleArr = @[@"United Kingdom",@"Frankreich"
                              ];
            self.picArr = @[@"United Kingdom",@"Frankreich"];
            
            break;
            //        case 2:
            //            self.titleArr = @[@"China",@"Japan"
            //                              ];
            //            break;
            //        case 3:
            //            self.titleArr = @[@"China",@"Japan"
            //                              ];
            //            break;
            //        case 4:
            //            self.titleArr = @[@"China",@"Japan"
            //                              ];
            //            break;
            //        case 5:
            //            self.titleArr = @[@"China",@"Japan"
            //                              ];
            //            break;
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
    FiveTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identiferCell forIndexPath:indexPath];
    if (!cell) {
        cell = [[FiveTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identiferCell];
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
    ThreeTableViewController *vc= [sb instantiateViewControllerWithIdentifier:@"ThreeTableViewController"];
    vc.country = self.titleArr[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
