//
//  yearCollectionViewController.m
//  MyCalender
//
//  Created by LAI KIN WA on 30/8/2018.
//  Copyright © 2018年 LAI KIN WA. All rights reserved.
//

#import "yearCollectionViewController.h"
#import "SSCalendarUtils.h"
#import "RSDFDatePickerDate.h"

@interface yearCollectionViewController ()

@property NSCalendar *calendar;
@property NSDate *fromDate;
@property NSDate *toDate;
@property NSDate *today;
@property NSInteger currentYear;
@property NSDate *startDate;
@property NSDate *endDate;
@property yearCollectionViewCell *selectedCell;

@end

@implementation yearCollectionViewController 

static NSString * const monthReuseIdentifier = @"yearCollectionViewCell";
static NSString * const yearHeaderReuseIdentifier = @"newYearHeader";
bool isFirst=YES;
BOOL isScroll=YES;
SSYearNode *ssYear;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
//    [self.collectionView registerClass:[yearCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
    self.edgesForExtendedLayout=UIRectEdgeNone;
//    self.extendedLayoutIncludesOpaqueBars=YES;
//    self.automaticallyAdjustsScrollViewInsets=YES;
    UINib *cellNib=[UINib nibWithNibName:@"yearCollectionViewCell" bundle:nil];
    [self.collectionView registerNib:cellNib forCellWithReuseIdentifier:monthReuseIdentifier];
    
    _calendar = [NSCalendar currentCalendar];
    
    _today=[NSDate date];
    
    _fromDate = [self dateWithFirstMonthOfYear:[self.calendar dateByAddingComponents:((^{
        NSDateComponents *components=[NSDateComponents new];
        components.year=-6;
        return components;
    })()) toDate:_today options:0]];
    
    _toDate = [self dateWithFirstMonthOfYear:[self.calendar dateByAddingComponents:((^{
        NSDateComponents *components=[NSDateComponents new];
        components.year=6;
        return components;
    })()) toDate:_today options:0]];
    
    _currentYear = [SSCalendarUtils currentYear];
    
    [_btnToday setTarget:self];
    [_btnToday setAction:@selector(scrollToToday)];

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self scrollToDate:_today animated:NO];
    // scrolling here doesn't work (results in your assertion failure)
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
//    if(isFirst){
//        [self scrollToDate:_today animated:NO];
//        isFirst=NO;
//    }
    
}
-(void)scrollToToday{
    [self scrollToDate:_today animated:YES];

}

- (void)scrollToDate:(NSDate *)date animated:(BOOL)animated{
    UICollectionView *cv=self.collectionView;
    UICollectionViewLayout *cvLayout=self.collectionView.collectionViewLayout;
    
    NSDateComponents *dateYearMonthComponents = [self.calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth) fromDate:date];
    NSDate *month = [self.calendar dateFromComponents:dateYearMonthComponents];
    
    _fromDate = [self dateWithFirstMonthOfYear:[self.calendar dateByAddingComponents:((^{
        NSDateComponents *components = [NSDateComponents new];
        components.year = -6;
        return components;
    })()) toDate:month options:0]];
    
    _toDate = [self dateWithFirstMonthOfYear:[self.calendar dateByAddingComponents:((^{
        NSDateComponents *components = [NSDateComponents new];
        components.year = 6;
        return components;
    })()) toDate:month options:0]];
    
    [cv reloadData];
    [cvLayout invalidateLayout];
    [cvLayout prepareLayout];
    
    NSIndexPath *dateItemIndexPath = [self indexPathForDate:date];
    NSInteger yearSection = [self sectionForDate:date];
    
    CGRect dateItemRect = [self frameForItemAtIndexPath:dateItemIndexPath];
    CGRect monthSectionHeaderRect = [self frameForHeaderForSection:yearSection];
    
    CGFloat delta = CGRectGetMaxY(dateItemRect) - CGRectGetMinY(monthSectionHeaderRect);
    CGFloat actualViewHeight = CGRectGetHeight(cv.frame) - cv.contentInset.top - cv.contentInset.bottom;
    
    if (delta <= actualViewHeight) {
        [self scrollToTopOfSection:yearSection animated:animated];
    } else {
        [cv scrollToItemAtIndexPath:dateItemIndexPath atScrollPosition:UICollectionViewScrollPositionBottom animated:animated];
    }
}

- (CGRect)frameForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *attributes = [self.collectionView layoutAttributesForItemAtIndexPath:indexPath];
    
    return attributes.frame;
}

- (NSIndexPath *)indexPathForDate:(NSDate *)date
{
    NSInteger yearSection = [self sectionForDate:date];
    NSDate *firstMonthInYear = [self dateForFirstMonthInSection:yearSection];
    NSInteger dateItem = [self.calendar components:NSCalendarUnitMonth fromDate:firstMonthInYear toDate:date options:0].month;
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:dateItem inSection:yearSection];
    
    return indexPath;
}



- (void)scrollToTopOfSection:(NSInteger)section animated:(BOOL)animated
{
    CGRect headerRect = [self frameForHeaderForSection:section];
    CGPoint topOfHeader = CGPointMake(0, headerRect.origin.y - self.collectionView.contentInset.top);
//    CGPoint topOfHeader = CGPointMake(0, headerRect.origin.y - self.collectionView.contentInset.top - [self collectionView:self.collectionView layout:self.collectionViewLayout referenceSizeForHeaderInSection:section].height);
    [self.collectionView setContentOffset:topOfHeader animated:animated];

}

//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
//    return CGSizeMake(self.collectionView.frame.size.width, 64);
//}

- (CGRect)frameForHeaderForSection:(NSInteger)section
{
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:0 inSection:section];
    UICollectionViewLayoutAttributes *attributes = [self.collectionView layoutAttributesForSupplementaryElementOfKind:UICollectionElementKindSectionHeader atIndexPath:indexPath];
//    UICollectionViewLayoutAttributes *attributes = [self.collectionView layoutAttributesForItemAtIndexPath:indexPath];
    
    return attributes.frame;
}

- (NSInteger)sectionForDate:(NSDate *)date{
    return [self.calendar components:NSCalendarUnitYear fromDate:[self dateForFirstMonthInSection:0] toDate:date options:0].year;
}

- (NSDate *)dateForFirstMonthInSection:(NSInteger)section{
    return [self.calendar dateByAddingComponents:((^{
        NSDateComponents *dateComponents = [NSDateComponents new];
        dateComponents.year=section;
        return dateComponents;
    })()) toDate:_fromDate options:0];
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
    return [self.calendar components:NSCalendarUnitYear fromDate:self.fromDate toDate:self.toDate options:0].year;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
        return 12;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
        
    yearCollectionViewCell *monthCell = [collectionView dequeueReusableCellWithReuseIdentifier:monthReuseIdentifier forIndexPath:indexPath];

    NSDate *date = [self.calendar dateByAddingComponents:((^{
        NSDateComponents *components=[NSDateComponents new];
        components.year=indexPath.section;
        components.month=indexPath.item;
        return components;
    })()) toDate:_fromDate options:0];
    
    RSDFDatePickerDate rsdfDate=[self pickerDateFromDate:date];
    if (ssYear.value!=rsdfDate.year) {
        ssYear= [[SSYearNode alloc] initWithValue:rsdfDate.year];
    }

    monthCell.thisMonth=ssYear.months[indexPath.item];
    
    RSDFDatePickerDate todayDate=[self pickerDateFromDate:_today];
    if (rsdfDate.year==todayDate.year && rsdfDate.month==todayDate.month) {
        monthCell.isCurrentMonth=YES;
    }else{
        monthCell.isCurrentMonth=NO;
    }
    [monthCell setNeedsDisplay];
    
    return monthCell;

}

- (RSDFDatePickerDate)pickerDateFromDate:(NSDate *)date
{
    NSDateComponents *components = [self.calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:date];
    return (RSDFDatePickerDate) {
        components.year,
        components.month,
        components.day
    };
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
    yearHeaderCollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:yearHeaderReuseIdentifier forIndexPath:indexPath];
    
    NSDate *date = [self.calendar dateByAddingComponents:((^{
        NSDateComponents *components=[NSDateComponents new];
        components.year=indexPath.section;
        return components;
    })()) toDate:_fromDate options:0];
    
    NSDateComponents *components=[self.calendar components:NSCalendarUnitYear fromDate:date];
    header.lbYear.text=[NSString stringWithFormat:@"%ld",[components year]];
    
    if (([components year])==_currentYear) {
        header.lbYear.textColor=[UIColor blueColor];
    }else{
        header.lbYear.textColor=[UIColor blackColor];
    }

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

- (void)viewWillLayoutSubviews{

    
    if(self.collectionView.contentOffset.y < 0.0f){
        [self appendPastDates];
    }

//    NSLog(@"self.collectionView.contentOffset:%f", self.collectionView.contentOffset.y);
//    NSLog(@"self.collectionView.contentSize.height:%f", self.collectionView.contentSize.height);
//    NSLog(@"CGRectGetHeight(self.collectionView.bounds):%f", CGRectGetHeight(self.collectionView.bounds));
    if(self.collectionView.contentOffset.y > (self.collectionView.contentSize.height - CGRectGetHeight(self.collectionView.bounds))){
        [self appendFutureDates];
    }

    [super viewWillLayoutSubviews];
}

- (void)appendFutureDates{
    [self shiftDatesByComponents:((^{
        NSDateComponents *dateComponents = [NSDateComponents new];
        dateComponents.year = 6;
        return dateComponents;
    })())];
}

- (void)appendPastDates
{
    [self shiftDatesByComponents:((^{
        NSDateComponents *dateComponents = [NSDateComponents new];
        dateComponents.year = -6;
        return dateComponents;
    })())];
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(20, 20, 15, 20);//top, left, bottom, right
}

- (void)shiftDatesByComponents:(NSDateComponents *)components{
    UICollectionView *cv = self.collectionView;
    UICollectionViewLayout *cvLayout = self.collectionView.collectionViewLayout;
    
    NSArray *visibleCell = [cv visibleCells];
    if(![visibleCell count])
        return;
    
    NSIndexPath *fromIndexPath = [cv indexPathForCell:((UICollectionViewCell *)visibleCell[0])];
    NSInteger fromSection = fromIndexPath.section;
    NSDate *fromSectionOfDate = [self dateForFirstMonthInSection:fromSection];
    UICollectionViewLayoutAttributes *fromAttrs = [cvLayout layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:fromSection]];
    CGPoint fromSectionOrigin = [self.view convertPoint:fromAttrs.frame.origin fromView:cv];

    
    _fromDate=[self dateWithFirstMonthOfYear:[self.calendar dateByAddingComponents:components toDate:self.fromDate options:0]];
    
    _toDate=[self dateWithFirstMonthOfYear:[self.calendar dateByAddingComponents:components toDate:self.toDate options:0]];

    [cv reloadData];
    [cvLayout invalidateLayout];
    [cvLayout prepareLayout];
    
    NSInteger toSection = [self sectionForDate:fromSectionOfDate];
    UICollectionViewLayoutAttributes *toAttrs = [cvLayout layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:toSection]];
    CGPoint toSectionOrigin = [self.view convertPoint:toAttrs.frame.origin fromView:cv];

    [cv setContentOffset:(CGPoint) {
       cv.contentOffset.x,
        cv.contentOffset.y + (toSectionOrigin.y-fromSectionOrigin.y)
    }];
}

- (NSDate *)dateWithFirstMonthOfYear:(NSDate *)date{
    NSDateComponents *dateComponents = [self.calendar components:NSCalendarUnitYear | NSCalendarUnitMonth fromDate:date];
    dateComponents.month=1;
    return [self.calendar dateFromComponents:dateComponents];
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    self.selectedCell=(yearCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    UIStoryboard *storyboard=(UIStoryboard *)[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    monthCollectionViewController *monthCollectionVC=[storyboard instantiateViewControllerWithIdentifier:@"monthCollectionViewController"];
    NSDateComponents *component=[self.calendar components:NSCalendarUnitYear fromDate:_today];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:[NSString stringWithFormat:@"%ld",component.year] style:UIBarButtonItemStylePlain target:nil action:nil];
    [self.navigationController pushViewController:monthCollectionVC animated:YES];
}

@end
