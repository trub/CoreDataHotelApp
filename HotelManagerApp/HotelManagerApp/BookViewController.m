//
//  BookViewController.m
//  HotelManagerApp
//
//  Created by Matthew Weintrub on 12/8/15.
//  Copyright © 2015 matthew weintrub. All rights reserved.
//

#import "BookViewController.h"
#import "AvailabilityViewController.h"
#import "AppDelegate.h"
#import "Reservation.h"
#import "Hotel.h"
#import "Guest.h"


@interface BookViewController ()

@property (strong, nonatomic) UITextField *textField;

@end

@implementation BookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@", self.room.hotel.name);
    
    [self setupLabel];
    [self setupTextfield];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(bookButtonPressed:)];
    
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


-(void)setupTextfield{
    self.textField = [[UITextField alloc]init];
    [self.view addSubview:self.textField];
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    self.textField.translatesAutoresizingMaskIntoConstraints = NO;
    self.textField.placeholder = @"Enter Your Name Sir";
    
    // Set constraints.
    NSLayoutConstraint *imageViewLeading = [NSLayoutConstraint constraintWithItem:self.textField attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0 constant:20.0];
    NSLayoutConstraint *imageViewTop = [NSLayoutConstraint constraintWithItem:self.textField  attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:74.0];
    NSLayoutConstraint *imageViewTrailing = [NSLayoutConstraint constraintWithItem:self.textField  attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:-20.0];
    
    // Activate constraints.
    imageViewLeading.active = YES;
    imageViewTop.active = YES;
    imageViewTrailing.active = YES;
    
    [self.textField becomeFirstResponder];
    
}

- (void)bookButtonPressed:(UIBarButtonItem *)sender {
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    NSManagedObjectContext *context = delegate.managedObjectContext;
    
    Reservation *reservation = [NSEntityDescription insertNewObjectForEntityForName:@"Reservation" inManagedObjectContext:delegate.managedObjectContext];
    
    reservation.startDate = [NSDate date];
    reservation.endDate = self.endDate;
    
    reservation.room = self.room;
    self.room.reservation = reservation;
    
    Guest *guest = [NSEntityDescription insertNewObjectForEntityForName:@"Guest" inManagedObjectContext:context];
    guest.name = self.textField.text;
    
    reservation.guest = guest;
    
    [context save:nil];
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
