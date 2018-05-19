//
//  myTableViewCell.m
//  MyCalender
//
//  Created by LAI KIN WA on 15/5/2017.
//  Copyright © 2017年 LAI KIN WA. All rights reserved.
//

#import "myTableViewCell.h"
#import "UITextField+IndexPath.h"

@interface myTableViewCell ()

@property (strong, nonatomic) UITextField *textField;

@end

@implementation myTableViewCell



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubview:self.textField];
        
        NSDictionary *views=NSDictionaryOfVariableBindings(_textField);
        
        NSArray *horizontalConstraints1 =[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[_textField]-0-|" options:0 metrics:nil views:views];
        [self addConstraints:horizontalConstraints1];
        
        NSArray *heightConstraints1 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-5-[_textField]-5-|" options:0 metrics:nil views:views];
        [self addConstraints:heightConstraints1];
        
        self.textField.adjustsFontSizeToFitWidth=YES;
        self.textField.textColor=[UIColor blackColor];
        self.textField.backgroundColor=[UIColor clearColor];
        
        //[self addSubview:self.textField];
    }
    return self;
}

- (void)setDataString:(NSString *)dataString andIndexPath:(NSIndexPath *)indexPath{

    self.textField.indexPath = indexPath;
    self.textField.text = dataString;
    
    if([_textField.indexPath section]==0){
        if([_textField.indexPath row]==0){
            _textField.placeholder=@"Title";
        }else{
            _textField.placeholder=@"Location";
        }
    }else if([_textField.indexPath section]==1){
        if ([_textField.indexPath row]==0) {
            _textField.placeholder=@"All-day";
        }else if([_textField.indexPath row]==1){
            _textField.placeholder=@"Starts";
        }else if([_textField.indexPath row]==2){
            _textField.placeholder=@"Ends";
        }else if([_textField.indexPath row]==3){
            _textField.placeholder=@"Repeat";
        }else if([_textField.indexPath row]==4){
            _textField.placeholder=@"Travel Time";
        }
    }else if([_textField.indexPath section]==2){
        if ([_textField.indexPath row]==0) {
            _textField.placeholder=@"Calendar";
        }else if([_textField.indexPath row]==1){
            _textField.placeholder=@"Invitees";
        }
    }else if([_textField.indexPath section]==3){
        if ([_textField.indexPath row]==0) {
            _textField.placeholder=@"Alert";
        }else if([_textField.indexPath row]==1){
            _textField.placeholder=@"Show As";
        }
    }else if([_textField.indexPath section]==4){
        if([_textField.indexPath row]==0){
            _textField.placeholder=@"URL";
        }else{
            _textField.placeholder=@"Notes";
        }
    }
    
    
}

- (UITextField *)textField{
    if (!_textField) {
        _textField = [[UITextField alloc] init];
        [_textField setTranslatesAutoresizingMaskIntoConstraints:NO];
    }
    return _textField;
}

@end
