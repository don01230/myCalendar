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
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    devices=@[@"iPhone",@"iPad",@"iPod",@"iMac",@"iWatch",@"iTV"];
    arrayMonth=@[@"Jan",@"Feb",@"Mar",@"Apr",@"May",@"Jun",@"July",@"Aug",@"Sep",@"Oct",@"Nov",@"Dec"];
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
    yearTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"yearTableViewCell"];
//    if(cell==nil){
//        cell=[[yearTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"yearTableViewCell"];
//    }
    // Configure the cell...
    [cell.lbYear setText:@"2018"];
    UIView *january=[[UIView alloc] init];
    UIView *february=[[UIView alloc] init];
    UIView *march=[[UIView alloc] init];
    UIView *april=[[UIView alloc] init];
    UIView *may=[[UIView alloc] init];
    UIView *june=[[UIView alloc] init];
    UIView *july=[[UIView alloc] init];
    UIView *august=[[UIView alloc] init];
    UIView *september=[[UIView alloc] init];
    UIView *october=[[UIView alloc] init];
    UIView *november=[[UIView alloc] init];
    UIView *december=[[UIView alloc] init];

    [january setTranslatesAutoresizingMaskIntoConstraints:NO];
    [february setTranslatesAutoresizingMaskIntoConstraints:NO];
    [march setTranslatesAutoresizingMaskIntoConstraints:NO];
    [april setTranslatesAutoresizingMaskIntoConstraints:NO];
    [may setTranslatesAutoresizingMaskIntoConstraints:NO];
    [june setTranslatesAutoresizingMaskIntoConstraints:NO];
    [july setTranslatesAutoresizingMaskIntoConstraints:NO];
    [august setTranslatesAutoresizingMaskIntoConstraints:NO];
    [september setTranslatesAutoresizingMaskIntoConstraints:NO];
    [october setTranslatesAutoresizingMaskIntoConstraints:NO];
    [november setTranslatesAutoresizingMaskIntoConstraints:NO];
    [december setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [january setBackgroundColor:[UIColor redColor]];
    [february setBackgroundColor:[UIColor blueColor]];
    [march setBackgroundColor:[UIColor greenColor]];
    [april setBackgroundColor:[UIColor blueColor]];
    [may setBackgroundColor:[UIColor greenColor]];
    [june setBackgroundColor:[UIColor redColor]];
    [july setBackgroundColor:[UIColor greenColor]];
    [august setBackgroundColor:[UIColor redColor]];
    [september setBackgroundColor:[UIColor blueColor]];
    [october setBackgroundColor:[UIColor redColor]];
    [november setBackgroundColor:[UIColor blueColor]];
    [december setBackgroundColor:[UIColor greenColor]];

    [cell.yearContentView addSubview:january];
    [cell.yearContentView addSubview:february];
    [cell.yearContentView addSubview:march];
    [cell.yearContentView addSubview:april];
    [cell.yearContentView addSubview:may];
    [cell.yearContentView addSubview:june];
    [cell.yearContentView addSubview:july];
    [cell.yearContentView addSubview:august];
    [cell.yearContentView addSubview:september];
    [cell.yearContentView addSubview:october];
    [cell.yearContentView addSubview:november];
    [cell.yearContentView addSubview:december];
    
    NSDictionary *views = NSDictionaryOfVariableBindings(january,february,march,april,may,june,july,august,september,october,november,december);
//    NSDictionary *views = NSDictionaryOfVariableBindings(january,february,march);
    
    NSArray *horizontalConstraint_1 =[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[january]-0-[february]-0-[march]-0-|" options:0 metrics:nil views:views];
    NSArray *horizontalConstraint_2 =[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[april]-0-[may]-0-[june]-0-|" options:0 metrics:nil views:views];
    NSArray *horizontalConstraint_3 =[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[july]-0-[august]-0-[september]-0-|" options:0 metrics:nil views:views];
    NSArray *horizontalConstraint_4 =[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[october]-0-[november]-0-[december]-0-|" options:0 metrics:nil views:views];
//    NSArray *horizontalConstraint =[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[january]-0-|" options:0 metrics:nil views:views];
    
    NSArray *widthConstraint_1=[NSLayoutConstraint constraintsWithVisualFormat:@"H:[january(==february)]" options:0 metrics:nil views:views];
    NSArray *widthConstraint_2=[NSLayoutConstraint constraintsWithVisualFormat:@"H:[february(==march)]" options:0 metrics:nil views:views];
    NSArray *widthConstraint_3=[NSLayoutConstraint constraintsWithVisualFormat:@"H:[april(==may)]" options:0 metrics:nil views:views];
    NSArray *widthConstraint_4=[NSLayoutConstraint constraintsWithVisualFormat:@"H:[may(==june)]" options:0 metrics:nil views:views];
    NSArray *widthConstraint_5=[NSLayoutConstraint constraintsWithVisualFormat:@"H:[july(==august)]" options:0 metrics:nil views:views];
    NSArray *widthConstraint_6=[NSLayoutConstraint constraintsWithVisualFormat:@"H:[august(==september)]" options:0 metrics:nil views:views];
    NSArray *widthConstraint_7=[NSLayoutConstraint constraintsWithVisualFormat:@"H:[october(==november)]" options:0 metrics:nil views:views];
    NSArray *widthConstraint_8=[NSLayoutConstraint constraintsWithVisualFormat:@"H:[november(==december)]" options:0 metrics:nil views:views];
    
    NSArray *verticalConstraint_1 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-60-[january]-0-[april]-0-[july]-0-[october]-0-|" options:0 metrics:nil views:views];
    NSArray *verticalConstraint_2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-60-[february]-0-[may]-0-[august]-0-[november]-0-|" options:0 metrics:nil views:views];
    NSArray *verticalConstraint_3 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-60-[march]-0-[june]-0-[september]-0-[december]-0-|" options:0 metrics:nil views:views];
    
    NSArray *heightConstraint_1=[NSLayoutConstraint constraintsWithVisualFormat:@"V:[january(==april)]" options:0 metrics:nil views:views];
    NSArray *heightConstraint_2=[NSLayoutConstraint constraintsWithVisualFormat:@"V:[april(==july)]" options:0 metrics:nil views:views];
    NSArray *heightConstraint_3=[NSLayoutConstraint constraintsWithVisualFormat:@"V:[july(==october)]" options:0 metrics:nil views:views];
    NSArray *heightConstraint_4=[NSLayoutConstraint constraintsWithVisualFormat:@"V:[february(==may)]" options:0 metrics:nil views:views];
    NSArray *heightConstraint_5=[NSLayoutConstraint constraintsWithVisualFormat:@"V:[may(==august)]" options:0 metrics:nil views:views];
    NSArray *heightConstraint_6=[NSLayoutConstraint constraintsWithVisualFormat:@"V:[august(==november)]" options:0 metrics:nil views:views];
    NSArray *heightConstraint_7=[NSLayoutConstraint constraintsWithVisualFormat:@"V:[march(==june)]" options:0 metrics:nil views:views];
    NSArray *heightConstraint_8=[NSLayoutConstraint constraintsWithVisualFormat:@"V:[june(==september)]" options:0 metrics:nil views:views];
    NSArray *heightConstraint_9=[NSLayoutConstraint constraintsWithVisualFormat:@"V:[september(==december)]" options:0 metrics:nil views:views];
    
    [cell.yearContentView addConstraints:horizontalConstraint_1];
    [cell.yearContentView addConstraints:horizontalConstraint_2];
    [cell.yearContentView addConstraints:horizontalConstraint_3];
    [cell.yearContentView addConstraints:horizontalConstraint_4];
    [cell.yearContentView addConstraints:verticalConstraint_1];
    [cell.yearContentView addConstraints:verticalConstraint_2];
    [cell.yearContentView addConstraints:verticalConstraint_3];
    [cell.yearContentView addConstraints:widthConstraint_1];
    [cell.yearContentView addConstraints:widthConstraint_2];
    [cell.yearContentView addConstraints:widthConstraint_3];
    [cell.yearContentView addConstraints:widthConstraint_4];
    [cell.yearContentView addConstraints:widthConstraint_5];
    [cell.yearContentView addConstraints:widthConstraint_6];
    [cell.yearContentView addConstraints:widthConstraint_7];
    [cell.yearContentView addConstraints:widthConstraint_8];
    [cell.yearContentView addConstraints:heightConstraint_1];
    [cell.yearContentView addConstraints:heightConstraint_2];
    [cell.yearContentView addConstraints:heightConstraint_3];
    [cell.yearContentView addConstraints:heightConstraint_4];
    [cell.yearContentView addConstraints:heightConstraint_5];
    [cell.yearContentView addConstraints:heightConstraint_6];
    [cell.yearContentView addConstraints:heightConstraint_7];
    [cell.yearContentView addConstraints:heightConstraint_8];
    [cell.yearContentView addConstraints:heightConstraint_9];
    
//    UILabel *lbJan=[[UILabel alloc] init];
//    UILabel *lbFeb=[[UILabel alloc] init];
//    UILabel *lbMar=[[UILabel alloc] init];
//    UILabel *lbApr=[[UILabel alloc] init];
//    UILabel *lbMay=[[UILabel alloc] init];
//    UILabel *lbJun=[[UILabel alloc] init];
//    UILabel *lbJul=[[UILabel alloc] init];
//    UILabel *lbAug=[[UILabel alloc] init];
//    UILabel *lbSep=[[UILabel alloc] init];
//    UILabel *lbOct=[[UILabel alloc] init];
//    UILabel *lbNov=[[UILabel alloc] init];
//    UILabel *lbDec=[[UILabel alloc] init];
//
//    [lbJan setTranslatesAutoresizingMaskIntoConstraints:NO];
//    [lbFeb setTranslatesAutoresizingMaskIntoConstraints:NO];
//    [lbMar setTranslatesAutoresizingMaskIntoConstraints:NO];
//    [lbApr setTranslatesAutoresizingMaskIntoConstraints:NO];
//    [lbMay setTranslatesAutoresizingMaskIntoConstraints:NO];
//    [lbJun setTranslatesAutoresizingMaskIntoConstraints:NO];
//    [lbJul setTranslatesAutoresizingMaskIntoConstraints:NO];
//    [lbAug setTranslatesAutoresizingMaskIntoConstraints:NO];
//    [lbSep setTranslatesAutoresizingMaskIntoConstraints:NO];
//    [lbOct setTranslatesAutoresizingMaskIntoConstraints:NO];
//    [lbNov setTranslatesAutoresizingMaskIntoConstraints:NO];
//    [lbDec setTranslatesAutoresizingMaskIntoConstraints:NO];
//
//    [lbJan setText:@"Jan"];
//    [lbFeb setText:@"Feb"];
//    [lbMar setText:@"Mar"];
    for(int i=0;i<arrayMonth.count;i++){
        
        UILabel *lbMonth=[[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
        [lbMonth setTranslatesAutoresizingMaskIntoConstraints:NO];
        [lbMonth setText:arrayMonth[i]];
        lbMonth.font=[UIFont boldSystemFontOfSize:25.0f];

        if(i==0){
            [january addSubview:lbMonth];
            
            NSDictionary *views=NSDictionaryOfVariableBindings(lbMonth);
            NSArray *horizontalContraint=[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[lbMonth]-0-|" options:0 metrics:nil views:views];
            NSArray *verticalContraint=[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[lbMonth]-110-|" options:0 metrics:nil views:views];
            [january addConstraints:horizontalContraint];
            [january addConstraints:verticalContraint];
            
        }else if(i==1){
            [february addSubview:lbMonth];
            
            NSDictionary *views=NSDictionaryOfVariableBindings(lbMonth);
            NSArray *horizontalContraint=[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[lbMonth]-0-|" options:0 metrics:nil views:views];
            NSArray *verticalContraint=[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[lbMonth]-110-|" options:0 metrics:nil views:views];
            [february addConstraints:horizontalContraint];
            [february addConstraints:verticalContraint];
            
        }else if(i==2){
            [march addSubview:lbMonth];
            
            NSDictionary *views=NSDictionaryOfVariableBindings(lbMonth);
            NSArray *horizontalContraint=[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[lbMonth]-0-|" options:0 metrics:nil views:views];
            NSArray *verticalContraint=[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[lbMonth]-110-|" options:0 metrics:nil views:views];
            [march addConstraints:horizontalContraint];
            [march addConstraints:verticalContraint];
            
        }else if(i==3){
            [april addSubview:lbMonth];
            
            NSDictionary *views=NSDictionaryOfVariableBindings(lbMonth);
            NSArray *horizontalContraint=[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[lbMonth]-0-|" options:0 metrics:nil views:views];
            NSArray *verticalContraint=[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[lbMonth]-110-|" options:0 metrics:nil views:views];
            [april addConstraints:horizontalContraint];
            [april addConstraints:verticalContraint];
            
        }else if(i==4){
            [may addSubview:lbMonth];
            
            NSDictionary *views=NSDictionaryOfVariableBindings(lbMonth);
            NSArray *horizontalContraint=[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[lbMonth]-0-|" options:0 metrics:nil views:views];
            NSArray *verticalContraint=[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[lbMonth]-110-|" options:0 metrics:nil views:views];
            [may addConstraints:horizontalContraint];
            [may addConstraints:verticalContraint];
            
        }else if(i==5){
            [june addSubview:lbMonth];
            
            NSDictionary *views=NSDictionaryOfVariableBindings(lbMonth);
            NSArray *horizontalContraint=[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[lbMonth]-0-|" options:0 metrics:nil views:views];
            NSArray *verticalContraint=[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[lbMonth]-110-|" options:0 metrics:nil views:views];
            [june addConstraints:horizontalContraint];
            [june addConstraints:verticalContraint];
            
        }else if(i==6){
            [july addSubview:lbMonth];
            
            NSDictionary *views=NSDictionaryOfVariableBindings(lbMonth);
            NSArray *horizontalContraint=[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[lbMonth]-0-|" options:0 metrics:nil views:views];
            NSArray *verticalContraint=[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[lbMonth]-110-|" options:0 metrics:nil views:views];
            [july addConstraints:horizontalContraint];
            [july addConstraints:verticalContraint];
            
        }else if(i==7){
            [august addSubview:lbMonth];
            
            NSDictionary *views=NSDictionaryOfVariableBindings(lbMonth);
            NSArray *horizontalContraint=[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[lbMonth]-0-|" options:0 metrics:nil views:views];
            NSArray *verticalContraint=[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[lbMonth]-110-|" options:0 metrics:nil views:views];
            [august addConstraints:horizontalContraint];
            [august addConstraints:verticalContraint];
            
        }else if(i==8){
            [september addSubview:lbMonth];
            
            NSDictionary *views=NSDictionaryOfVariableBindings(lbMonth);
            NSArray *horizontalContraint=[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[lbMonth]-0-|" options:0 metrics:nil views:views];
            NSArray *verticalContraint=[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[lbMonth]-110-|" options:0 metrics:nil views:views];
            [september addConstraints:horizontalContraint];
            [september addConstraints:verticalContraint];
            
        }else if(i==9){
            [october addSubview:lbMonth];
            
            NSDictionary *views=NSDictionaryOfVariableBindings(lbMonth);
            NSArray *horizontalContraint=[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[lbMonth]-0-|" options:0 metrics:nil views:views];
            NSArray *verticalContraint=[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[lbMonth]-110-|" options:0 metrics:nil views:views];
            [october addConstraints:horizontalContraint];
            [october addConstraints:verticalContraint];
            
        }else if (i==10){
            [november addSubview:lbMonth];
            
            NSDictionary *views=NSDictionaryOfVariableBindings(lbMonth);
            NSArray *horizontalContraint=[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[lbMonth]-0-|" options:0 metrics:nil views:views];
            NSArray *verticalContraint=[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[lbMonth]-110-|" options:0 metrics:nil views:views];
            [november addConstraints:horizontalContraint];
            [november addConstraints:verticalContraint];
            
        }else if(i==11){
            [december addSubview:lbMonth];
            
            NSDictionary *views=NSDictionaryOfVariableBindings(lbMonth);
            NSArray *horizontalContraint=[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[lbMonth]-0-|" options:0 metrics:nil views:views];
            NSArray *verticalContraint=[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[lbMonth]-110-|" options:0 metrics:nil views:views];
            [december addConstraints:horizontalContraint];
            [december addConstraints:verticalContraint];
        }
    }

    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    ViewController *viewController = (ViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"monthViewController"];
//    [self.navigationController pushViewController:viewController animated:YES];
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

@end
