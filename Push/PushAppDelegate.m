//
//  PushAppDelegate.m
//  Push
//
//  Created by One Associates Technologies Pvt Ltd on 30/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PushAppDelegate.h"

#import "PushViewController.h"

@implementation PushAppDelegate
@synthesize stringDeviceToken,oneAssociates;
@synthesize window = _window;
@synthesize viewController = _viewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    
    name=@"himanshulanjewar";
    NSString *himanshulanjewar=@"himanshulanjewar";
    [prefs setObject:himanshulanjewar forKey:@"himanshulanjewar"];
    
    device=@"0f744707bebcf74f9b7c25d48e3358945f6aa01da5ddb387462c7eaf61bbad78";
    [prefs setObject:device forKey:@"deviceHardCoded"];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.viewController = [[PushViewController alloc] initWithNibName:@"PushViewController" bundle:nil];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    [[UIApplication sharedApplication] registerForRemoteNotificationTypes:
     (UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound | UIRemoteNotificationTypeAlert)];
    
    
    if (launchOptions != nil)
	{
		NSDictionary* dictionary = [launchOptions objectForKey:UIApplicationLaunchOptionsRemoteNotificationKey];
		if (dictionary != nil)
		{
			NSLog(@"Launched from push notification: %@", dictionary);
            [UIApplication sharedApplication].applicationIconBadgeNumber++;
			[self addMessageFromRemoteNotification:dictionary updateUI:NO];
		}
	}

        
    return YES;
}

- (void)application:(UIApplication*)application didReceiveRemoteNotification:(NSDictionary*)userInfo
{
	NSLog(@"Received notification: %@", userInfo);
    [UIApplication sharedApplication].applicationIconBadgeNumber++;
	//[self addMessageFromRemoteNotification:userInfo updateUI:YES];
}

- (void)addMessageFromRemoteNotification:(NSDictionary*)userInfo updateUI:(BOOL)updateUI
{
	// Create a new Message object
	
    
	// The JSON payload is already converted into an NSDictionary for us.
	// We are interested in the contents of the alert message.
	NSString* alertValue = [[userInfo valueForKey:@"aps"] valueForKey:@"alert"];
    
	// The server API formatted the alert text as "sender: message", so we
	// split that up into a sender name and the actual message text.
	
	
      NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setObject:alertValue forKey:@"alertValue"];
    
	// Add the Message to the data model's list of messages
	
    
	// If we are called from didFinishLaunchingWithOptions, we should not
	// tell the ChatViewController's table view to insert the new Message.
	// At that point, the table view isn't loaded yet and it gets confused.
	    

}

- (void)application:(UIApplication*)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData*)deviceToken
{
	NSLog(@"My token is: %@", deviceToken);
    NSString *string = [[NSString alloc] initWithData:deviceToken encoding:NSUTF8StringEncoding];
    
    if (string.length==device.length) {
        
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Alert View" message:string delegate:self cancelButtonTitle:@"Get Device Token" otherButtonTitles:nil, nil];
        [alert show];
    }
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setObject:string forKey:@"deviceToken"];
    [prefs synchronize];
    
}

- (void)application:(UIApplication*)application didFailToRegisterForRemoteNotificationsWithError:(NSError*)error
{
	NSLog(@"Failed to get token, error: %@", error);
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
