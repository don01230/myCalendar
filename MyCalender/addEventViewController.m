//
//  addEventViewController.m
//  MyCalender
//
//  Created by LAI KIN WA on 11/5/2017.
//  Copyright © 2017年 LAI KIN WA. All rights reserved.
//

#import "addEventViewController.h"
#import "topView.h"
#import "myTableViewCell.h"
#import "UITextField+IndexPath.h"

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

@interface addEventViewController ()<UITableViewDataSource, UITableViewDelegate>{
    NSMutableArray *array1,*array2,*array3,*array4,*array5;
    NSMutableArray *mutableArray;
    
}
@property (nonatomic , strong)NSArray *titleArray;
@property (nonatomic , strong)NSMutableArray *arrayDataSouce;

@end

@implementation addEventViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _btnCancel.action=@selector(closeView);
    [self arraySetUp];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textFieldDidChanged:) name:UITextFieldTextDidChangeNotification object:nil];
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)textFieldDidChanged:(NSNotification *)noti{

    UITextField *textField=noti.object;
    NSIndexPath *indexPath = textField.indexPath;
    NSLog(@"NSLog:%ld",(long)indexPath.section);
    NSLog(@"NSLog:%@",textField.text);
    [[mutableArray objectAtIndex:indexPath.section] replaceObjectAtIndex:indexPath.row withObject:textField.text];
}

-(void)arraySetUp{
    //array1=[[NSMutableArray alloc] initWithObjects: @"Title",@"Location",nil];
    array1=[[NSMutableArray alloc] initWithObjects: @"",@"",nil];
    //array2=[[NSMutableArray alloc] initWithObjects: @"All-day",@"Starts",@"Ends",@"Repeat",@"Travel Time",nil];
    array2=[[NSMutableArray alloc] initWithObjects: @"",@"",@"",@"",@"",nil];
    //array3=[[NSMutableArray alloc] initWithObjects: @"Calendar",@"Invitees",nil];
    array3=[[NSMutableArray alloc] initWithObjects: @"",@"",nil];
    //array4=[[NSMutableArray alloc] initWithObjects: @"Alert",@"Show As",nil];
    array4=[[NSMutableArray alloc] initWithObjects: @"",@"",nil];
    //array5=[[NSMutableArray alloc] initWithObjects: @"URL",@"Notes",nil];
    array5=[[NSMutableArray alloc] initWithObjects: @"",@"",nil];
    mutableArray=[[NSMutableArray alloc]initWithObjects:array1,array2,array3,array4,array5, nil];
    //mutableArray=[[NSMutableArray alloc]initWithObjects:@"array1",@"array2",@"array3",@"array4",@"array5", nil];
}

#pragma mark - UITableView DataSource Methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [mutableArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[mutableArray objectAtIndex:section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *Id = @"myTableViewCell";
    myTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Id];
    if (!cell) {
        cell = [[myTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Id];
    }

    [cell setDataString:[mutableArray objectAtIndex:indexPath.section][indexPath.row] andIndexPath:indexPath];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
