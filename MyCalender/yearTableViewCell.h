//
//  yearTableViewCell.h
//  MyCalender
//
//  Created by LAI KIN WA on 16/5/2018.
//  Copyright © 2018年 LAI KIN WA. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface yearCollectionView : UICollectionView

@property (nonatomic, strong) NSIndexPath *indexPath;

@end

static NSString *CollectionViewCellIdentifier=@"CollectionViewCellIdentifier";

@interface yearTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *yearTableViewCellContentView;
@property (weak, nonatomic) IBOutlet UILabel *lbYear;
@property (weak, nonatomic) IBOutlet UIView *viewJan;
@property (weak, nonatomic) IBOutlet UIView *viewFeb;
@property (weak, nonatomic) IBOutlet UIView *viewMar;
@property (weak, nonatomic) IBOutlet UIView *viewApr;
@property (weak, nonatomic) IBOutlet UIView *viewMay;
@property (weak, nonatomic) IBOutlet UIView *viewJun;
@property (weak, nonatomic) IBOutlet UIView *viewJul;
@property (weak, nonatomic) IBOutlet UIView *viewAug;
@property (weak, nonatomic) IBOutlet UIView *viewSep;
@property (weak, nonatomic) IBOutlet UIView *viewOct;
@property (weak, nonatomic) IBOutlet UIView *viewNov;
@property (weak, nonatomic) IBOutlet UIView *viewDec;

@property (weak, nonatomic) IBOutlet UILabel *lbJan;
@property (weak, nonatomic) IBOutlet UILabel *lbFeb;
@property (weak, nonatomic) IBOutlet UILabel *lbMar;
@property (weak, nonatomic) IBOutlet UILabel *lbApr;
@property (weak, nonatomic) IBOutlet UILabel *lbMay;
@property (weak, nonatomic) IBOutlet UILabel *lbJun;
@property (weak, nonatomic) IBOutlet UILabel *lbJul;
@property (weak, nonatomic) IBOutlet UILabel *lbAug;
@property (weak, nonatomic) IBOutlet UILabel *lbSep;
@property (weak, nonatomic) IBOutlet UILabel *lbOct;
@property (weak, nonatomic) IBOutlet UILabel *lbNov;
@property (weak, nonatomic) IBOutlet UILabel *lbDec;

@property int setYear;

@property (nonatomic, strong) yearCollectionView *collectionView;

- (void)setCollectionViewDataSourceDelegate:(id<UICollectionViewDataSource, UICollectionViewDelegate>)dataSourceDelegate indexPath:(NSIndexPath *)indexPath;

@end


































