//
//  yearTableViewController.h
//  MyCalender
//
//  Created by LAI KIN WA on 16/5/2018.
//  Copyright © 2018年 LAI KIN WA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "yearTableViewCell.h"
#import "monthViewController.h"
@interface yearTableViewController : UITableViewController <UICollectionViewDataSource, UICollectionViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *yearTableView;

@end
