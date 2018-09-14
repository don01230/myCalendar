//
//  yearCollectionViewCell.m
//  MyCalender
//
//  Created by LAI KIN WA on 30/8/2018.
//  Copyright © 2018年 LAI KIN WA. All rights reserved.
//

#import "yearCollectionViewCell.h"

@implementation yearCollectionViewCell

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        //initialize code...
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)drawRect:(CGRect)rect{
    NSDateComponents *today = [[SSCalendarUtils calendar] components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay
                                                            fromDate:[NSDate date]];
    
    [super drawRect:rect];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    
    CGContextSetFillColorWithColor(context, [UIColor blackColor].CGColor);
    
    CGFloat headerHeight = 22.0f;
    CGFloat dayWidth=self.frame.size.width/7;
    
    [self drawMonthHeader];
    
    for (SSDayNode *day in _thisMonth.dayNodes) {
        CGFloat x = day.weekday%7 * dayWidth;
        CGFloat y = headerHeight + (day.value + _thisMonth.weekdayOfFirstDay - 1) / 7 * dayWidth;
        rect = CGRectMake(x, y, dayWidth - 2.0f, dayWidth - 2.0f);
        
        if ([day isEqualToDateComponents:today] && _isCurrentMonth==YES) {
            [self drawTodayCircleWithContext:context inRect:rect];

            [self drawTextForToday:day withRadius:dayWidth inRect:rect];
        } else {

            [self drawTextForDay:day withRadius:dayWidth inRect:rect];
        }
    }
    CGContextRestoreGState(context);
}

- (void)drawTodayCircleWithContext:(CGContextRef)context inRect:(CGRect)rect
{
    CGContextAddEllipseInRect(context, rect);
    CGContextSetFillColorWithColor(context, [UIColor blueColor].CGColor);
    CGContextFillPath(context);
    
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
}

- (void)drawDayCircle:(SSDayNode *)day withContext:(CGContextRef)context inRect:(CGRect)rect
{
    if (day.hasEvents > 0) {
        CGContextAddEllipseInRect(context, rect);
        CGContextSetStrokeColorWithColor(context, [UIColor colorWithHexString:COLOR_SECONDARY].CGColor);
        CGContextDrawPath(context, kCGPathStroke);
    }
    CGContextSetFillColorWithColor(context, [UIColor blackColor].CGColor);
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
}

- (void)drawTextForToday:(SSDayNode *)day withRadius:(CGFloat)radius inRect:(CGRect)rect
{
    UIFont *font = [SSStyles boldFontOfSize:[yearCollectionViewCell fontSizeForRadius:radius]];
    NSString *dayText = [NSString stringWithFormat:@"%ld", day.value];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setAlignment:NSTextAlignmentCenter];
    
    [dayText drawInRect:rect withAttributes:@{ NSFontAttributeName: font, NSParagraphStyleAttributeName: paragraphStyle , NSForegroundColorAttributeName: [UIColor whiteColor]}];
}

- (void)drawTextForDay:(SSDayNode *)day withRadius:(CGFloat)radius inRect:(CGRect)rect
{
    UIFont *font = [SSStyles boldFontOfSize:[yearCollectionViewCell fontSizeForRadius:radius]];
    NSString *dayText = [NSString stringWithFormat:@"%ld", day.value];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setAlignment:NSTextAlignmentCenter];
    
    [dayText drawInRect:rect withAttributes:@{ NSFontAttributeName: font, NSParagraphStyleAttributeName: paragraphStyle }];
}

+ (CGFloat)fontSizeForRadius:(CGFloat)radius
{
    if (radius >= 17.0f) {
        return 11.0f;
    } else if (radius >= 16.0f) {
        return 10.0f;
    } else {
        return 8.0f;
    }
}

- (void)drawMonthHeader{
//    NSLog(@"thisMonth.value%ld",_thisMonth.value);
    NSString *title=[[[NSDateFormatter alloc] init] shortMonthSymbols][_thisMonth.value-1];
    if (_isCurrentMonth) {
        [title drawAtPoint:CGPointMake(0, 0) withAttributes:@{ NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue-Bold" size:18.0f], NSForegroundColorAttributeName: [UIColor blueColor]}];
    }else{
        [title drawAtPoint:CGPointMake(0, 0) withAttributes:@{ NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue-Bold" size:18.0f]}];
    }
}

//- (void)setMonth:(SSMonthNode *)month{
//    _thisMonth=month;
//    [self setNeedsDisplay];
//}

//-(void) setCollectionViewDataSourceDelegate:(id<UICollectionViewDataSource,UICollectionViewDelegate>)dataSourceDelegate indexPath:(NSIndexPath *)indexPath{
//
//    _monthCollectionView.dataSource=dataSourceDelegate;
//    _monthCollectionView.delegate=dataSourceDelegate;
//    _monthCollectionView.indexPath=indexPath;
//
//}

@end
