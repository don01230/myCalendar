//
//  ViewController.m
//  MyCalender
//
//  Created by LAI KIN WA on 27/12/2016.
//  Copyright © 2016年 LAI KIN WA. All rights reserved.
//

#import "ViewController.h"
#import "addEventViewController.h"
@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *lbThisMonth;

@end

NSUInteger numDays;
int thisYear;
int thisMonth,unchangedThisMonth;
int thisDay;
int weekday;
int heightOfMonthBoard=0;
NSArray * createdAt;
NSArray * hadSession;

//int yVal=60;
//int yCount=1;
int mbYcoord=0;
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    [self myCalView];
    [self display12Month];
    heightConstraint.constant=heightOfMonthBoard;

    self.navigationItem.title=[NSString stringWithFormat:@"%d",thisYear];
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
    //thisMonth=11;
    for (int i=0; i<12; i++) {
        mbYcoord=i;
        //NSLog(@"mbYcoord:%d",mbYcoord);
        [self displayMonth:mbYcoord];
        thisMonth++;
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
    unchangedThisMonth=thisMonth;

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

-(UIView *)createMonthBoard:(int)numMonth :(int)lastBoardHeight{
    UIView *monthBoard=[[UIView alloc]init];
    [monthBoard setBackgroundColor:[UIColor whiteColor]];
    [monthBoard setTranslatesAutoresizingMaskIntoConstraints:NO];
    [subView addSubview:monthBoard];
    
    NSDictionary *views = NSDictionaryOfVariableBindings(monthBoard);
    
    NSArray *horizontalConstraints =[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[monthBoard]-0-|" options:0 metrics:nil views:views];
    //int height=numMonth*400;
    int rowNum=1;
    int height=400;
    
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
    int tempWeekDay=weekday;
    numDays=[self getCurrDateInfo:newDate];
    
    //NSLog(@"tempWeekDay:%d",tempWeekDay);
    for (int i=1; i<=numDays; i++) {
        if(tempWeekDay==7){
            rowNum++;
            tempWeekDay=0;
        }
        tempWeekDay++;
    }
    if(tempWeekDay==1)
        rowNum-=1;

    if(rowNum<6)
        height-=60;
    NSArray *heightConstraints1 = [NSLayoutConstraint constraintsWithVisualFormat:[NSString stringWithFormat:@"V:|-%d-[monthBoard(%d)]-0-|",lastBoardHeight,height] options:0 metrics:nil views:views];
    [subView addConstraints:horizontalConstraints];
    [subView addConstraints:heightConstraints1];
    return monthBoard;
}
-(UILabel*)createLabel:(NSString*)color :(UIView*)monthBoard{
    UILabel *label=[[UILabel alloc]init];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setTextColor:[UIColor redColor]];
    
    if([color isEqualToString:@"white"])
        [label setBackgroundColor:[UIColor whiteColor]];
    if([color isEqualToString:@"green"])
        [label setBackgroundColor:[UIColor greenColor]];
    if([color isEqualToString:@"blue"])
        [label setBackgroundColor:[UIColor blueColor]];
    
    [label setFont:[UIFont systemFontOfSize:18]];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [monthBoard addSubview:label];
    return label;
}
-(void)btnClick{
    UIStoryboard *main =[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *addEvent = [main instantiateViewControllerWithIdentifier:@"addEventViewController"];
    [self presentViewController:addEvent animated:YES completion:nil];
    
}
-(UIButton*)createRoundedButton:(NSString*)color :(UIView*)monthBoard{
    UIButton *label=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [label addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    
    //[label setNeedsLayout];
    //[label layoutIfNeeded];
    //NSLog(@"label width:%f",label.frame.size.width);
    //label.layer.cornerRadius=label.frame.size.width/2.0;
    label.layer.masksToBounds=YES;
    
    if([color isEqualToString:@"white"])
        [label setBackgroundColor:[UIColor whiteColor]];
    if([color isEqualToString:@"green"])
        [label setBackgroundColor:[UIColor greenColor]];
    if([color isEqualToString:@"blue"])
        [label setBackgroundColor:[UIColor blueColor]];

    [monthBoard addSubview:label];
    
    return label;
}
-(void)createRow:(int)rowNum :(UIView*)monthBoard :(int)day1 :(int)day2 :(int)day3 :(int)day4 :(int)day5 :(int)day6 :(int)day7:(int)month{
    UIButton *label1=[self createRoundedButton:@"white" :monthBoard];
    UIButton *label2=[self createRoundedButton:@"white" :monthBoard];
    UIButton *label3=[self createRoundedButton:@"white" :monthBoard];
    UIButton *label4=[self createRoundedButton:@"white" :monthBoard];
    UIButton *label5=[self createRoundedButton:@"white" :monthBoard];
    UIButton *label6=[self createRoundedButton:@"white" :monthBoard];
    UIButton *label7=[self createRoundedButton:@"white" :monthBoard];

    if(day1!=0)
        [label1 setTitle:[NSString stringWithFormat:@"%d",day1] forState:UIControlStateNormal];
    if(day2!=0)
        [label2 setTitle:[NSString stringWithFormat:@"%d",day2] forState:UIControlStateNormal];
    if(day3!=0)
        [label3 setTitle:[NSString stringWithFormat:@"%d",day3] forState:UIControlStateNormal];
    if(day4!=0)
        [label4 setTitle:[NSString stringWithFormat:@"%d",day4] forState:UIControlStateNormal];
    if(day5!=0)
        [label5 setTitle:[NSString stringWithFormat:@"%d",day5] forState:UIControlStateNormal];
    if(day6!=0)
        [label6 setTitle:[NSString stringWithFormat:@"%d",day6] forState:UIControlStateNormal];
    if(day7!=0)
        [label7 setTitle:[NSString stringWithFormat:@"%d",day7] forState:UIControlStateNormal];
    
    if(thisDay==day1&&month==thisMonth){
        [label1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        label1.backgroundColor=[UIColor redColor];
    }
    if(thisDay==day2&&month==thisMonth){
        [label2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        label2.backgroundColor=[UIColor redColor];
    }
    if(thisDay==day3&&month==thisMonth){
        [label3 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        label3.backgroundColor=[UIColor redColor];
    }
    if(thisDay==day3&&month==thisMonth){
        [label3 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        label3.backgroundColor=[UIColor redColor];
    }
    if(thisDay==day4&&month==thisMonth){
        [label4 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        label4.backgroundColor=[UIColor redColor];
    }
    if(thisDay==day5&&month==thisMonth){
        [label5 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        label5.backgroundColor=[UIColor redColor];
    }
    if(thisDay==day6&&month==thisMonth){
        [label6 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        label6.backgroundColor=[UIColor redColor];
    }
    if(thisDay==day7&&month==thisMonth){
        [label7 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        label7.backgroundColor=[UIColor redColor];
    }
    
    
    NSDictionary *views=NSDictionaryOfVariableBindings(label1,label2,label3,label4,label5,label6,label7);
    
    NSArray *horizontalConstraints1 =[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[label1]-0-[label2]-0-[label3]-0-[label4]-0-[label5]-0-[label6]-0-[label7]-0-|" options:0 metrics:nil views:views];
    [monthBoard addConstraints:horizontalConstraints1];
    
    for(int i=1;i<7;i++){
        NSMutableString *labelMonth=@"";
        NSString *newString=[labelMonth stringByAppendingFormat:@"[label%d(==label%d)]",i,i+1];
        //NSLog(@"%@", newString);
        NSArray *equalWidthConstraints1 = [NSLayoutConstraint constraintsWithVisualFormat:newString options:0 metrics:nil views:views];
        [monthBoard addConstraints:equalWidthConstraints1];
    }
    [label1 setNeedsLayout];
    [label1 layoutIfNeeded];
    //NSLog(@"label width:%f",label1.frame.size.width);
    for(int i=1;i<=7;i++){
        NSMutableString *labelMonth=@"";
        NSString *newString;
        if (rowNum==1)
            newString=[labelMonth stringByAppendingFormat:@"V:|-40-[label%d(%f)]|",i,label1.frame.size.width];
        if (rowNum==2)
            newString=[labelMonth stringByAppendingFormat:@"V:|-100-[label%d(%f)]|",i,label1.frame.size.width];
        if (rowNum==3)
            newString=[labelMonth stringByAppendingFormat:@"V:|-160-[label%d(%f)]|",i,label1.frame.size.width];
        if (rowNum==4)
            newString=[labelMonth stringByAppendingFormat:@"V:|-220-[label%d(%f)]|",i,label1.frame.size.width];
        if (rowNum==5)
            newString=[labelMonth stringByAppendingFormat:@"V:|-280-[label%d(%f)]|",i,label1.frame.size.width];
        if (rowNum==6)
            newString=[labelMonth stringByAppendingFormat:@"V:|-340-[label%d(%f)]|",i,label1.frame.size.width];
        if (rowNum==7)
            newString=[labelMonth stringByAppendingFormat:@"V:|-400-[label%d(%f)]|",i,label1.frame.size.width];
        
        //NSLog(@"%@", newString);
        NSArray *heightConstraints1 = [NSLayoutConstraint constraintsWithVisualFormat:newString options:0 metrics:nil views:views];
        [monthBoard addConstraints:heightConstraints1];
    }
    label1.layer.cornerRadius=label1.frame.size.width/2.0;
    label2.layer.cornerRadius=label1.frame.size.width/2.0;
    label3.layer.cornerRadius=label1.frame.size.width/2.0;
    label4.layer.cornerRadius=label1.frame.size.width/2.0;
    label5.layer.cornerRadius=label1.frame.size.width/2.0;
    label6.layer.cornerRadius=label1.frame.size.width/2.0;
    label7.layer.cornerRadius=label1.frame.size.width/2.0;
    
}
-(void)createFirstRow:(UIView*)monthBoard{
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
    
    //NSLog(@"Day week %d",weekday);
    
    //coordinates for displaying the buttons
    int yVal=60;
    int yCount=1;
    int displayMonthXCoord=(newWeekDay*45)+7;
    
    //UIView *monthBoard=[self createMonthBoard];
    
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"LLL"];
    NSCalendar *greCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSDate *dateFromDateComponentsForDate = [greCalendar dateFromComponents:components];
    
    UILabel *label1=[self createLabel:@"white" :monthBoard];
    UILabel *label2=[self createLabel:@"white" :monthBoard];
    UILabel *label3=[self createLabel:@"white" :monthBoard];
    UILabel *label4=[self createLabel:@"white" :monthBoard];
    UILabel *label5=[self createLabel:@"white" :monthBoard];
    UILabel *label6=[self createLabel:@"white" :monthBoard];
    UILabel *label7=[self createLabel:@"white" :monthBoard];
    if(weekday==1)
        [label1 setText:[dateFormatter stringFromDate:dateFromDateComponentsForDate]];
    if(weekday==2)
        [label2 setText:[dateFormatter stringFromDate:dateFromDateComponentsForDate]];
    if(weekday==3)
        [label3 setText:[dateFormatter stringFromDate:dateFromDateComponentsForDate]];
    if(weekday==4)
        [label4 setText:[dateFormatter stringFromDate:dateFromDateComponentsForDate]];
    if(weekday==5)
        [label5 setText:[dateFormatter stringFromDate:dateFromDateComponentsForDate]];
    if(weekday==6)
        [label6 setText:[dateFormatter stringFromDate:dateFromDateComponentsForDate]];
    if(weekday==7)
        [label7 setText:[dateFormatter stringFromDate:dateFromDateComponentsForDate]];
    
    NSDictionary *views=NSDictionaryOfVariableBindings(label1,label2,label3,label4,label5,label6,label7);
    
    NSArray *horizontalConstraints1 =[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[label1]-0-[label2]-0-[label3]-0-[label4]-0-[label5]-0-[label6]-0-[label7]-0-|" options:0 metrics:nil views:views];
    [monthBoard addConstraints:horizontalConstraints1];
    
    for(int i=1;i<7;i++){
        NSMutableString *labelMonth=@"";
        NSString *newString=[labelMonth stringByAppendingFormat:@"[label%d(==label%d)]",i,i+1];
        //NSLog(@"%@", newString);
        NSArray *equalWidthConstraints1 = [NSLayoutConstraint constraintsWithVisualFormat:newString options:0 metrics:nil views:views];
        [monthBoard addConstraints:equalWidthConstraints1];
        
    }
    
    for(int i=1;i<=7;i++){
        NSMutableString *labelMonth=@"";
        NSString *newString=[labelMonth stringByAppendingFormat:@"V:|[label%d(39)]|",i];
        //NSLog(@"%@", newString);
        NSArray *heightConstraints1 = [NSLayoutConstraint constraintsWithVisualFormat:newString options:0 metrics:nil views:views];
        [monthBoard addConstraints:heightConstraints1];
    }
}
-(void)displayMonth:(int)numMonth{
    UIView *monthBoard=[self createMonthBoard:numMonth :heightOfMonthBoard];
    [monthBoard setNeedsLayout];
    [monthBoard layoutIfNeeded];
    heightOfMonthBoard=heightOfMonthBoard+monthBoard.frame.size.height;
    //NSLog(@"heightOfMonthBoard:%d",heightOfMonthBoard);
    [self createFirstRow:monthBoard];
    int tempWeekDay=weekday;
    int day1=0,day2=0,day3=0,day4=0,day5=0,day6=0,day7=0;
    int rowNum=1;
    for (int i=1; i<=numDays; i++) {
            if(tempWeekDay==1)
                day1=i;
            if(tempWeekDay==2)
                day2=i;
            if(tempWeekDay==3)
                day3=i;
            if(tempWeekDay==4)
                day4=i;
            if(tempWeekDay==5)
                day5=i;
            if(tempWeekDay==6)
                day6=i;
        if(tempWeekDay==7){
            day7=i;
            //NSLog(@"rowNum:%d",rowNum);
            [self createRow:rowNum :monthBoard :day1 :day2 :day3 :day4 :day5 :day6 :day7 :unchangedThisMonth];
            day1=0;
            day2=0;
            day3=0;
            day4=0;
            day5=0;
            day6=0;
            day7=0;
            rowNum++;
            tempWeekDay=0;
        }
            tempWeekDay++;
    }
    if(day1!=0)
        [self createRow:rowNum :monthBoard :day1 :day2 :day3 :day4 :day5 :day6 :day7 :unchangedThisMonth];

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
