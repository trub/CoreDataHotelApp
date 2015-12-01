//
//  Reservation+CoreDataProperties.m
//  HotelManagerApp
//
//  Created by Matthew Weintrub on 12/1/15.
//  Copyright © 2015 matthew weintrub. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Reservation+CoreDataProperties.h"

@implementation Reservation (CoreDataProperties)

@dynamic startDate;
@dynamic endDate;
@dynamic room;
@dynamic guest;

@end
