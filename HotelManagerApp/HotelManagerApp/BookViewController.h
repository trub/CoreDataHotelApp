//
//  BookViewController.h
//  HotelManagerApp
//
//  Created by Matthew Weintrub on 12/8/15.
//  Copyright © 2015 matthew weintrub. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Room.h"

@interface BookViewController : UIViewController

@property (strong, nonatomic) Room *room;
@property (strong, nonatomic) NSDate *startDate;
@property (strong, nonatomic) NSDate *endDate;

@end
