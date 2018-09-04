//
//  yearCollectionViewController.m
//  MyCalender
//
//  Created by LAI KIN WA on 30/8/2018.
//  Copyright © 2018年 LAI KIN WA. All rights reserved.
//

#import "yearCollectionViewController.h"

@interface yearCollectionViewController ()

@end

@implementation yearCollectionViewController

static NSString * const reuseIdentifier = @"yearCollectionViewCell";
bool isFirst=YES;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
//    [self.collectionView registerClass:[yearCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
    UINib *cellNib=[UINib nibWithNibName:@"yearCollectionViewCell" bundle:nil];
    [self.collectionView registerNib:cellNib forCellWithReuseIdentifier:reuseIdentifier];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // scrolling here doesn't work (results in your assertion failure)
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
//    NSIndexPath *indexPath = [[self.collectionView indexPathsForVisibleItems] lastObject];
//    if(isFirst){
//        NSIndexPath *currentIndexPathReset = [NSIndexPath indexPathForItem:0 inSection:6];
//        UICollectionViewLayoutAttributes *attributes=[self.collectionView.collectionViewLayout layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionHeader atIndexPath:currentIndexPathReset];
//        [self.collectionView setContentOffset:CGPointMake(0, attributes.frame.origin.y-60) animated:NO];
//        isFirst=NO;
//    }
//    [self.collectionView scrollToItemAtIndexPath:currentIndexPathReset atScrollPosition:UICollectionViewScrollPositionTop animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 12;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 12;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    yearCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

#pragma mark <UICollectionViewDelegateFlowLayout>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{

    CGFloat length = (CGRectGetWidth(self.view.frame) / 3)-8;

    return CGSizeMake(length, length+10);
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableView = nil;
    if (kind == UICollectionElementKindSectionHeader) {
        UICollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"yearHeader" forIndexPath:indexPath];
        reusableView = header;
    }
    
    return reusableView;
}

@end
