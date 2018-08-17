//
//  yearTableViewCell.m
//  MyCalender
//
//  Created by LAI KIN WA on 16/5/2018.
//  Copyright © 2018年 LAI KIN WA. All rights reserved.
//

#import "yearTableViewCell.h"

@implementation yearTableViewCell
{
    int thisYear;
    int thisMonth;
    int thisDay;
    int num;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]){
//        UIView *monthBoard=[[UIView alloc] init];
//        [self.yearContentView addSubview:monthBoard];
        NSLog(@"here");
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    num=0;
    thisYear = (int)[[[NSCalendar currentCalendar]
                 components:NSCalendarUnitYear fromDate:[NSDate date]]
                year];
    
    thisMonth=(int)[[[NSCalendar currentCalendar]
                components:NSCalendarUnitMonth fromDate:[NSDate date]]
               month];

    thisDay=(int)[[[NSCalendar currentCalendar]
              components:NSCalendarUnitDay fromDate:[NSDate date]]
             day];
//    NSLog(@"thisDay:%d",(int)thisDay);
//    NSLog(@"thisMonth:%d",(int)thisMonth);
//    NSLog(@"thisYear:%d",(int)thisYear);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)drawRect:(CGRect)rect{
    double dayWidth=_viewJan.bounds.size.width/7;
    double dayHeight=(_viewJan.bounds.size.height-30)/6;
//    NSLog(@"dayWidth:%f",dayWidth);
    
    
    [self createMonthBoard:_viewJan :_lbJan :1 :dayWidth :dayHeight];
    [self createMonthBoard:_viewFeb :_lbFeb :2 :dayWidth :dayHeight];
    [self createMonthBoard:_viewMar :_lbMar :3 :dayWidth :dayHeight];
    [self createMonthBoard:_viewApr :_lbApr :4 :dayWidth :dayHeight];
    [self createMonthBoard:_viewMay :_lbMay :5 :dayWidth :dayHeight];
    [self createMonthBoard:_viewJun :_lbJun :6 :dayWidth :dayHeight];
    [self createMonthBoard:_viewJul :_lbJul :7 :dayWidth :dayHeight];
    [self createMonthBoard:_viewAug :_lbAug :8 :dayWidth :dayHeight];
    [self createMonthBoard:_viewSep :_lbSep :9 :dayWidth :dayHeight];
    [self createMonthBoard:_viewOct :_lbOct :10 :dayWidth :dayHeight];
    [self createMonthBoard:_viewNov :_lbNov :11 :dayWidth :dayHeight];
    [self createMonthBoard:_viewDec :_lbDec :12 :dayWidth :dayHeight];
}

-(void)createMonthBoard:(UIView*)monthBoard :(UILabel*)lbMonth :(int)intMonth :(double)dayWidth :(double)dayHeight{

    NSCalendar *gregorian=[[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    //get first day of month's weekday
    
    NSCalendar *calendar=[NSCalendar currentCalendar];
//    NSLog(@"NSCalendar:%@",calendar);
    
    NSDateComponents *components=[[NSDateComponents alloc] init];
    [components setDay:1];
    [components setMonth:intMonth];
    [components setYear:_setYear];
    NSDate *newDate=[calendar dateFromComponents:components];
    NSDateComponents *comps=[gregorian components:NSCalendarUnitWeekday fromDate:newDate];
    int weekday=(int)[comps weekday];
    int numDays=(int)[self getCurrDateInfo:newDate];
//    NSLog(@"_setYear:%d",_setYear);
//    NSLog(@"intMonth:%d",intMonth);
//    NSLog(@"numDays:%d",numDays);
//    NSLog(@"weekday:%d",weekday);
    
    double dayX=(weekday-1)*dayWidth;
    double dayY=30;

    for(int i=0;i<numDays;i++){
        num++;
        UILabel *lbDay=[[UILabel alloc] initWithFrame:CGRectMake(dayX, dayY, dayWidth, dayHeight)];
        [lbDay setText:[NSString stringWithFormat:@"%d", i+1]];
        [lbDay setTextAlignment:NSTextAlignmentCenter];
        lbDay.font=[UIFont systemFontOfSize:12];
//        NSLog(@"thisDay:%d",(int)thisDay);
//        NSLog(@"thisMonth:%d",thisMonth);
//        NSLog(@"thisYear:%d,num:%d",_setYear,num);
        if(thisDay==(i+1) && thisMonth==intMonth && thisYear==_setYear){
            [lbDay setBackgroundColor:[UIColor redColor]];
            [lbDay setTextColor:[UIColor whiteColor]];
            lbDay.layer.masksToBounds = YES;
            lbDay.layer.cornerRadius = 9.0;
        }
//        lbDay.layer.borderWidth=1;
        [monthBoard addSubview:lbDay];
        dayX=dayX+dayWidth;
        
        if(weekday==7){
            weekday=0;
            dayX=0;
            dayY=dayY+dayHeight;
        }
        weekday++;
    }
}

-(NSUInteger)getCurrDateInfo:(NSDate *)myDate{
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSRange rng = [cal rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:myDate];
    NSUInteger numberOfDaysInMonth = rng.length;
    
    return numberOfDaysInMonth;
}

-(void)prepareForReuse{
    [super prepareForReuse];
    
//    NSArray *viewsToRemove = [_viewJan subviews];
//    for (UIView *v in viewsToRemove) {
//        [v removeFromSuperview];
//    }
//    viewsToRemove = [_viewFeb subviews];
//    for (UIView *v in viewsToRemove) {
//        [v removeFromSuperview];
//    }
//    viewsToRemove = [_viewMar subviews];
//    for (UIView *v in viewsToRemove) {
//        [v removeFromSuperview];
//    }
//    viewsToRemove = [_viewApr subviews];
//    for (UIView *v in viewsToRemove) {
//        [v removeFromSuperview];
//    }
//    viewsToRemove = [_viewMay subviews];
//    for (UIView *v in viewsToRemove) {
//        [v removeFromSuperview];
//    }
//    viewsToRemove = [_viewJun subviews];
//    for (UIView *v in viewsToRemove) {
//        [v removeFromSuperview];
//    }
//    viewsToRemove = [_viewJul subviews];
//    for (UIView *v in viewsToRemove) {
//        [v removeFromSuperview];
//    }
//    viewsToRemove = [_viewAug subviews];
//    for (UIView *v in viewsToRemove) {
//        [v removeFromSuperview];
//    }
//    viewsToRemove = [_viewSep subviews];
//    for (UIView *v in viewsToRemove) {
//        [v removeFromSuperview];
//    }
//    viewsToRemove = [_viewOct subviews];
//    for (UIView *v in viewsToRemove) {
//        [v removeFromSuperview];
//    }
//    viewsToRemove = [_viewNov subviews];
//    for (UIView *v in viewsToRemove) {
//        [v removeFromSuperview];
//    }
//    viewsToRemove = [_viewDec subviews];
//    for (UIView *v in viewsToRemove) {
//        [v removeFromSuperview];
//    }
//    
//    [self drawRect:CGRectZero];
}

@end
