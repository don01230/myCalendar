//
//  monthHeaderView.m
//  MyCalender
//
//  Created by LAI KIN WA on 15/9/2018.
//  Copyright © 2018年 LAI KIN WA. All rights reserved.
//

#import "monthHeaderView.h"

@implementation monthHeaderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)init
{
    self = [super init];
    if (self) {
        _contentView=[self loadViewFromNib];
        [self addSubview:_contentView];
        [self addConstraints];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _contentView=[self loadViewFromNib];
        [self addSubview:_contentView];
        [self addConstraints];
    }
    return self;
}

-(UIView *)loadViewFromNib{
    Class className= [self class];
    NSBundle *bundle=[NSBundle bundleForClass:className];
    NSString *name=[NSStringFromClass(className) componentsSeparatedByString:@"."].lastObject;
    UINib *nib=[UINib nibWithNibName:name bundle:bundle];
    UIView *view=[nib instantiateWithOwner:self options:nil].firstObject;
    return view;
}

-(void)addConstraints{
    _contentView.translatesAutoresizingMaskIntoConstraints=NO;
    NSLayoutConstraint *constraint=[NSLayoutConstraint constraintWithItem:_contentView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeading multiplier:1 constant:0];
    [self addConstraint:constraint];
    constraint=[NSLayoutConstraint constraintWithItem:_contentView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTrailing multiplier:1 constant:0];
    [self addConstraint:constraint];
    constraint=[NSLayoutConstraint constraintWithItem:_contentView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:0];
    [self addConstraint:constraint];
    constraint=[NSLayoutConstraint constraintWithItem:_contentView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
    [self addConstraint:constraint];
}

@end
