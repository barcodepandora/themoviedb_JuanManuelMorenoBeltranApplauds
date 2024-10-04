//
//  themoviedb_JuanManuelMorenoBeltranApplaudsUITestsLaunchTests.m
//  themoviedb_JuanManuelMorenoBeltranApplaudsUITests
//
//  Created by Juan Manuel Moreno on 4/10/24.
//

#import <XCTest/XCTest.h>

@interface themoviedb_JuanManuelMorenoBeltranApplaudsUITestsLaunchTests : XCTestCase

@end

@implementation themoviedb_JuanManuelMorenoBeltranApplaudsUITestsLaunchTests

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
