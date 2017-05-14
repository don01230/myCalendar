//
//  addEventViewController.m
//  MyCalender
//
//  Created by LAI KIN WA on 11/5/2017.
//  Copyright © 2017年 LAI KIN WA. All rights reserved.
//

#import "addEventViewController.h"
#import "topView.h"
//#import "topView.m"
@interface addEventViewController ()<UITableViewDataSource, UITableViewDelegate>{
    NSArray *array1,*array2,*array3,*array4,*array5;
    NSMutableArray *mutableArray;
}

@end

@implementation addEventViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _btnCancel.action=@selector(closeView);
    [self arraySetUp];

}

-(void)arraySetUp{
    array1=[NSArray arrayWithObjects: @"",@"Location",nil];
    array2=[NSArray arrayWithObjects: @"All-day",@"Starts",@"Ends",@"Repeat",@"Travel Time",nil];
    array3=[NSArray arrayWithObjects: @"Calendar",@"Invitees",nil];
    array4=[NSArray arrayWithObjects: @"Alert",@"Show As",nil];
    array5=[NSArray arrayWithObjects: @"URL",@"Notes",nil];
    mutableArray=[[NSMutableArray alloc]initWithObjects:array1,array2,array3,array4,array5, nil];
}

#pragma mark - UITableView DataSource Methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [mutableArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[mutableArray objectAtIndex:section] count];
}
- (void) initializeMyCells {
    self.cellArray = [NSMutableArray arrayWithCapacity:5];
    for ( int i = 0; i < 5; ++i ) {
        MyCellType *cell = [[MyCellType alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier:nil]];
        [self.cellArray addObject:cell];
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellId=@"cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    //cell.textLabel.text=[[mutableArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];

    UITextField *textField=[[UITextField alloc] init];
    [textField setTranslatesAutoresizingMaskIntoConstraints:NO];
    [cell addSubview:textField];
    
    NSDictionary *views=NSDictionaryOfVariableBindings(textField);
    
    NSArray *horizontalConstraints1 =[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[textField]-0-|" options:0 metrics:nil views:views];
    [cell addConstraints:horizontalConstraints1];
    
    NSArray *heightConstraints1 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-5-[textField]-5-|" options:0 metrics:nil views:views];
    [cell addConstraints:heightConstraints1];
    
    textField.adjustsFontSizeToFitWidth=YES;
    textField.textColor=[UIColor blackColor];
    textField.backgroundColor=[UIColor whiteColor];
    if([indexPath section]==0){
        if([indexPath row]==0){
            textField.placeholder=@"Title";
        }else{
            textField.placeholder=@"Location";
        }
    }else if([indexPath section]==4){
        if([indexPath row]==0){
            textField.placeholder=@"URL";
        }else{
            textField.placeholder=@"Notes";
        }
    }
    [cell addSubview:textField];
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return @" ";
            break;
            
        case 1:
            return @" ";
            break;
            
        default:
            return @" ";
            break;
    }
}

- (void)closeView{
    [[self presentingViewController] dismissViewControllerAnimated:NO completion:nil];
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
