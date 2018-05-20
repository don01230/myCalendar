//
//  monthViewController.h
//  MyCalender
//
//  Created by LAI KIN WA on 27/12/2016.
//  Copyright © 2016年 LAI KIN WA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface monthViewController : UIViewController{

    __weak IBOutlet UIView *subView;
    __weak IBOutlet NSLayoutConstraint *heightConstraint;
    __weak IBOutlet UINavigationItem *navigationItem;
}


@end

