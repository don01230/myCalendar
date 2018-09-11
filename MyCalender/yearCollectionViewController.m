//
//  yearCollectionViewController.m
//  MyCalender
//
//  Created by LAI KIN WA on 30/8/2018.
//  Copyright © 2018年 LAI KIN WA. All rights reserved.
//

#import "yearCollectionViewController.h"
#import "SSCalendarUtils.h"
@interface yearCollectionViewController ()

@end

@implementation yearCollectionViewController

static NSString * const monthReuseIdentifier = @"yearCollectionViewCell";
static NSString * const yearHeaderReuseIdentifier = @"newYearHeader";
bool isFirst=YES;

- (id)initWithEvents:(NSArray *)events
{
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
//    [self.collectionView registerClass:[yearCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
    UINib *cellNib=[UINib nibWithNibName:@"yearCollectionViewCell" bundle:nil];
    [self.collectionView registerNib:cellNib forCellWithReuseIdentifier:monthReuseIdentifier];
    
    NSInteger year = [SSCalendarUtils currentYear];
    
//    SSYearNode *yearNode1=[[SSYearNode alloc] initWithValue:year];
//    SSYearNode *yearNode2=[[SSYearNode alloc] initWithValue:year+1];
//    SSYearNode *yearNode3=[[SSYearNode alloc] initWithValue:year+2];
//    SSYearNode *yearNode4=[[SSYearNode alloc] initWithValue:year+3];
//    SSYearNode *yearNode5=[[SSYearNode alloc] initWithValue:year+4];
//    self.year=@[yearNode1,yearNode2,yearNode3,yearNode4,yearNode5];
    
    _mutableYear=[[NSMutableArray alloc] init];
    for (int i=-6; i<7; i++) {
        SSYearNode *yearNode=[[SSYearNode alloc] initWithValue:year+i];
        [_mutableYear addObject:yearNode];
    }
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
    if([collectionView isEqual:self.collectionView]){
        return [_mutableYear count];
    }else{
        return 1;
    }
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if([collectionView isEqual:self.collectionView]){
        return 12;
    }else{
        return 1;
    }
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    yearCollectionViewCell *monthCell = [collectionView dequeueReusableCellWithReuseIdentifier:monthReuseIdentifier forIndexPath:indexPath];
//    NSLog(@"indexPath.item:%ld",indexPath.item);
    SSYearNode *year=_mutableYear[indexPath.section];
//    NSLog(@"thisYear.months:%ld",month.value);
    monthCell.thisMonth=year.months[indexPath.item];
    [monthCell setNeedsDisplay];
    
    return monthCell;

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
    CGFloat length = (CGRectGetWidth(self.view.frame) / 3)-18;
    return CGSizeMake(length, length+5);

}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    yearHeaderCollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"newYearHeader" forIndexPath:indexPath];
    SSYearNode *yearNode=_mutableYear[indexPath.section];
    header.lbYear.text=[NSString stringWithFormat:@"%ld",yearNode.value];
    
//    NSLog(@"indexPath:%ld",indexPath.section);
//    NSLog(@"header.lbYear:%@",header.lbYear.text);
    return header;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 5;
}

//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
//    if([collectionView isEqual:self.collectionView]){
//        return 5;
//    }else{
//        return 0;
//    }
//}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(20, 20, 15, 20);//top, left, bottom, right
}

//- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
//    if([collectionView isEqual: self.collectionView]){
//        [(yearCollectionViewCell *)cell setCollectionViewDataSourceDelegate:self indexPath:indexPath];
//    }
//}

@end
