//
//  yearCollectionViewCell.h
//  MyCalender
//
//  Created by LAI KIN WA on 30/8/2018.
//  Copyright © 2018年 LAI KIN WA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "monthCollectionView.h"
#import "monthObject.h"
#import "SSMonthNode.h"
#import "SSDayNode.h"
#import "SSConstants.h"
@interface yearCollectionViewCell : UICollectionViewCell

@property SSMonthNode *thisMonth;
@property BOOL isCurrentMonth;
//- (void)setCollectionViewDataSourceDelegate:(id<UICollectionViewDataSource, UICollectionViewDelegate>)dataSourceDelegate indexPath:(NSIndexPath *)indexPath;

@end
