//
//  yearCollectionViewCell.m
//  MyCalender
//
//  Created by LAI KIN WA on 30/8/2018.
//  Copyright © 2018年 LAI KIN WA. All rights reserved.
//

#import "yearCollectionViewCell.h"

@implementation yearCollectionViewCell
{
    int thisYear;
    int thisMonth;
    int thisDay;
    int num;
}
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

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    
}

@end
