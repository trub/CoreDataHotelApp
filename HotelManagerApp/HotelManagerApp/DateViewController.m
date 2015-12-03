//
//  DateViewController.m
//  HotelManagerApp
//
//  Created by Matthew Weintrub on 12/3/15.
//  Copyright © 2015 matthew weintrub. All rights reserved.
//

#import "DateViewController.h"
#import "AvailabilityViewController.h"

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
    
    [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(dateSelectedButtonPressed:)]];

}



- (void)setDatePicker{
    self.picksEndDate = [[UIDatePicker alloc]init];
    self.picksEndDate.datePickerMode = UIDatePickerModeDate;
    self.picksEndDate.frame = CGRectMake(0, 64.0, CGRectGetWidth(self.view.frame), 200.0);
    [self.picksEndDate setValue:[UIColor whiteColor] forKey:@"textColor"];
    
    [self.view addSubview:self.picksEndDate];
}

- (void)dateSelectedButtonPressed:(UIBarButtonItem *)sender {
    
    NSDate *endDate = [self.picksEndDate date];
    
    if ([[NSDate date]timeIntervalSinceReferenceDate]>[endDate timeIntervalSinceReferenceDate]) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"nooooooooo" message:@"you needed a date from the future" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"FINE" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            self.picksEndDate.date = [NSDate date];
        }];
        
        [alertController addAction:okAction];
        [self presentViewController:alertController animated:YES completion:nil];
        
        return;
    }

    AvailabilityViewController *availabilityController = [[AvailabilityViewController alloc]init];
    [self.navigationController pushViewController:availabilityController animated:YES];
    
}




@end
