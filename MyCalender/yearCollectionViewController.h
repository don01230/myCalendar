//
//  yearCollectionViewController.h
//  MyCalender
//
//  Created by LAI KIN WA on 30/8/2018.
//  Copyright © 2018年 LAI KIN WA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "yearCollectionViewCell.h"
#import "dayCollectionViewCell.h"
#import "yearHeaderCollectionReusableView.h"
#import "SSYearNode.h"

@interface yearCollectionViewController : UICollectionViewController

@property NSMutableArray *mutableYear;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *btnToday;

@end
