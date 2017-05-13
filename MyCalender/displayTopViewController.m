//
//  displayTopViewController.m
//  MyCalender
//
//  Created by LAI KIN WA on 7/5/2017.
//  Copyright © 2017年 LAI KIN WA. All rights reserved.
//

#import "displayTopViewController.h"

@interface displayTopViewController ()

@end

int year;
int month;
int day;


@implementation displayTopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    //[self displayWeeks];
    
    
}
-(void)displayWeeks{
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    //get first day of month's weekday
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    
    [components setDay:1];
    [components setMonth:month];
    [components setYear:year];
    NSDate * newDate = [calendar dateFromComponents:components];
    NSDateComponents *comps = [gregorian components:NSCalendarUnitWeekday fromDate:newDate];
    //weekday=[comps weekday];
    
    //numDays=[self getCurrDateInfo:newDate];
    
    //int newWeekDay=weekday-1;//make weekday zero based
    
    //NSLog(@"Day week %d",newWeekDay);
    
    //coordinates for displaying the buttons
    int yVal=60;
    int yCount=1;
    //int displayMonthXCoord=(newWeekDay*45)+7;
    int displayMonthXCoord=_topView.frame.size.width*0.06;
    //Display name of month
    int mbYcoord=0;
    //UIView *motherboard=[[UIView alloc] initWithFrame:CGRectMake(0, mbYcoord, __INTMAX_WIDTH__, 50)];
    //motherboard.backgroundColor=[UIColor redColor];
    //[_topView addSubview:motherboard];

    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"LLL"];
    NSCalendar *greCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSDate *dateFromDateComponentsForDate = [greCalendar dateFromComponents:components];
    
    

    /*for (int i=0; i<7; i++) {
        UILabel *lweek=[[UILabel alloc]initWithFrame:CGRectMake(displayMonthXCoord, _topView.frame.size.height*0.1, _topView.frame.size.width, _topView.frame.size.height)];
        if(i==0)
            lweek.text=@"S";
        if(i==1)
            lweek.text=@"M";
        if(i==2)
            lweek.text=@"T";
        if(i==3)
            lweek.text=@"W";
        if(i==4)
            lweek.text=@"T";
        if(i==5)
            lweek.text=@"F";
        if(i==6)
            lweek.text=@"S";
        
        //lweek.numberOfLines=0;
        [lweek setTextColor:[UIColor redColor]];
        //[tvMonth setFont:[UIFont systemFontOfSize:15]];
        [lweek sizeToFit];
        [_topView addSubview:lweek];
        displayMonthXCoord+=_topView.frame.size.width/7;
    }*/

    
    
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

@end
