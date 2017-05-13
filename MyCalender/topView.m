//
//  topView.m
//  MyCalender
//
//  Created by LAI KIN WA on 11/5/2017.
//  Copyright © 2017年 LAI KIN WA. All rights reserved.
//

#import "topView.h"

@implementation topView

-(id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if(self){
        //initialization code
        
        //1. Load .xib
        [[NSBundle mainBundle] loadNibNamed:@"topView" owner:self options:nil];
        
        //2. Adjust bounds
        
        
        //3. add as a subview
        [self addSubview:self.weekRow];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    self=[super initWithCoder:aDecoder];  
    if(self){
        [[NSBundle mainBundle] loadNibNamed:@"topView" owner:self options:nil];
        [self addSubview:self.weekRow];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
