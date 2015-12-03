//
//  DateViewController.m
//  HotelManagerApp
//
//  Created by Matthew Weintrub on 12/3/15.
//  Copyright © 2015 matthew weintrub. All rights reserved.
//

#import "DateViewController.h"

@interface DateViewController ()

@property (strong, nonatomic) UIDatePicker *picksEndDate;

@end

@implementation DateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavBar];
    [self setDatePicker];
    
    [self.view setBackgroundColor:[UIColor colorWithRed:0.40 green:0.25 blue:0.40 alpha:1.0]];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)setNavBar{
    [self setTitle: @"Select an End Date"];
}



- (void)setDatePicker{
    self.picksEndDate = [[UIDatePicker alloc]init];
    self.picksEndDate.datePickerMode = UIDatePickerModeDate;
    self.picksEndDate.frame = CGRectMake(0, 64.0, CGRectGetWidth(self.view.frame), 200.0);
    self.picksEndDate.tintColor = [UIColor redColor];
    [self.picksEndDate setValue:[UIColor whiteColor] forKey:@"textColor"];
    
    [self.view addSubview:self.picksEndDate];
}


@end
