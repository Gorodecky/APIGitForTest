//
//  CustomCell.m
//  APIGitForTest
//
//  Created by Serg on 01.07.16.
//  Copyright (c) 2016 Vitaliy Horodecky. All rights reserved.
//

#import "CustomCell.h"
#import "Objects.h"
#import "UIImageView+AFNetworking.h"

@implementation CustomCell

{
    NSURL* redirectUrl;
}

- (void)awakeFromNib {
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

- (void) submitObject:(Objects*) objects {
    
    [self.activityIndicator startAnimating];
    
   redirectUrl = [NSURL URLWithString:objects.objectURL];
    
    [self.imageView setImageWithURL:[NSURL URLWithString:objects.objectPhotoURL]
                   placeholderImage:nil];
    
    [self updateConstraints];
    
    [self.activityIndicator stopAnimating];

    self.nameObjectLable.text = objects.objectName;
    
    self.typeObjectLable.text = objects.objectType;
    
    self.dateAtObjectLable.text = objects.createdDate;
    
    self.loginObjectLable.text = objects.objectLogin;
    
}

@end
