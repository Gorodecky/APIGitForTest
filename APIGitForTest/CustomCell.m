//
//  CustomCell.m
//  APIGitForTest
//
//  Created by Serg on 01.07.16.
//  Copyright (c) 2016 Vitaliy Horodecky. All rights reserved.
//

#import "CustomCell.h"
#import "APIObject.h"
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

- (void) submitObject:(APIObject*) objects {
    
    
    
   redirectUrl = [NSURL URLWithString:objects.objectURL];
    
    NSURL* url = [NSURL URLWithString:objects.objectPhotoURL];
    
    NSURLRequest* requect = [NSURLRequest requestWithURL:url];
    
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_LOW, 0), ^(void){
        
        [self.objectImage setImageWithURLRequest: requect
                                    placeholderImage:nil
                                             success:^(NSURLRequest* request,
                                                       NSHTTPURLResponse* response,
                                                       UIImage*theImage) {
                                                 
                                                 dispatch_async(dispatch_get_main_queue(), ^(void) {
                                                     
                                                     self.objectImage.image = theImage;
                                                     self.activityIndicator.hidden = YES;
                                                     [self.activityIndicator stopAnimating];

                                                 });
                                                 
                                             } failure:^(NSURLRequest* request,
                                                         NSHTTPURLResponse* response,
                                                         NSError * error) {
                                                 
                                                 dispatch_async(dispatch_get_main_queue(), ^(void) {
                                                     
                                                     [self.activityIndicator startAnimating];
                                                     
                                                     //NSLog(@"Error photo upload");
                                                 });
                                             }];
    });
    
    [self updateConstraints];
    
    self.nameObjectLable.text = objects.objectName;
    
    self.typeObjectLable.text = objects.objectType;
    
    self.dateAtObjectLable.text = objects.createdDate;
    
    self.loginObjectLable.text = objects.objectLogin;
    
}

@end
