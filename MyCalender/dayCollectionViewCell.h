//
//  dayCollectionViewCell.h
//  MyCalender
//
//  Created by LAI KIN WA on 5/9/2018.
//  Copyright © 2018年 LAI KIN WA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface dayCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *lbDay;
@property BOOL notThisMonth;

@end
