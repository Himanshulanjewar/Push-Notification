//
//  PushAppDelegate.h
//  Push
//
//  Created by One Associates Technologies Pvt Ltd on 30/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PushViewController;

@interface PushAppDelegate : UIResponder <UIApplicationDelegate>
{
    NSString *stringDeviceToken;
    NSString *device;
    NSString *name;
}

@property (strong, nonatomic) UIWindow *window;
@property  (strong,nonatomic) NSString *oneAssociates;
@property (strong,nonatomic) NSString*stringDeviceToken;
@property (strong, nonatomic) PushViewController *viewController;

@end
