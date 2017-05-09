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

-(UIView *)createMonthBoard{
    UIView *monthBoard=[[UIView alloc]init];
    [monthBoard setBackgroundColor:[UIColor blackColor]];
    [monthBoard setTranslatesAutoresizingMaskIntoConstraints:NO];
    [subView addSubview:monthBoard];
    
    NSDictionary *views = NSDictionaryOfVariableBindings(monthBoard);
    
    NSArray *horizontalConstraints =[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[monthBoard]-0-|" options:0 metrics:nil views:views];
    NSArray *heightConstraints1 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-5-[monthBoard(320)]-5-|" options:0 metrics:nil views:views];
    [subView addConstraints:horizontalConstraints];
    [subView addConstraints:heightConstraints1];
    return monthBoard;
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
    
    NSLog(@"Day week %d",weekday);
    
    //coordinates for displaying the buttons
    int yVal=60;
    int yCount=1;
    int displayMonthXCoord=(newWeekDay*45)+7;

    UIView *monthBoard=[self createMonthBoard];
    
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"LLL"];
    NSCalendar *greCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];

    NSDate *dateFromDateComponentsForDate = [greCalendar dateFromComponents:components];
    
    //UILabel *labelMonth=[[UILabel alloc]initWithFrame:CGRectMake(displayMonthXCoord-5, 0, 50, 25)];
    UITextView *labelMonth1=[[UITextView alloc]init];
    UITextView *labelMonth2=[[UITextView alloc]init];
    UITextView *labelMonth3=[[UITextView alloc]init];
    UITextView *labelMonth4=[[UITextView alloc]init];
    UITextView *labelMonth5=[[UITextView alloc]init];
    UITextView *labelMonth6=[[UITextView alloc]init];
    UITextView *labelMonth7=[[UITextView alloc]init];
    UITextView *labelMonth8=[[UITextView alloc]init];
    [labelMonth1 setTextAlignment:NSTextAlignmentCenter];
    [labelMonth2 setTextAlignment:NSTextAlignmentCenter];
    [labelMonth3 setTextAlignment:NSTextAlignmentCenter];
    [labelMonth4 setTextAlignment:NSTextAlignmentCenter];
    [labelMonth5 setTextAlignment:NSTextAlignmentCenter];
    [labelMonth6 setTextAlignment:NSTextAlignmentCenter];
    [labelMonth7 setTextAlignment:NSTextAlignmentCenter];
    [labelMonth8 setTextAlignment:NSTextAlignmentCenter];
    if(weekday==1)
        [labelMonth1 setText:[dateFormatter stringFromDate:dateFromDateComponentsForDate]];
    if(weekday==2)
        [labelMonth2 setText:[dateFormatter stringFromDate:dateFromDateComponentsForDate]];
    if(weekday==3)
        [labelMonth3 setText:[dateFormatter stringFromDate:dateFromDateComponentsForDate]];
    if(weekday==4)
        [labelMonth4 setText:[dateFormatter stringFromDate:dateFromDateComponentsForDate]];
    if(weekday==5)
        [labelMonth5 setText:[dateFormatter stringFromDate:dateFromDateComponentsForDate]];
    if(weekday==6)
        [labelMonth6 setText:[dateFormatter stringFromDate:dateFromDateComponentsForDate]];
    if(weekday==7)
        [labelMonth7 setText:[dateFormatter stringFromDate:dateFromDateComponentsForDate]];
    if(weekday==2)
        [labelMonth8 setText:[dateFormatter stringFromDate:dateFromDateComponentsForDate]];
    [labelMonth1 setTextColor:[UIColor redColor]];
    [labelMonth2 setTextColor:[UIColor redColor]];
    [labelMonth3 setTextColor:[UIColor redColor]];
    [labelMonth4 setTextColor:[UIColor redColor]];
    [labelMonth5 setTextColor:[UIColor redColor]];
    [labelMonth6 setTextColor:[UIColor redColor]];
    [labelMonth7 setTextColor:[UIColor redColor]];

    [labelMonth1 setFont:[UIFont systemFontOfSize:18]];
    [labelMonth2 setFont:[UIFont systemFontOfSize:18]];
    [labelMonth3 setFont:[UIFont systemFontOfSize:18]];
    [labelMonth4 setFont:[UIFont systemFontOfSize:18]];
    [labelMonth5 setFont:[UIFont systemFontOfSize:18]];
    [labelMonth6 setFont:[UIFont systemFontOfSize:18]];
    [labelMonth7 setFont:[UIFont systemFontOfSize:18]];

    [labelMonth1 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labelMonth2 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labelMonth3 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labelMonth4 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labelMonth5 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labelMonth6 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labelMonth7 setTranslatesAutoresizingMaskIntoConstraints:NO];

    [monthBoard addSubview:labelMonth1];
    [monthBoard addSubview:labelMonth2];
    [monthBoard addSubview:labelMonth3];
    [monthBoard addSubview:labelMonth4];
    [monthBoard addSubview:labelMonth5];
    [monthBoard addSubview:labelMonth6];
    [monthBoard addSubview:labelMonth7];

    NSDictionary *views=NSDictionaryOfVariableBindings(labelMonth1,labelMonth2,labelMonth3,labelMonth4,labelMonth5,labelMonth6,labelMonth7);
    
    NSArray *horizontalConstraints1 =[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[labelMonth1]-0-[labelMonth2]-0-[labelMonth3]-0-[labelMonth4]-0-[labelMonth5]-0-[labelMonth6]-0-[labelMonth7]-0-|" options:0 metrics:nil views:views];
    [monthBoard addConstraints:horizontalConstraints1];
    
    for(int i=1;i<7;i++){
        NSMutableString *labelMonth=@"";
        NSString *newString=[labelMonth stringByAppendingFormat:@"[labelMonth%d(==labelMonth%d)]",i,i+1];
        NSLog(@"%@", newString);
        NSArray *equalWidthConstraints1 = [NSLayoutConstraint constraintsWithVisualFormat:newString options:0 metrics:nil views:views];
        [monthBoard addConstraints:equalWidthConstraints1];

    }
    
    for(int i=1;i<=7;i++){
        NSMutableString *labelMonth=@"";
        NSString *newString=[labelMonth stringByAppendingFormat:@"V:|-5-[labelMonth%d(40)]-5-|",i];
        NSLog(@"%@", newString);
        NSArray *heightConstraints1 = [NSLayoutConstraint constraintsWithVisualFormat:newString options:0 metrics:nil views:views];
        [monthBoard addConstraints:heightConstraints1];
    }
    
    /*for (int startD=1; startD<=numDays; startD++) {
        
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
