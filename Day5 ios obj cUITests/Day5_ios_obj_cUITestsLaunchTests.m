//
//  Day5_ios_obj_cUITestsLaunchTests.m
//  Day5 ios obj cUITests
//
//  Created by Kerolos on 18/04/2025.
//

#import <XCTest/XCTest.h>

@interface Day5_ios_obj_cUITestsLaunchTests : XCTestCase

@end

@implementation Day5_ios_obj_cUITestsLaunchTests

+ (BOOL)runsForEachTargetApplicationUIConfiguration {
    return YES;
}

- (void)setUp {
    self.continueAfterFailure = NO;
}

- (void)testLaunch {
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app launch];

    // Insert steps here to perform after app launch but before taking a screenshot,
    // such as logging into a test account or navigating somewhere in the app

    XCTAttachment *attachment = [XCTAttachment attachmentWithScreenshot:XCUIScreen.mainScreen.screenshot];
    attachment.name = @"Launch Screen";
    attachment.lifetime = XCTAttachmentLifetimeKeepAlways;
    [self addAttachment:attachment];
}

@end
