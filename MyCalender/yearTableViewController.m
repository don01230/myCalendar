//
//  yearTableViewController.m
//  MyCalender
//
//  Created by LAI KIN WA on 16/5/2018.
//  Copyright © 2018年 LAI KIN WA. All rights reserved.
//

#import "yearTableViewController.h"

@interface yearTableViewController ()

@end

@implementation yearTableViewController
{
    NSArray *devices;
    NSArray *arrayMonth;
    int intYear;

}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    devices=@[@"iPhone",@"iPad",@"iPod",@"iMac",@"iWatch",@"iTV"];
    arrayMonth=@[@"Jan",@"Feb",@"Mar",@"Apr",@"May",@"Jun",@"July",@"Aug",@"Sep",@"Oct",@"Nov",@"Dec"];
    NSLog(@"mainScreen:%f",[[UIScreen mainScreen] bounds].size.height);
    NSLog(@"UIScreen:%f",UIApplication.sharedApplication.statusBarFrame.size.height+self.navigationController.navigationBar.frame.size.height + self.navigationController.toolbar.frame.size.height);
    
    self.yearTableView.rowHeight=[[UIScreen mainScreen] bounds].size.height-(UIApplication.sharedApplication.statusBarFrame.size.height+self.navigationController.navigationBar.frame.size.height + self.navigationController.toolbar.frame.size.height);
    UINib *cellNib=[UINib nibWithNibName:@"yearTableViewCell" bundle:nil];
    [self.tableView registerNib:cellNib forCellReuseIdentifier:@"yearTableViewCell"];
    intYear=2018;
//    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return 12;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSIndexPath *p =indexPath;
    int row = (int)p.row;
//    NSLog(@"indexPath:%d",row);

//    NSString *CellIdentifier = [NSString stringWithFormat:@"cell%ld%ld",indexPath.section,indexPath.row];
//    static NSString *CellIdentifier = @"Cell";
    
    yearTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"yearTableViewCell"];
    
//    [self.tableView reloadData];
    if (!cell) {
        cell = [[yearTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"yearTableViewCell"];
    }
//    [cell prepareForReuse];
    
    cell.lbYear.text=[NSString stringWithFormat:@"%d",2018+row];
    cell.setYear=2018+row;
    [cell setNeedsUpdateConstraints];
    [cell updateConstraintsIfNeeded];
    
    
    // Configure the cell...
//    [cell.lbYear setText:[NSString stringWithFormat:@"%d",intYear]];

//    january=[[UIView alloc] init];
//    UIView *february=[[UIView alloc] init];
//    UIView *march=[[UIView alloc] init];
//    UIView *april=[[UIView alloc] init];
//    UIView *may=[[UIView alloc] init];
//    UIView *june=[[UIView alloc] init];
//    UIView *july=[[UIView alloc] init];
//    UIView *august=[[UIView alloc] init];
//    UIView *september=[[UIView alloc] init];
//    UIView *october=[[UIView alloc] init];
//    UIView *november=[[UIView alloc] init];
//    UIView *december=[[UIView alloc] init];
//
//    [january setTranslatesAutoresizingMaskIntoConstraints:NO];
//    [february setTranslatesAutoresizingMaskIntoConstraints:NO];
//    [march setTranslatesAutoresizingMaskIntoConstraints:NO];
//    [april setTranslatesAutoresizingMaskIntoConstraints:NO];
//    [may setTranslatesAutoresizingMaskIntoConstraints:NO];
//    [june setTranslatesAutoresizingMaskIntoConstraints:NO];
//    [july setTranslatesAutoresizingMaskIntoConstraints:NO];
//    [august setTranslatesAutoresizingMaskIntoConstraints:NO];
//    [september setTranslatesAutoresizingMaskIntoConstraints:NO];
//    [october setTranslatesAutoresizingMaskIntoConstraints:NO];
//    [november setTranslatesAutoresizingMaskIntoConstraints:NO];
//    [december setTranslatesAutoresizingMaskIntoConstraints:NO];
//
//    [january setBackgroundColor:[UIColor redColor]];
//    [february setBackgroundColor:[UIColor blueColor]];
//    [march setBackgroundColor:[UIColor greenColor]];
//    [april setBackgroundColor:[UIColor blueColor]];
//    [may setBackgroundColor:[UIColor greenColor]];
//    [june setBackgroundColor:[UIColor redColor]];
//    [july setBackgroundColor:[UIColor greenColor]];
//    [august setBackgroundColor:[UIColor redColor]];
//    [september setBackgroundColor:[UIColor blueColor]];
//    [october setBackgroundColor:[UIColor redColor]];
//    [november setBackgroundColor:[UIColor blueColor]];
//    [december setBackgroundColor:[UIColor greenColor]];
//
//    [cell.yearContentView addSubview:january];
//    [cell.yearContentView addSubview:february];
//    [cell.yearContentView addSubview:march];
//    [cell.yearContentView addSubview:april];
//    [cell.yearContentView addSubview:may];
//    [cell.yearContentView addSubview:june];
//    [cell.yearContentView addSubview:july];
//    [cell.yearContentView addSubview:august];
//    [cell.yearContentView addSubview:september];
//    [cell.yearContentView addSubview:october];
//    [cell.yearContentView addSubview:november];
//    [cell.yearContentView addSubview:december];
//
//    NSDictionary *views = NSDictionaryOfVariableBindings(january,february,march,april,may,june,july,august,september,october,november,december);
//
//
//    NSArray *horizontalConstraint_1 =[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[january]-0-[february]-0-[march]-0-|" options:0 metrics:nil views:views];
//    NSArray *horizontalConstraint_2 =[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[april]-0-[may]-0-[june]-0-|" options:0 metrics:nil views:views];
//    NSArray *horizontalConstraint_3 =[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[july]-0-[august]-0-[september]-0-|" options:0 metrics:nil views:views];
//    NSArray *horizontalConstraint_4 =[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[october]-0-[november]-0-[december]-0-|" options:0 metrics:nil views:views];
//
//
//    NSArray *widthConstraint_1=[NSLayoutConstraint constraintsWithVisualFormat:@"H:[january(==february)]" options:0 metrics:nil views:views];
//    NSArray *widthConstraint_2=[NSLayoutConstraint constraintsWithVisualFormat:@"H:[february(==march)]" options:0 metrics:nil views:views];
//    NSArray *widthConstraint_3=[NSLayoutConstraint constraintsWithVisualFormat:@"H:[april(==may)]" options:0 metrics:nil views:views];
//    NSArray *widthConstraint_4=[NSLayoutConstraint constraintsWithVisualFormat:@"H:[may(==june)]" options:0 metrics:nil views:views];
//    NSArray *widthConstraint_5=[NSLayoutConstraint constraintsWithVisualFormat:@"H:[july(==august)]" options:0 metrics:nil views:views];
//    NSArray *widthConstraint_6=[NSLayoutConstraint constraintsWithVisualFormat:@"H:[august(==september)]" options:0 metrics:nil views:views];
//    NSArray *widthConstraint_7=[NSLayoutConstraint constraintsWithVisualFormat:@"H:[october(==november)]" options:0 metrics:nil views:views];
//    NSArray *widthConstraint_8=[NSLayoutConstraint constraintsWithVisualFormat:@"H:[november(==december)]" options:0 metrics:nil views:views];
//
//    NSArray *verticalConstraint_1 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-55-[january]-0-[april]-0-[july]-0-[october]-0-|" options:0 metrics:nil views:views];
//    NSArray *verticalConstraint_2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-55-[february]-0-[may]-0-[august]-0-[november]-0-|" options:0 metrics:nil views:views];
//    NSArray *verticalConstraint_3 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-55-[march]-0-[june]-0-[september]-0-[december]-0-|" options:0 metrics:nil views:views];
//
//    NSArray *heightConstraint_1=[NSLayoutConstraint constraintsWithVisualFormat:@"V:[january(==april)]" options:0 metrics:nil views:views];
//    NSArray *heightConstraint_2=[NSLayoutConstraint constraintsWithVisualFormat:@"V:[april(==july)]" options:0 metrics:nil views:views];
//    NSArray *heightConstraint_3=[NSLayoutConstraint constraintsWithVisualFormat:@"V:[july(==october)]" options:0 metrics:nil views:views];
//    NSArray *heightConstraint_4=[NSLayoutConstraint constraintsWithVisualFormat:@"V:[february(==may)]" options:0 metrics:nil views:views];
//    NSArray *heightConstraint_5=[NSLayoutConstraint constraintsWithVisualFormat:@"V:[may(==august)]" options:0 metrics:nil views:views];
//    NSArray *heightConstraint_6=[NSLayoutConstraint constraintsWithVisualFormat:@"V:[august(==november)]" options:0 metrics:nil views:views];
//    NSArray *heightConstraint_7=[NSLayoutConstraint constraintsWithVisualFormat:@"V:[march(==june)]" options:0 metrics:nil views:views];
//    NSArray *heightConstraint_8=[NSLayoutConstraint constraintsWithVisualFormat:@"V:[june(==september)]" options:0 metrics:nil views:views];
//    NSArray *heightConstraint_9=[NSLayoutConstraint constraintsWithVisualFormat:@"V:[september(==december)]" options:0 metrics:nil views:views];
    
//    [cell.yearContentView addConstraints:horizontalConstraint_1];
//    [cell.yearContentView addConstraints:horizontalConstraint_2];
//    [cell.yearContentView addConstraints:horizontalConstraint_3];
//    [cell.yearContentView addConstraints:horizontalConstraint_4];
//    [cell.yearContentView addConstraints:verticalConstraint_1];
//    [cell.yearContentView addConstraints:verticalConstraint_2];
//    [cell.yearContentView addConstraints:verticalConstraint_3];
//    [cell.yearContentView addConstraints:widthConstraint_1];
//    [cell.yearContentView addConstraints:widthConstraint_2];
//    [cell.yearContentView addConstraints:widthConstraint_3];
//    [cell.yearContentView addConstraints:widthConstraint_4];
//    [cell.yearContentView addConstraints:widthConstraint_5];
//    [cell.yearContentView addConstraints:widthConstraint_6];
//    [cell.yearContentView addConstraints:widthConstraint_7];
//    [cell.yearContentView addConstraints:widthConstraint_8];
//    [cell.yearContentView addConstraints:heightConstraint_1];
//    [cell.yearContentView addConstraints:heightConstraint_2];
//    [cell.yearContentView addConstraints:heightConstraint_3];
//    [cell.yearContentView addConstraints:heightConstraint_4];
//    [cell.yearContentView addConstraints:heightConstraint_5];
//    [cell.yearContentView addConstraints:heightConstraint_6];
//    [cell.yearContentView addConstraints:heightConstraint_7];
//    [cell.yearContentView addConstraints:heightConstraint_8];
//    [cell.yearContentView addConstraints:heightConstraint_9];
    
//    [self createMonthBoard:january :arrayMonth[0]];
//    [self createMonthBoard:february :arrayMonth[1]];
//    [self createMonthBoard:march :arrayMonth[2]];
//    [self createMonthBoard:april :arrayMonth[3]];
//    [self createMonthBoard:may :arrayMonth[4]];
//    [self createMonthBoard:june :arrayMonth[5]];
//    [self createMonthBoard:july :arrayMonth[6]];
//    [self createMonthBoard:august :arrayMonth[7]];
//    [self createMonthBoard:september :arrayMonth[8]];
//    [self createMonthBoard:october :arrayMonth[9]];
//    [self createMonthBoard:november :arrayMonth[10]];
//    [self createMonthBoard:december :arrayMonth[11]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    monthViewController *viewController = (monthViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"monthViewController"];
    [self.navigationController pushViewController:viewController animated:YES];
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)createMonthBoard:(UIView*)monthBoard :(NSString*)strMonth{
    
//    UILabel *lbMonth=[[UILabel alloc] init];
//    [lbMonth setTranslatesAutoresizingMaskIntoConstraints:NO];
//    [lbMonth setText:strMonth];
//    lbMonth.font=[UIFont boldSystemFontOfSize:25.0f];
//
//    [monthBoard addSubview:lbMonth];
//
//    NSDictionary *views=NSDictionaryOfVariableBindings(lbMonth);
//    NSArray *horizontalContraint=[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[lbMonth]-0-|" options:0 metrics:nil views:views];
//    NSArray *verticalContraint=[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[lbMonth]-0-|" options:0 metrics:nil views:views];
//    [monthBoard addConstraints:horizontalContraint];
//    [monthBoard addConstraints:verticalContraint];
    
//    NSMutableArray *labelArray=[[NSMutableArray alloc] init];
//
//    for(int i=0;i<42;i++){
//        UILabel *label=[[UILabel alloc] init];
//        [label setTranslatesAutoresizingMaskIntoConstraints:NO];
//        label.layer.borderWidth=2;
//        [monthBoard addSubview:label];
//        [labelArray addObject:label];
//    }
    
    UILabel *label_1=[[UILabel alloc] init];
    UILabel *label_2=[[UILabel alloc] init];
    UILabel *label_3=[[UILabel alloc] init];
    UILabel *label_4=[[UILabel alloc] init];
    UILabel *label_5=[[UILabel alloc] init];
    UILabel *label_6=[[UILabel alloc] init];
    UILabel *label_7=[[UILabel alloc] init];
    UILabel *label_8=[[UILabel alloc] init];
    UILabel *label_9=[[UILabel alloc] init];
    UILabel *label_10=[[UILabel alloc] init];
    UILabel *label_11=[[UILabel alloc] init];
    UILabel *label_12=[[UILabel alloc] init];
    UILabel *label_13=[[UILabel alloc] init];
    UILabel *label_14=[[UILabel alloc] init];
    UILabel *label_15=[[UILabel alloc] init];
    UILabel *label_16=[[UILabel alloc] init];
    UILabel *label_17=[[UILabel alloc] init];
    UILabel *label_18=[[UILabel alloc] init];
    UILabel *label_19=[[UILabel alloc] init];
    UILabel *label_20=[[UILabel alloc] init];
    UILabel *label_21=[[UILabel alloc] init];
    UILabel *label_22=[[UILabel alloc] init];
    UILabel *label_23=[[UILabel alloc] init];
    UILabel *label_24=[[UILabel alloc] init];
    UILabel *label_25=[[UILabel alloc] init];
    UILabel *label_26=[[UILabel alloc] init];
    UILabel *label_27=[[UILabel alloc] init];
    UILabel *label_28=[[UILabel alloc] init];
    UILabel *label_29=[[UILabel alloc] init];
    UILabel *label_30=[[UILabel alloc] init];
    UILabel *label_31=[[UILabel alloc] init];
    UILabel *label_32=[[UILabel alloc] init];
    UILabel *label_33=[[UILabel alloc] init];
    UILabel *label_34=[[UILabel alloc] init];
    UILabel *label_35=[[UILabel alloc] init];
    UILabel *label_36=[[UILabel alloc] init];
    UILabel *label_37=[[UILabel alloc] init];
    UILabel *label_38=[[UILabel alloc] init];
    UILabel *label_39=[[UILabel alloc] init];
    UILabel *label_40=[[UILabel alloc] init];
    UILabel *label_41=[[UILabel alloc] init];
    UILabel *label_42=[[UILabel alloc] init];
    
//    label_1.backgroundColor=monthBoard.backgroundColor;
//    label_2.backgroundColor=monthBoard.backgroundColor;
//    label_3.backgroundColor=monthBoard.backgroundColor;
//    label_4.backgroundColor=monthBoard.backgroundColor;
//    label_5.backgroundColor=monthBoard.backgroundColor;
//    label_6.backgroundColor=monthBoard.backgroundColor;
//    label_7.backgroundColor=monthBoard.backgroundColor;
//    label_8.backgroundColor=monthBoard.backgroundColor;
//    label_9.backgroundColor=monthBoard.backgroundColor;
//    label_10.backgroundColor=monthBoard.backgroundColor;
//    label_11.backgroundColor=monthBoard.backgroundColor;
//    label_12.backgroundColor=monthBoard.backgroundColor;
//    label_13.backgroundColor=monthBoard.backgroundColor;
//    label_14.backgroundColor=monthBoard.backgroundColor;
//    label_15.backgroundColor=monthBoard.backgroundColor;
//    label_16.backgroundColor=monthBoard.backgroundColor;
//    label_17.backgroundColor=monthBoard.backgroundColor;
//    label_18.backgroundColor=monthBoard.backgroundColor;
//    label_19.backgroundColor=monthBoard.backgroundColor;
//    label_20.backgroundColor=monthBoard.backgroundColor;
//    label_21.backgroundColor=monthBoard.backgroundColor;
//    label_22.backgroundColor=monthBoard.backgroundColor;
//    label_23.backgroundColor=monthBoard.backgroundColor;
//    label_24.backgroundColor=monthBoard.backgroundColor;
//    label_25.backgroundColor=monthBoard.backgroundColor;
//    label_26.backgroundColor=monthBoard.backgroundColor;
//    label_27.backgroundColor=monthBoard.backgroundColor;
//    label_28.backgroundColor=monthBoard.backgroundColor;
//    label_29.backgroundColor=monthBoard.backgroundColor;
//    label_30.backgroundColor=monthBoard.backgroundColor;
//    label_31.backgroundColor=monthBoard.backgroundColor;
//    label_32.backgroundColor=monthBoard.backgroundColor;
//    label_33.backgroundColor=monthBoard.backgroundColor;
//    label_34.backgroundColor=monthBoard.backgroundColor;
//    label_35.backgroundColor=monthBoard.backgroundColor;
//    label_36.backgroundColor=monthBoard.backgroundColor;
//    label_37.backgroundColor=monthBoard.backgroundColor;
//    label_38.backgroundColor=monthBoard.backgroundColor;
//    label_39.backgroundColor=monthBoard.backgroundColor;
//    label_40.backgroundColor=monthBoard.backgroundColor;
//    label_41.backgroundColor=monthBoard.backgroundColor;
//    label_42.backgroundColor=monthBoard.backgroundColor;
    
    [label_1 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label_2 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label_3 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label_4 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label_5 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label_6 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label_7 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label_8 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label_9 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label_10 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label_11 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label_12 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label_13 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label_14 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label_15 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label_16 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label_17 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label_18 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label_19 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label_20 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label_21 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label_22 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label_23 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label_24 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label_25 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label_26 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label_27 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label_28 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label_29 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label_30 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label_31 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label_32 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label_33 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label_34 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label_35 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label_36 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label_37 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label_38 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label_39 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label_40 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label_41 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label_42 setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    
    label_1.layer.borderWidth=2;
    label_2.layer.borderWidth=2;
    label_3.layer.borderWidth=2;
    label_4.layer.borderWidth=2;
    label_5.layer.borderWidth=2;
    label_6.layer.borderWidth=2;
    label_7.layer.borderWidth=2;
    label_8.layer.borderWidth=2;
    label_9.layer.borderWidth=2;
    label_10.layer.borderWidth=2;
    label_11.layer.borderWidth=2;
    label_12.layer.borderWidth=2;
    label_13.layer.borderWidth=2;
    label_14.layer.borderWidth=2;
    label_15.layer.borderWidth=2;
    label_16.layer.borderWidth=2;
    label_17.layer.borderWidth=2;
    label_18.layer.borderWidth=2;
    label_19.layer.borderWidth=2;
    label_20.layer.borderWidth=2;
    label_21.layer.borderWidth=2;
    label_22.layer.borderWidth=2;
    label_23.layer.borderWidth=2;
    label_24.layer.borderWidth=2;
    label_25.layer.borderWidth=2;
    label_26.layer.borderWidth=2;
    label_27.layer.borderWidth=2;
    label_28.layer.borderWidth=2;
    label_29.layer.borderWidth=2;
    label_30.layer.borderWidth=2;
    label_31.layer.borderWidth=2;
    label_32.layer.borderWidth=2;
    label_33.layer.borderWidth=2;
    label_34.layer.borderWidth=2;
    label_35.layer.borderWidth=2;
    label_36.layer.borderWidth=2;
    label_37.layer.borderWidth=2;
    label_38.layer.borderWidth=2;
    label_39.layer.borderWidth=2;
    label_40.layer.borderWidth=2;
    label_41.layer.borderWidth=2;
    label_42.layer.borderWidth=2;

    [monthBoard addSubview:label_1];
    [monthBoard addSubview:label_2];
    [monthBoard addSubview:label_3];
    [monthBoard addSubview:label_4];
    [monthBoard addSubview:label_5];
    [monthBoard addSubview:label_6];
    [monthBoard addSubview:label_7];
    [monthBoard addSubview:label_8];
    [monthBoard addSubview:label_9];
    [monthBoard addSubview:label_10];
    [monthBoard addSubview:label_11];
    [monthBoard addSubview:label_12];
    [monthBoard addSubview:label_13];
    [monthBoard addSubview:label_14];
    [monthBoard addSubview:label_15];
    [monthBoard addSubview:label_16];
    [monthBoard addSubview:label_17];
    [monthBoard addSubview:label_18];
    [monthBoard addSubview:label_19];
    [monthBoard addSubview:label_20];
    [monthBoard addSubview:label_21];
    [monthBoard addSubview:label_22];
    [monthBoard addSubview:label_23];
    [monthBoard addSubview:label_24];
    [monthBoard addSubview:label_25];
    [monthBoard addSubview:label_26];
    [monthBoard addSubview:label_27];
    [monthBoard addSubview:label_28];
    [monthBoard addSubview:label_29];
    [monthBoard addSubview:label_30];
    [monthBoard addSubview:label_31];
    [monthBoard addSubview:label_32];
    [monthBoard addSubview:label_33];
    [monthBoard addSubview:label_34];
    [monthBoard addSubview:label_35];
    [monthBoard addSubview:label_36];
    [monthBoard addSubview:label_37];
    [monthBoard addSubview:label_38];
    [monthBoard addSubview:label_39];
    [monthBoard addSubview:label_40];
    [monthBoard addSubview:label_41];
    [monthBoard addSubview:label_42];
    

    NSDictionary *views=NSDictionaryOfVariableBindings(label_1,label_2,label_3,label_4,label_5,label_6,label_7,label_8,label_9,label_10,label_11,label_12,label_13,label_14,label_15,label_16,label_17,label_18,label_19,label_20,label_21,label_22,label_23,label_24,label_25,label_26,label_27,label_28,label_29,label_30,label_31,label_32,label_33,label_34,label_35,label_36,label_37,label_38,label_39,label_40,label_41,label_42);
    NSArray *label_horizontalContraint_1=[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[label_1(==label_2)]-0-[label_2(==label_3)]-0-[label_3(==label_4)]-0-[label_4(==label_5)]-0-[label_5(==label_6)]-0-[label_6(==label_7)]-0-[label_7(==label_1)]-0-|" options:0 metrics:nil views:views];
    NSArray *label_horizontalContraint_2=[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[label_8(==label_9)]-0-[label_9(==label_10)]-0-[label_10(==label_11)]-0-[label_11(==label_12)]-0-[label_12(==label_13)]-0-[label_13(==label_14)]-0-[label_14(==label_8)]-0-|" options:0 metrics:nil views:views];
    NSArray *label_horizontalContraint_3=[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[label_15(==label_16)]-0-[label_16(==label_17)]-0-[label_17(==label_18)]-0-[label_18(==label_19)]-0-[label_19(==label_20)]-0-[label_20(==label_21)]-0-[label_21(==label_15)]-0-|" options:0 metrics:nil views:views];
    NSArray *label_horizontalContraint_4=[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[label_22(==label_23)]-0-[label_23(==label_24)]-0-[label_24(==label_25)]-0-[label_25(==label_26)]-0-[label_26(==label_27)]-0-[label_27(==label_28)]-0-[label_28(==label_22)]-0-|" options:0 metrics:nil views:views];
    NSArray *label_horizontalContraint_5=[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[label_29(==label_30)]-0-[label_30(==label_31)]-0-[label_31(==label_32)]-0-[label_32(==label_33)]-0-[label_33(==label_34)]-0-[label_34(==label_35)]-0-[label_35(==label_29)]-0-|" options:0 metrics:nil views:views];
    NSArray *label_horizontalContraint_6=[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[label_36(==label_37)]-0-[label_37(==label_38)]-0-[label_38(==label_39)]-0-[label_39(==label_40)]-0-[label_40(==label_41)]-0-[label_41(==label_42)]-0-[label_42(==label_36)]-0-|" options:0 metrics:nil views:views];
    
    NSArray *label_verticalContraint_1=[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[label_1(==label_8)]-0-[label_8(==label_15)]-0-[label_15(==label_22)]-0-[label_22(==label_29)]-0-[label_29(==label_26)]-0-[label_36(==label_1)]-0-|" options:0 metrics:nil views:views];
    NSArray *label_verticalContraint_2=[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[label_2(==label_9)]-0-[label_9(==label_16)]-0-[label_16(==label_23)]-0-[label_23(==label_30)]-0-[label_30(==label_37)]-0-[label_37(==label_2)]-0-|" options:0 metrics:nil views:views];
    NSArray *label_verticalContraint_3=[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[label_3(==label_10)]-0-[label_10(==label_17)]-0-[label_17(==label_24)]-0-[label_24(==label_31)]-0-[label_31(==label_38)]-0-[label_38(==label_3)]-0-|" options:0 metrics:nil views:views];
    NSArray *label_verticalContraint_4=[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[label_4(==label_11)]-0-[label_11(==label_18)]-0-[label_18(==label_25)]-0-[label_25(==label_32)]-0-[label_32(==label_39)]-0-[label_39(==label_4)]-0-|" options:0 metrics:nil views:views];
    NSArray *label_verticalContraint_5=[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[label_5(==label_12)]-0-[label_12(==label_19)]-0-[label_19(==label_26)]-0-[label_26(==label_33)]-0-[label_33(==label_40)]-0-[label_40(==label_5)]-0-|" options:0 metrics:nil views:views];
    NSArray *label_verticalContraint_6=[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[label_6(==label_13)]-0-[label_13(==label_20)]-0-[label_20(==label_27)]-0-[label_27(==label_34)]-0-[label_34(==label_41)]-0-[label_41(==label_6)]-0-|" options:0 metrics:nil views:views];
    NSArray *label_verticalContraint_7=[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[label_7(==label_14)]-0-[label_14(==label_21)]-0-[label_21(==label_28)]-0-[label_28(==label_35)]-0-[label_35(==label_42)]-0-[label_42(==label_7)]-0-|" options:0 metrics:nil views:views];
    
    [monthBoard addConstraints:label_horizontalContraint_1];
    [monthBoard addConstraints:label_horizontalContraint_2];
    [monthBoard addConstraints:label_horizontalContraint_3];
    [monthBoard addConstraints:label_horizontalContraint_4];
    [monthBoard addConstraints:label_horizontalContraint_5];
    [monthBoard addConstraints:label_horizontalContraint_6];
    
    [monthBoard addConstraints:label_verticalContraint_1];
    [monthBoard addConstraints:label_verticalContraint_2];
    [monthBoard addConstraints:label_verticalContraint_3];
    [monthBoard addConstraints:label_verticalContraint_4];
    [monthBoard addConstraints:label_verticalContraint_5];
    [monthBoard addConstraints:label_verticalContraint_6];
    [monthBoard addConstraints:label_verticalContraint_7];
}

@end
