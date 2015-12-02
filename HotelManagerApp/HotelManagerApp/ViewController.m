//
//  ViewController.m
//  HotelManagerApp
//
//  Created by Matthew Weintrub on 12/1/15.
//  Copyright © 2015 matthew weintrub. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (void)setUI {
    
    
    UIButton *browseButton = [[UIButton alloc]init];
    UIButton *bookButton = [[UIButton alloc]init];
    UIButton *lookupButton = [[UIButton alloc]init];
    
    UIImage *headerImage = [UIImage imageNamed:@"GB"];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:headerImage];
    
    CGFloat navigationBarHeight = CGRectGetHeight(self.navigationController.navigationBar.frame);
    CGFloat itemSize = (CGFloat) (self.view.frame.size.height - navigationBarHeight) /4;

    imageView.frame = CGRectMake(0.0, navigationBarHeight, CGRectGetWidth(self.view.frame), itemSize);
    
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.clipsToBounds = YES;
    
    
    [browseButton setTitle:@"Browse" forState:UIControlStateNormal];
    [bookButton setTitle:@"Book" forState:UIControlStateNormal];
    [lookupButton setTitle:@"Lookup" forState:UIControlStateNormal];
    
    [browseButton setBackgroundColor:[UIColor colorWithRed:1.00 green:0.90 blue:0.60 alpha:1.0]];
    [bookButton setBackgroundColor:[UIColor colorWithRed:1.00 green:0.85 blue:0.40 alpha:1.0]];
    [lookupButton setBackgroundColor:[UIColor colorWithRed:0.95 green:0.76 blue:0.20 alpha:1.0]];
    

    [browseButton setTitleColor:[UIColor darkTextColor] forState:UIControlStateNormal];
    [bookButton setTitleColor:[UIColor darkTextColor] forState:UIControlStateNormal];
    [lookupButton setTitleColor:[UIColor darkTextColor] forState:UIControlStateNormal];

    [browseButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [bookButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [lookupButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    
    
    NSLayoutConstraint *imageViewLeading = [NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0.0];
    NSLayoutConstraint *imageViewTop = [NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:navigationBarHeight];
    NSLayoutConstraint *imageViewTrailing = [NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0.0];
    
    
    NSLayoutConstraint *browseButtonLeading = [NSLayoutConstraint constraintWithItem:browseButton attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0.0];
    NSLayoutConstraint *browseButtonTop = [NSLayoutConstraint constraintWithItem:browseButton attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:imageView attribute:NSLayoutAttributeBottom multiplier:1.0 constant: 0];
    NSLayoutConstraint *browseButtonTrailing = [NSLayoutConstraint constraintWithItem:browseButton attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0.0];
    
    
    NSLayoutConstraint *bookButtonLeading = [NSLayoutConstraint constraintWithItem:bookButton attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0.0];
    NSLayoutConstraint *bookButtonCenterY= [NSLayoutConstraint constraintWithItem:bookButton attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:browseButton attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
    NSLayoutConstraint *bookButtonTrailing = [NSLayoutConstraint constraintWithItem:bookButton attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0.0];
    
    NSLayoutConstraint *lookupButtonLeading = [NSLayoutConstraint constraintWithItem:lookupButton attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0.0];
    NSLayoutConstraint *lookupButtonBottom = [NSLayoutConstraint constraintWithItem:lookupButton attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:bookButton attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0];
    NSLayoutConstraint *lookupButtonTrailing = [NSLayoutConstraint constraintWithItem:lookupButton attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0.0];
    
    
    // Setup equal height.
     NSLayoutConstraint *imageViewHeight = [NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.0 constant:itemSize];
    NSLayoutConstraint *bookButtonHeight = [NSLayoutConstraint constraintWithItem:bookButton attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:imageView attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0.0];
    NSLayoutConstraint *browseButtonHeight = [NSLayoutConstraint constraintWithItem:browseButton attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:imageView attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0.0];
    NSLayoutConstraint *lookupButtonHeight = [NSLayoutConstraint constraintWithItem:lookupButton attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:imageView attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0.0];
    
    [self.view addSubview:imageView];
    [self.view addSubview:browseButton];
    [self.view addSubview:bookButton];
    [self.view addSubview:lookupButton];

    
    // Activate constraints.
    imageViewLeading.active = YES;
    imageViewTop.active = YES;
    imageViewTrailing.active = YES;
    
    browseButtonLeading.active = YES;
    browseButtonTop.active = YES;
    browseButtonTrailing.active = YES;
    
    bookButtonLeading.active = YES;
    bookButtonCenterY.active = YES;
    bookButtonTrailing.active = YES;
    
    lookupButtonLeading.active = YES;
    lookupButtonBottom.active = YES;
    lookupButtonTrailing.active = YES;
    
    // ...
    imageViewHeight.active = YES;
    bookButtonHeight.active = YES;
    browseButtonHeight.active = YES;
    lookupButtonHeight.active = YES;
    
    // ... Setup actions.
    [browseButton addTarget:self action:@selector(browseButtonSelected:) forControlEvents:UIControlEventTouchUpInside];
    [bookButton addTarget:self action:@selector(bookButtonSelected:) forControlEvents:UIControlEventTouchUpInside];
    [lookupButton addTarget:self action:@selector(lookupButtonSelected:) forControlEvents:UIControlEventTouchUpInside];
    

}


@end
