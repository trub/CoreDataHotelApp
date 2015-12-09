//
//  AppDelegate.m
//  HotelManagerApp
//
//  Created by Matthew Weintrub on 12/1/15.
//  Copyright © 2015 matthew weintrub. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

#import "Hotel.h"
#import "Room.h"
#import "Reservation.h"
#import "Guest.h"

@interface AppDelegate ()

@property (strong, nonatomic) UINavigationController *navigationController;
@property (strong, nonatomic) ViewController *viewController;

@end


@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self setRootViewController];
    [self seedTheDatabase];
    return YES;
}

- (void)setRootViewController {
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    self.viewController = [[ViewController alloc]init];
    self.navigationController = [[UINavigationController alloc]initWithRootViewController:self.viewController];
    
    self.viewController.view.backgroundColor = [UIColor blackColor];
    self.window.rootViewController = self.navigationController;
    
    [self.window makeKeyAndVisible];
}


- (void)applicationWillTerminate:(UIApplication *)application {
    [self saveContext];
}



- (void)seedTheDatabase {    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Hotel"];
    
    NSError *error;
    NSInteger count = [self.managedObjectContext countForFetchRequest:request error:&error];
    
    if (count == 0) {
        NSDictionary *hotels = [[NSDictionary alloc]init];
        NSDictionary *rooms = [[NSDictionary alloc]init];
        
        NSString *jsonPath = [[NSBundle mainBundle]pathForResource:@"hotels" ofType:@"json"];
        NSData *jsonData = [NSData dataWithContentsOfFile:jsonPath];
        
        NSError *jsonError;
        NSDictionary *rootObject =[NSJSONSerialization JSONObjectWithData:jsonData options: NSJSONReadingMutableContainers error:&jsonError];
        
        if (jsonError) {
            NSLog(@"error in parsing json");
            return;
        }
        
        hotels = rootObject[@"Hotels"];
        
        for (NSDictionary *hotel in hotels) {
            
            Hotel *jsonHotel = [NSEntityDescription insertNewObjectForEntityForName:@"Hotel" inManagedObjectContext: self.managedObjectContext];
            jsonHotel.name = hotel[@"name"];
            jsonHotel.location = hotel[@"location"];
            jsonHotel.rating = hotel[@"rating"];
            
            
            rooms = hotel[@"rooms"];
            
            for (NSDictionary *room in rooms) {
                
                Room *jsonRoom = [NSEntityDescription insertNewObjectForEntityForName:@"Room" inManagedObjectContext:self.managedObjectContext];
                jsonRoom.number = room[@"number"];
                jsonRoom.beds = room[@"beds"];
                jsonRoom.rate = room[@"rate"];
                jsonRoom.hotel = jsonHotel;
                
                NSLog(@"this %@", jsonHotel);

            }
        
        }
        
        NSError *saveError;
        BOOL isSaved = [self.managedObjectContext save:&saveError];
        
        if (isSaved) {
            NSLog(@"Saved successfully.");
        } else {
            NSLog(@"%@", saveError.localizedDescription);
        }
    
    }
    
}





#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "com.trub.HotelManagerApp" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"HotelManagerApp" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"HotelManagerApp.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

@end
