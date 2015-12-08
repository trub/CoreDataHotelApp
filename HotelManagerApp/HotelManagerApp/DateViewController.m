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

@property (strong, nonatomic) UIDatePicker *startDate;
@property (strong, nonatomic) UIDatePicker *endDate;

@end

@implementation DateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavBar];
    [self setDatePicker];
    
    [self.view setBackgroundColor:[UIColor colorWithRed:0.34 green:0.20 blue:0.34 alpha:1.0]];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)setNavBar{
    [self setTitle: @"Select an End Date"];
    
    [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(dateSelectedButtonPressed:)]];

}



- (void)setDatePicker{
    self.startDate = [[UIDatePicker alloc]init];
    self.endDate = [[UIDatePicker alloc]init];
    
    self.startDate.datePickerMode = UIDatePickerModeDate;
    self.endDate.datePickerMode = UIDatePickerModeDate;
    
    self.startDate.frame = CGRectMake(0, 64.0, CGRectGetWidth(self.view.frame), 200.0);
    self.endDate.frame = CGRectMake(0, 264.0, CGRectGetWidth(self.view.frame), 200.0);

    [self.startDate setValue:[UIColor whiteColor] forKey:@"textColor"];
    [self.endDate setValue:[UIColor whiteColor] forKey:@"textColor"];
    
    [self.view addSubview:self.startDate];
    [self.view addSubview:self.endDate];
}

- (void)dateSelectedButtonPressed:(UIBarButtonItem *)sender {
    
    NSDate *endDate = [self.endDate date];
    
    if ([[NSDate date]timeIntervalSinceReferenceDate]>[endDate timeIntervalSinceReferenceDate]) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"nooooooooo" message:@"you needed a date from the future" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"FINE" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            self.endDate.date = [NSDate date];
        }];
        
        [alertController addAction:okAction];
        [self presentViewController:alertController animated:YES completion:nil];
        
        return;
    }
    
    AvailabilityViewController *availabilityController = [[AvailabilityViewController alloc]init];
    availabilityController.startDate = self.startDate.date;
    availabilityController.endDate = self.endDate.date;
    [self.navigationController pushViewController:availabilityController animated:YES];
    
}




@end
