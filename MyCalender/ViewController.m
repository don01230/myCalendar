//
//  ViewController.m
//  MyCalender
//
//  Created by LAI KIN WA on 27/12/2016.
//  Copyright © 2016年 LAI KIN WA. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *lbThisMonth;

@end

NSUInteger numDays;
int thisYear;
int thisMonth;
int thisDay;
int weekday;

NSArray * createdAt;
NSArray * hadSession;

//int yVal=60;
//int yCount=1;
double mbYcoord=0;
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self myCalView];
    [self displayMonth:&mbYcoord];
    //[scroller setScrollEnabled:YES];
    //[scroller setContentSize:CGSizeMake(320, 3200)];
    //scroller.backgroundColor=[UIColor redColor];
    /*[scroller setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    //子view的中心横坐标等于父view的中心横坐标
    
    NSLayoutConstraint *constrant1 = [NSLayoutConstraint constraintWithItem:scroller attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
    
    //子view的中心纵坐标等于父view的中心纵坐标
    
    NSLayoutConstraint *constrant2 = [NSLayoutConstraint constraintWithItem:scroller attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:100.0];
    
    //子view的宽度为300
    
    NSLayoutConstraint *constrant3 = [NSLayoutConstraint constraintWithItem:scroller attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0];
    
    //子view的高度为200
    
    NSLayoutConstraint *constrant4 = [NSLayoutConstraint constraintWithItem:scroller attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0];
    
    //把约束添加到父视图上
    
    NSArray *array = [NSArray arrayWithObjects:constrant1, constrant2, constrant3, constrant4, nil, nil];
    
    [self.view addConstraints:array];
    */
    
    //[self display12Month];
}
/*- (IBAction)btnPrevious:(id)sender {
    thisMonth--;
    //[self removeTags];
    [self updateCalNow];
}
- (IBAction)btnNext:(id)sender {
    thisMonth++;
    //[self removeTags];
    [self updateCalNow];
}
-(void)removeTags{
    int x=1;
    while(x<=62){
        [[self.view viewWithTag:x] removeFromSuperview];
        x++;
    }
}*/
-(void)display12Month{
    for (int i=0; i<10; i++) {
        thisMonth++;
        mbYcoord+=320;
        [self displayMonth:&mbYcoord];
    }
}
/*
 This is the method called to create the calendar
 */
-(void)myCalView{
    thisYear = [[[NSCalendar currentCalendar]
                 components:NSCalendarUnitYear fromDate:[NSDate date]]
                year];

    thisMonth=[[[NSCalendar currentCalendar]
                components:NSCalendarUnitMonth fromDate:[NSDate date]]
               month];


    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"u LLL"];
    //_lbThisMonth.text=[dateFormatter stringFromDate:[NSDate date]];
    thisDay=[[[NSCalendar currentCalendar]
              components:NSCalendarUnitDay fromDate:[NSDate date]]
             day];

}

-(void)updateCalNow{// try to condense this so only one method is used instead of two
    if(thisMonth>12){
        thisMonth=1;
        thisYear++;
    }
    
    if(thisMonth<1){
        thisMonth=12;
        thisYear--;
    }
    //[self display];
    [self displayMonth:&mbYcoord];
    //_lbThisMonth.text=[NSString stringWithFormat:@"%d",thisMonth];
    //_lbThisYear.text=[NSString stringWithFormat:@"%d",thisYear];
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"u LLL"];
    NSCalendar *greCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setMonth:thisMonth];
    [components setYear:thisYear];
    NSDate *dateFromDateComponentsForDate = [greCalendar dateFromComponents:components];
    
    //_lbThisMonth.text=[dateFormatter stringFromDate:dateFromDateComponentsForDate];
}

-(NSUInteger)getCurrDateInfo:(NSDate *)myDate{
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSRange rng = [cal rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:myDate];
    NSUInteger numberOfDaysInMonth = rng.length;
    
    return numberOfDaysInMonth;
}

-(void)displayMonth:(double *)mbYcoord{
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    //get first day of month's weekday
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setDay:1];
    [components setMonth:thisMonth];
    [components setYear:thisYear];
    NSDate * newDate = [calendar dateFromComponents:components];
    NSDateComponents *comps = [gregorian components:NSCalendarUnitWeekday fromDate:newDate];
    weekday=[comps weekday];
    
    numDays=[self getCurrDateInfo:newDate];
    
    int newWeekDay=weekday-1;//make weekday zero based
    
    NSLog(@"Day week %d",newWeekDay);
    
    //coordinates for displaying the buttons
    int yVal=60;
    int yCount=1;
    int displayMonthXCoord=(newWeekDay*45)+7;
    //Display name of month
    //create motherboard
    /*UIView *motherboard=[[UIView alloc] init];
    [motherboard setBackgroundColor:[UIColor blackColor]];
    [scroller addSubview:motherboard];
    [motherboard setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    //子view的上边缘离父view的上边缘40个像素
    
    NSLayoutConstraint *contraint1 = [NSLayoutConstraint constraintWithItem:motherboard attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:scroller attribute:NSLayoutAttributeTop multiplier:1.0 constant:40.0];
    
    //子view的左边缘离父view的左边缘40个像素
    
    NSLayoutConstraint *contraint2 = [NSLayoutConstraint constraintWithItem:motherboard attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:scroller attribute:NSLayoutAttributeLeft multiplier:1.0 constant:40.0];
    
    //子view的下边缘离父view的下边缘40个像素
    
    NSLayoutConstraint *contraint3 = [NSLayoutConstraint constraintWithItem:motherboard attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:scroller attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-40.0];
    
    //子view的右边缘离父view的右边缘40个像素
    
    NSLayoutConstraint *contraint4 = [NSLayoutConstraint constraintWithItem:motherboard attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:scroller attribute:NSLayoutAttributeRight multiplier:1.0 constant:-40.0];
    
    NSArray *array = [NSArray arrayWithObjects:contraint1, contraint2, contraint3, contraint4, nil, nil];
    [scroller addConstraints:array];
    */
    
    
    /*NSDateFormatter *dateFormatter=[[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"LLL"];
    NSCalendar *greCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];

    NSDate *dateFromDateComponentsForDate = [greCalendar dateFromComponents:components];
    
    UITextView *tvMonth=[[UITextView alloc]initWithFrame:CGRectMake(displayMonthXCoord-5, 0, 50, 25)];
    [tvMonth setScrollEnabled:NO];
    [tvMonth setSelectable:NO];
    [tvMonth setText:[dateFormatter stringFromDate:dateFromDateComponentsForDate]];
    [tvMonth setTextColor:[UIColor redColor]];
    [tvMonth setFont:[UIFont systemFontOfSize:15]];
    [motherboard addSubview:tvMonth];
    
    for (int startD=1; startD<=numDays; startD++) {
        
        UIButton *addProject = [UIButton buttonWithType: UIButtonTypeRoundedRect];
        
        int xCoord=(newWeekDay*45)+7;
        int yCoord=(yCount*45)+yVal;
        
        UIView *separator = [[UIView alloc] initWithFrame:CGRectMake(xCoord-5, yCoord-5-65, 45, 1)];
        separator.backgroundColor = [UIColor colorWithWhite:0.7 alpha:1];
        separator.tag=startD+31;

        newWeekDay++;
        if(newWeekDay>6){//drops buttons on y axis every 7 days
            newWeekDay=0;
            yCount++;
        }
        //Creates the buttons and gives them each a tag (id)
        int popInt=startD;
        addProject.frame = CGRectMake(xCoord, yCoord-65, 35, 35);
        //addProject.layer.borderWidth=2.0f;
        addProject.layer.cornerRadius=addProject.frame.size.width/2.0;
        addProject.layer.masksToBounds=YES;
        [addProject setTitle:[NSString stringWithFormat:@"%d", startD] forState:UIControlStateNormal];
        //[addProject.layer setBorderWidth:1];
        //[addProject.layer setBorderColor:[[UIColor blackColor] CGColor]];
        //[addProject addTarget:self action:@selector(selectDay:) forControlEvents:UIControlEventTouchUpInside];
        [addProject setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        addProject.tag = startD;
        
        BOOL match=NO;
        
        for(int parseNum=0; parseNum<createdAt.count; parseNum++){
            //Break Down date from Parse
            NSDate * parseDate = createdAt[parseNum];
            NSDateComponents * parseComp = [gregorian components:NSCalendarUnitMonth fromDate:parseDate];
            int parseMonth=(int)[parseComp month];
            int parseYear=(int)[[[NSCalendar currentCalendar]components:NSCalendarUnitYear fromDate:parseDate] year];
            
            int parseDay= (int)[[[NSCalendar currentCalendar]components:NSCalendarUnitDay fromDate:parseDate] day];
            //NSLog(@"year:%d month:%d day:%d",parseYear,parseMonth,parseDay);
            
            if((parseYear==thisYear) && (parseMonth==thisMonth) && (parseDay==startD)){
                match=YES;
                if([hadSession[parseNum] isEqual:@"YES"])
                    addProject.backgroundColor = [UIColor redColor];
                else
                    addProject.backgroundColor = [UIColor greenColor];
                
                NSLog(@"Match %d", startD);
            }
        }
        if(match==NO)
            addProject.backgroundColor = [UIColor whiteColor];
        
        NSDate *parseDate = [NSDate date];
        int year=(int)[[[NSCalendar currentCalendar]components:NSCalendarUnitYear fromDate:parseDate] year];
        int month=(int)[[[NSCalendar currentCalendar]components:NSCalendarUnitMonth fromDate:parseDate] month];
        int day= (int)[[[NSCalendar currentCalendar]components:NSCalendarUnitDay fromDate:parseDate] day];
        //NSLog(@"thisYear:%d thisMonth:%d thisDay:%d",thisYear,thisMonth,thisDay);
        //NSLog(@"year:%d month:%d day:%d",year,month,day);
        if(thisYear==year&&thisMonth==month&&thisDay==day&&day==startD){
            [addProject setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            addProject.backgroundColor=[UIColor redColor];
        }
        
        //[self.view addSubview:addProject];
        [motherboard addSubview:addProject];
        //[self.view addSubview:separator];
        [motherboard addSubview:separator];
    }*/
}

- (void)selectDay:(id)sender{
    UIButton* btn=(UIButton *)sender;
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.backgroundColor=[UIColor redColor];
    [self.view addSubview:btn];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
