//
//  LookupViewController.m
//  HotelManagerApp
//
//  Created by Matthew Weintrub on 12/8/15.
//  Copyright © 2015 matthew weintrub. All rights reserved.
//

#import "LookupViewController.h"

@interface LookupViewController ()

@property (strong, nonatomic)UISearchBar *searchBar;

@end

@implementation LookupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNavBar];
    [self setupSearchBar];
    
    [self.view setBackgroundColor:[UIColor colorWithRed:0.28 green:0.10 blue:0.28 alpha:1.0]];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)setNavBar{
    [self setTitle: @"Search"];
}



- (void)setupSearchBar{
    self.searchBar = [[UISearchBar alloc]init];
    
    self.searchBar.searchBarStyle = [UIColor clearColor];
    
    [self.view addSubview:self.searchBar];
}



@end
