//
//  CustomCell.h
//  APIGitForTest
//
//  Created by Serg on 01.07.16.
//  Copyright (c) 2016 Vitaliy Horodecky. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Objects;

@interface CustomCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *objectImage;
@property (weak, nonatomic) IBOutlet UILabel *loginObjectLable;
@property (weak, nonatomic) IBOutlet UILabel *nameObjectLable;
@property (weak, nonatomic) IBOutlet UILabel *typeObjectLable;
@property (weak, nonatomic) IBOutlet UILabel *dateAtObjectLable;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

- (void) submitObject:(Objects*) objects;

@end

static NSString* customCellIdentifier = @"customCellIdetifier";