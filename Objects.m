//
//  Objects.m
//  APIGitForTest
//
//  Created by Serg on 30.06.16.
//  Copyright (c) 2016 Vitaliy Horodecky. All rights reserved.
//

#import "Objects.h"

@implementation Objects

{
    NSDictionary* actor;
    NSDictionary* repo;
}

- (id)initWithServerResponse:(NSDictionary*) responseObject {
    
    self = [super init];
    
    if (self) {
        
        self.objectID   = responseObject[@"id"];
        
        self.objectType = responseObject[@"type"];
        
        self.createdDate = responseObject[@"created_at"];
        
        actor = responseObject[@"actor"];
        
        self.objectLogin = [actor valueForKey:@"login"];
        
        self.objectPhotoURL = [actor valueForKey:@"avatar_url"];
        
        // NSLog(@"ACTOR: %@", actor);
        
        repo = responseObject[@"repo"];
        
        self.objectName = [repo valueForKey:@"name"];
        
        //NSLog(@"REPO: %@", repo);
        
        NSString* stringGit = @"https://github.com/";
        
        self.objectURL = [stringGit stringByAppendingString:self.objectLogin];
        
    }
    
    //NSLog(@"objectName - %@", self.objectName);
    //NSLog(@"ObjectID %@", self.objectID);
    //NSLog(@"Name %@", self.objectLogin);
    //NSLog(@"type %@", self.objectType);
    //NSLog(@"CreatedDate %@", self.createdDate);
    //NSLog(@"PhotoURL %@", self.objectPhotoURL);
    //NSLog(@"ObjectURL %@", self.objectURL);
    
    return self;
}

- (void) objectParse:(NSArray*) arrayObject {
    
    NSMutableArray* array = [NSMutableArray array];
    int i = 0;
    
    for (NSDictionary* dictionary in arrayObject) {
        
        i++;
        
        Objects* objects = [[Objects alloc] initWithServerResponse:dictionary];
        
        [array addObject:objects];
        
        //NSLog(@"object = %@", objects);
    }
    
    self.arrayListObjects = array;
    
}

@end
