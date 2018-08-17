//
//  navigationController.m
//  MyCalender
//
//  Created by LAI KIN WA on 9/8/2018.
//  Copyright © 2018年 LAI KIN WA. All rights reserved.
//

#import "navigationController.h"

@interface navigationController ()<UINavigationControllerDelegate>

@end

@implementation navigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.delegate=self;
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
