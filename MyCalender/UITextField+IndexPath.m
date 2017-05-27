//
//  UITextField+IndexPath.m
//  MyCalender
//
//  Created by LAI KIN WA on 27/5/2017.
//  Copyright © 2017年 LAI KIN WA. All rights reserved.
//

#import "UITextField+IndexPath.h"
#import <objc/runtime.h>

@implementation UITextField (IndexPath)
static char indexPathKey;

-(NSIndexPath *)indexPath{
    return objc_getAssociatedObject(self, &indexPathKey);
}

-(void)setIndexPath:(NSIndexPath *)indexPath{
    objc_setAssociatedObject(self, &indexPathKey, indexPath, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
