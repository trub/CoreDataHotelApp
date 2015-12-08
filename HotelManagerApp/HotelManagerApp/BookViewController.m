//
//  BookViewController.m
//  HotelManagerApp
//
//  Created by Matthew Weintrub on 12/8/15.
//  Copyright © 2015 matthew weintrub. All rights reserved.
//

#import "BookViewController.h"
#import "AvailabilityViewController.h"
#import "Hotel.h"


@interface BookViewController ()


@end

@implementation BookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@", self.room.hotel.name);
    
    [self setupLabel];
    
}

-(void)loadView {
    [super loadView];
    
    self.view.backgroundColor = [UIColor redColor];
}

-(void)setupLabel{
    
    UILabel *statusLabel = [[UILabel alloc]init];
    statusLabel.numberOfLines = 0;
    statusLabel.text = [NSString stringWithFormat:@"Reservation at %@, Room: %@\n%@-%@", self.room.hotel.name, self.room.number, [NSDateFormatter localizedStringFromDate:self.startDate dateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterNoStyle], [NSDateFormatter localizedStringFromDate:self.endDate dateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterNoStyle]];
    statusLabel.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:statusLabel];
    
    statusLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    // set constraints.
    NSLayoutConstraint *imageViewLeading = [NSLayoutConstraint constraintWithItem:statusLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0.0];
    NSLayoutConstraint *imageViewTop = [NSLayoutConstraint constraintWithItem:statusLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:200.0];
    NSLayoutConstraint *imageViewTrailing = [NSLayoutConstraint constraintWithItem:statusLabel attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0.0];

    // Activate constraints.
    imageViewLeading.active = YES;
    imageViewTop.active = YES;
    imageViewTrailing.active = YES;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
