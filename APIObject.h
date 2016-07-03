//
//  Objects.h
//  APIGitForTest
//
//  Created by Serg on 30.06.16.
//  Copyright (c) 2016 Vitaliy Horodecky. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APIObject : NSObject

@property (strong, nonatomic) NSString* objectID;
@property (strong, nonatomic) NSString* objectLogin;
@property (strong, nonatomic) NSString* objectType;
@property (strong, nonatomic) NSString* createdDate;
@property (strong, nonatomic) NSString* objectPhotoURL;
@property (strong, nonatomic) NSString* objectURL;
@property (strong, nonatomic) NSString* objectName;

@property(strong, nonatomic) NSArray* arrayListObjects;

- (id)initWithServerResponse:(NSDictionary*) responseObject;

- (void) objectParse:(NSArray*) arrayObject;

@end
