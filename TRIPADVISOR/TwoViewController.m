//
//  TwoViewController.m
//  TRIPADVISOR
//
//  Created by Jiahui Qi on 2017/12/7.
//  Copyright © 2017年 University of Leeds. All rights reserved.
//

#import "TwoViewController.h"
#import "TwoCollectionViewCell.h"
#import "TwoCollectionReusableView.h"
#import "ThreeTableViewController.h"
#import "FiveTableViewController.h"
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define UIColorFromHex(hexValue) [UIColor \
colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0 \
green:((float)((hexValue & 0xFF00) >> 8))/255.0 \
blue:((float)(hexValue & 0xFF))/255.0 alpha:1.0]
@interface TwoViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *mCollection;
@property (strong, nonatomic) NSArray *titleArr;
@property (strong, nonatomic) NSArray *picArr;

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleArr = @[@"Asia",@"Europe",@"North America",@"Sourth America",@"Africa",@"Oceania"];
    self.picArr = @[@"Asia",@"Europe",@"North America",@"Sourth America",@"Africa",@"Oceania"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - collctionView Delegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.titleArr.count;
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    TwoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cells" forIndexPath:indexPath];
    
    cell.titles.text = self.titleArr[indexPath.row];
    [cell.pic setImage:[UIImage imageNamed:self.picArr[indexPath.row]]];
    return cell;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(10.01, 5.01, 0.0, 10.01);
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    
    return 0.01;
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0.01;
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake((kScreenWidth-20.06)/2, (kScreenWidth-20.06)/2);
    
}





- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    
    
    UICollectionReusableView *reusableview = nil;
    
    
    if (kind == UICollectionElementKindSectionFooter){
        
        TwoCollectionReusableView *foot = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"FooterView" forIndexPath:indexPath];
        [foot.pic setImage:[UIImage imageNamed:@"Antarctica"]];
        foot.titles.text = @"Antarctica";
        reusableview = foot;
        
        
    }
    
    return reusableview;
    
}

@end

