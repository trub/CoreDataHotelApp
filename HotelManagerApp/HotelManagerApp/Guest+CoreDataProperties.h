//
//  Guest+CoreDataProperties.h
//  HotelManagerApp
//
//  Created by Matthew Weintrub on 12/1/15.
//  Copyright © 2015 matthew weintrub. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Guest.h"

NS_ASSUME_NONNULL_BEGIN

@interface Guest (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) Reservation *reservation;

@end

NS_ASSUME_NONNULL_END
