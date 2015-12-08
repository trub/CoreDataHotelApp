//
//  BookViewController.m
//  HotelManagerApp
//
//  Created by Matthew Weintrub on 12/8/15.
//  Copyright © 2015 matthew weintrub. All rights reserved.
//

#import "BookViewController.h"
#import "Hotel.h"


@interface BookViewController ()

@end

@implementation BookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@", self.room.hotel.name);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
