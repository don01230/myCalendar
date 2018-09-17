//
//  monthCollectionViewController.m
//  MyCalender
//
//  Created by LAI KIN WA on 14/9/2018.
//  Copyright © 2018年 LAI KIN WA. All rights reserved.
//

#import "monthCollectionViewController.h"
#import "monthHeaderView.h"
#import "RSDFDatePickerDate.h"

@interface monthCollectionViewController ()

@property NSCalendar *calendar;
@property NSDate *fromDate;
@property NSDate *toDate;
@property NSDate *today;

@end

@implementation monthCollectionViewController

static NSString * const reuseIdentifier = @"Cell";
static NSString * const dayReuseIdentifier = @"dayCollectionViewCell";
static NSString * const firstWeekDayReuseIdentifier = @"firstWeekDayCollectionViewCell";
BOOL isFirstLoadingView=YES;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    self.edgesForExtendedLayout=UIRectEdgeNone;

    // Register cell classes
//    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    UINib *dayCellNib=[UINib nibWithNibName:@"dayCollectionViewCell" bundle:nil];
    [self.collectionView registerNib:dayCellNib forCellWithReuseIdentifier:dayReuseIdentifier];
    UINib *firstWeekDayCellNib=[UINib nibWithNibName:@"firstWeekDayCollectionViewCell" bundle:nil];
    [self.collectionView registerNib:firstWeekDayCellNib forCellWithReuseIdentifier:firstWeekDayReuseIdentifier];
    
    // Do any additional setup after loading the view.
    UIImageView* blackLineImageView = [self findHairlineImageViewUnder:self.navigationController.navigationBar];
    blackLineImageView.hidden = YES;
    
    monthHeaderView *monthHeader=[[monthHeaderView alloc] init];
    [monthHeader setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:monthHeader];

    NSDictionary *views = NSDictionaryOfVariableBindings(monthHeader);
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[monthHeader]-0-|" options:0 metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[monthHeader(15)]" options:0 metrics:nil views:views]];
    
    _calendar=[NSCalendar currentCalendar];
    [self dateInitialize];
}

- (UIImageView *)findHairlineImageViewUnder:(UIView *)view
{
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0)
    {
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self findHairlineImageViewUnder:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    UIImageView* blackLineImageView = [self findHairlineImageViewUnder:self.navigationController.navigationBar];
    blackLineImageView.hidden = NO;
}

//- (void)viewDidDisappear:(BOOL)animated{
//    [super viewDidDisappear:animated];
//    UIImageView* blackLineImageView = [self findHairlineImageViewUnder:self.navigationController.navigationBar];
//    //隐藏黑线（在viewWillAppear时隐藏，在viewWillDisappear时显示）
//    blackLineImageView.hidden = NO;
//}

//- (void)viewDidAppear:(BOOL)animated{
//    [super viewDidAppear:animated];
//    monthHeaderView *monthHeader=[[monthHeaderView alloc] init];
//    [monthHeader setTranslatesAutoresizingMaskIntoConstraints:NO];
//    [self.view addSubview:monthHeader];
//
//    NSDictionary *views = NSDictionaryOfVariableBindings(monthHeader);
//    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[monthHeader]-0-|" options:0 metrics:nil views:views]];
//    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[monthHeader(15)]" options:0 metrics:nil views:views]];
//}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    
    if(isFirstLoadingView){
        [self scrollToDate:_today animated:NO];
        isFirstLoadingView=NO;
    }
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
    return 7*[self numberOfWeeksForMonthOfDate:[self dateForFirstDayInSection:section]];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.item<7) {
        firstWeekDayCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:firstWeekDayReuseIdentifier forIndexPath:indexPath];

        NSDate *firstDayInMonth = [self dateForFirstDayInSection:indexPath.section];
        NSUInteger firstDayInMonthWeekday = [self reorderedWeekday:[self.calendar components:NSCalendarUnitWeekday fromDate:firstDayInMonth].weekday];

        NSDate *cellDate = [self.calendar dateByAddingComponents:((^{
            NSDateComponents *dateComponents = [NSDateComponents new];
            dateComponents.day = indexPath.item - firstDayInMonthWeekday;
            return dateComponents;
        })()) toDate:firstDayInMonth options:0];
        RSDFDatePickerDate cellPickerDate = [self pickerDateFromDate:cellDate];

        cell.lbDay.text = [NSString stringWithFormat:@"%tu", cellPickerDate.day];

        RSDFDatePickerDate firstDayPickerDate = [self pickerDateFromDate:firstDayInMonth];
        cell.notThisMonth = !((firstDayPickerDate.year == cellPickerDate.year) && (firstDayPickerDate.month == cellPickerDate.month));
        if(cell.notThisMonth==YES){
            cell.hidden=YES;
        }else{
            if(cellPickerDate.day==1){
                NSString *title=[[[NSDateFormatter alloc] init] shortMonthSymbols][cellPickerDate.month-1];
                cell.lbMonth.text=title;
                NSDateComponents *components=[self.calendar components:NSCalendarUnitYear|NSCalendarUnitMonth fromDate:_today];
                if (cellPickerDate.year==components.year && cellPickerDate.month==components.month) {
                    cell.lbMonth.textColor=[UIColor blueColor];
                }else{
                    cell.lbMonth.textColor=[UIColor blackColor];
                }
                cell.lbMonth.hidden=NO;
            }else{
                cell.lbMonth.hidden=YES;
            }
            if (indexPath.item==0 || indexPath.item==6) {
                cell.lbDay.textColor=[UIColor lightGrayColor];
            }else{
                cell.lbDay.textColor=[UIColor blackColor];
            }
            cell.hidden=NO;
        }

        [cell setNeedsDisplay];
        return cell;
    }else{
        dayCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:dayReuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
        NSDate *firstDayInMonth = [self dateForFirstDayInSection:indexPath.section];
        NSUInteger firstDayInMonthWeekday = [self reorderedWeekday:[self.calendar components:NSCalendarUnitWeekday fromDate:firstDayInMonth].weekday];

        NSDate *cellDate = [self.calendar dateByAddingComponents:((^{
            NSDateComponents *dateComponents = [NSDateComponents new];
            dateComponents.day = indexPath.item - firstDayInMonthWeekday;
            return dateComponents;
        })()) toDate:firstDayInMonth options:0];
        RSDFDatePickerDate cellPickerDate = [self pickerDateFromDate:cellDate];
    
        cell.lbDay.text = [NSString stringWithFormat:@"%tu", cellPickerDate.day];
        
        RSDFDatePickerDate firstDayPickerDate = [self pickerDateFromDate:firstDayInMonth];
        cell.notThisMonth = !((firstDayPickerDate.year == cellPickerDate.year) && (firstDayPickerDate.month == cellPickerDate.month));
        
        if(cell.notThisMonth==YES){
            cell.hidden=YES;
        }else{
            if (indexPath.item == 7 || indexPath.item == 13 || indexPath.item == 14 || indexPath.item == 20 || indexPath.item == 21 || indexPath.item == 27 || indexPath.item == 28 || indexPath.item == 34 || indexPath.item == 35 || indexPath.item ==41) {
                cell.lbDay.textColor=[UIColor lightGrayColor];
            }else{
                cell.lbDay.textColor=[UIColor blackColor];
            }
            cell.hidden=NO;
        }

//        cell.backgroundColor=[UIColor redColor];
    
        [cell setNeedsDisplay];
        return cell;
    }
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

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(15, 0, 0, 0);
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath{
    CGFloat length=CGRectGetWidth(self.view.frame)/7.0;
    if (indexPath.item<7) {
        return CGSizeMake(length-0.1, length+30);
    }else{
        return CGSizeMake(length-0.1, length);
    }
}

//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
//    return 0;
//}
//
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
//    return 0;
//}

- (NSDate *)dateForFirstDayInSection:(NSInteger)section
{
    return [self.calendar dateByAddingComponents:((^{
        NSDateComponents *dateComponents = [NSDateComponents new];
        dateComponents.month = section;
        return dateComponents;
    })()) toDate:self.fromDate options:0];
}

- (void)dateInitialize{
    NSDateComponents *nowYearMonthComponents = [self.calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth) fromDate:[NSDate date]];
    NSDate *now = [self.calendar dateFromComponents:nowYearMonthComponents];
//    NSLog(@"now:%@",now);
    
    _fromDate = [self dateWithFirstDayOfMonth:[self.calendar dateByAddingComponents:((^{
        NSDateComponents *components = [NSDateComponents new];
        components.month = -6;
        return components;
    })()) toDate:now options:0]];
//    NSLog(@"fromDate:%@",_fromDate);
    
    _toDate = [self dateWithFirstDayOfMonth:[self.calendar dateByAddingComponents:((^{
        NSDateComponents *components = [NSDateComponents new];
        components.month = 6;
        return components;
    })()) toDate:(now > self.fromDate ? now : self.fromDate) options:0]];
//    NSLog(@"toDate:%@",_toDate);
    
    NSDateComponents *todayYearMonthDayComponents = [self.calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:[NSDate date]];
    _today = [self.calendar dateFromComponents:todayYearMonthDayComponents];
//    NSLog(@"today:%@",_today);
}

- (NSDate *)dateWithFirstDayOfMonth:(NSDate *)date
{
    NSDateComponents *dateComponents = [self.calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:date];
    dateComponents.day = 1;
    return [self.calendar dateFromComponents:dateComponents];
}

- (NSUInteger)reorderedWeekday:(NSUInteger)weekday
{
    NSInteger ordered = weekday - self.calendar.firstWeekday;
    return ordered;
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

- (NSUInteger)numberOfWeeksForMonthOfDate:(NSDate *)date
{
    NSDate *firstDayInMonth = [self.calendar dateFromComponents:[self.calendar components:NSCalendarUnitYear|NSCalendarUnitMonth fromDate:date]];
    
    NSDate *lastDayInMonth = [self.calendar dateByAddingComponents:((^{
        NSDateComponents *dateComponents = [NSDateComponents new];
        dateComponents.month = 1;
        dateComponents.day = -1;
        return dateComponents;
    })()) toDate:firstDayInMonth options:0];
    
    NSDate *fromFirstWeekday = [self.calendar dateFromComponents:((^{
        NSDateComponents *dateComponents = [self.calendar components:NSCalendarUnitWeekOfYear|NSCalendarUnitYearForWeekOfYear fromDate:firstDayInMonth];
        dateComponents.weekday = self.calendar.firstWeekday;
        return dateComponents;
    })())];
    
    NSDate *toFirstWeekday = [self.calendar dateFromComponents:((^{
        NSDateComponents *dateComponents = [self.calendar components:NSCalendarUnitWeekOfYear|NSCalendarUnitYearForWeekOfYear fromDate:lastDayInMonth];
        dateComponents.weekday = self.calendar.firstWeekday;
        return dateComponents;
    })())];
    
    return 1 + [self.calendar components:NSCalendarUnitWeekOfYear fromDate:fromFirstWeekday toDate:toFirstWeekday options:0].weekOfYear;
}

- (void)scrollToDate:(NSDate *)date animated:(BOOL)animated
{
    
    UICollectionView *cv = self.collectionView;
    UICollectionViewLayout *cvLayout = (UICollectionViewLayout *)self.collectionView.collectionViewLayout;
    
    NSDateComponents *dateYearMonthComponents = [self.calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth) fromDate:date];
    NSDate *month = [self.calendar dateFromComponents:dateYearMonthComponents];
    
    _fromDate = [self dateWithFirstDayOfMonth:[self.calendar dateByAddingComponents:((^{
        NSDateComponents *components = [NSDateComponents new];
        components.month = -6;
        return components;
    })()) toDate:month options:0]];
    
    _toDate = [self dateWithFirstDayOfMonth:[self.calendar dateByAddingComponents:((^{
        NSDateComponents *components = [NSDateComponents new];
        components.month = 6;
        return components;
    })()) toDate:month options:0]];
    
    [cv reloadData];
    [cvLayout invalidateLayout];
    [cvLayout prepareLayout];
    
    NSIndexPath *dateItemIndexPath = [self indexPathForDate:date];
    NSInteger monthSection = [self sectionForDate:date];
    
    CGRect dateItemRect = [self frameForItemAtIndexPath:dateItemIndexPath];
    CGRect monthSectionHeaderRect = [self frameForHeaderForSection:monthSection];
    
    CGFloat delta = CGRectGetMaxY(dateItemRect) - CGRectGetMinY(monthSectionHeaderRect);
    CGFloat actualViewHeight = CGRectGetHeight(cv.frame) - cv.contentInset.top - cv.contentInset.bottom;
    
    if (delta <= actualViewHeight) {
        [self scrollToTopOfSection:monthSection animated:animated];
    } else {
        [cv scrollToItemAtIndexPath:dateItemIndexPath atScrollPosition:UICollectionViewScrollPositionBottom animated:animated];
    }
}

- (NSIndexPath *)indexPathForDate:(NSDate *)date
{
    NSInteger monthSection = [self sectionForDate:date];
    NSDate *firstDayInMonth = [self dateForFirstDayInSection:monthSection];
    NSUInteger weekday = [self reorderedWeekday:[self.calendar components:NSCalendarUnitWeekday fromDate:firstDayInMonth].weekday];
    NSInteger dateItem = [self.calendar components:NSCalendarUnitDay fromDate:firstDayInMonth toDate:date options:0].day + weekday;
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:dateItem inSection:monthSection];
    
    return indexPath;
}

- (NSInteger)sectionForDate:(NSDate *)date;
{
    return [self.calendar components:NSCalendarUnitMonth fromDate:[self dateForFirstDayInSection:0] toDate:date options:0].month;
}

- (CGRect)frameForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *attributes = [self.collectionView layoutAttributesForItemAtIndexPath:indexPath];
    
    return attributes.frame;
}

- (CGRect)frameForHeaderForSection:(NSInteger)section
{
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:0 inSection:section];
    UICollectionViewLayoutAttributes *attributes = [self.collectionView layoutAttributesForSupplementaryElementOfKind:UICollectionElementKindSectionHeader atIndexPath:indexPath];
    
    return attributes.frame;
}

- (void)scrollToTopOfSection:(NSInteger)section animated:(BOOL)animated
{
    CGRect headerRect = [self frameForHeaderForSection:section];
    CGPoint topOfHeader = CGPointMake(0, headerRect.origin.y - self.collectionView.contentInset.top);
    [self.collectionView setContentOffset:topOfHeader animated:animated];
}
@end
