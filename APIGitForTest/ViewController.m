//
//  ViewController.m
//  APIGitForTest
//
//  Created by Serg on 30.06.16.
//  Copyright (c) 2016 Vitaliy Horodecky. All rights reserved.
//

#import "ViewController.h"
#import "ServerManager.h"
#import "APIObject.h"
#import "CustomCell.h"
#import "WebViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

{
    APIObject* object;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINib * nibImageCardCell = [UINib
                                nibWithNibName:@"CustomCell"
                                bundle:nil];
    
    [[self tableView] registerNib:nibImageCardCell
           forCellReuseIdentifier:customCellIdentifier];
    
    [[ServerManager sharedManager] getObject:^(NSArray *rezultValue) {
        
        if (rezultValue == nil) {
            
            UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Alert!"
                                                            message:@"Server not found!"
                                                           delegate:self
                                                  cancelButtonTitle:@"Ok"
                                                  otherButtonTitles:nil, nil];
            [alert show];
            
            //NSLog(@"Alert!!!");
            
        } else {
            
            object = [[APIObject alloc]init];
            
            [object objectParse:rezultValue];
            
            [self.tableView reloadData];
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return object.arrayListObjects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CustomCell* cell = (CustomCell*) [tableView dequeueReusableCellWithIdentifier:customCellIdentifier];
    
    if (!cell) {
        
        NSArray*nib = [[NSBundle mainBundle] loadNibNamed:@"CustomCell"
                                                    owner:self
                                                  options:nil];
        
        cell = [nib objectAtIndex:0];
        
    }
    
    APIObject* obj = object.arrayListObjects[indexPath.row];
    
    [cell submitObject:obj];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    WebViewController *vc = [sb instantiateViewControllerWithIdentifier:@"WebViewController"];
    
    APIObject* obj = object.arrayListObjects[indexPath.row];
    
    NSString* string = obj.objectURL;
    
    vc.urlString = string;
    
    [self.navigationController showViewController:vc sender:nil];
    
}

@end
