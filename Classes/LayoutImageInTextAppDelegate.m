//
//  LayoutImageInTextAppDelegate.m
//  LayoutImageInText
//
//  Created by Haoxiang on 6/14/11.
//  Copyright 2011 DEV. All rights reserved.
//

#import "LayoutImageInTextAppDelegate.h"
#import "TestView.h"
#import "FixWidthText.h"

@implementation LayoutImageInTextAppDelegate

@synthesize window;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    

    NSString *inputPath = @"/Users/hli/Temp/input.txt";
    NSString *outputPath = @"/Users/hli/Temp/output.txt";
    
    FixWidthText *fixWidthText = [[[FixWidthText alloc] init] autorelease];
    NSString *inputText = [NSString stringWithContentsOfFile:inputPath
                                                    encoding:NSUTF8StringEncoding
                                                       error:nil];
    NSString *outputText = [fixWidthText textWithFixedWidth:inputText];
    [outputText writeToFile:outputPath 
                 atomically:YES
                   encoding:NSUTF8StringEncoding
                      error:nil];
    
    TestView *testView = [[TestView alloc] initWithFrame:CGRectMake(10, 60, 300, 200)];
    testView.text = inputText;
    testView.transform = CGAffineTransformRotate(CGAffineTransformMakeScale(-1.0f, 1.0f), M_PI);
    [self.window addSubview:testView];
    [testView release];
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
