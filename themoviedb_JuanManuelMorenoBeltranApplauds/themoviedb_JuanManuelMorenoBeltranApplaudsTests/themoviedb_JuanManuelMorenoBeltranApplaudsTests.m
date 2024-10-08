//
//  themoviedb_JuanManuelMorenoBeltranApplaudsTests.m
//  themoviedb_JuanManuelMorenoBeltranApplaudsTests
//
//  Created by Juan Manuel Moreno on 4/10/24.
//

#import <XCTest/XCTest.h>
#import "TMDBUseCase.h"
#import "TMDBViewModel.h"
#import "TMDB.h"
#import "TVShow.h"

@interface themoviedb_JuanManuelMorenoBeltranApplaudsTests : XCTestCase

@property (nonatomic, strong) TMDBUseCase *useCase;
@property (nonatomic, strong) TMDBViewModel *viewModel;

@end

@implementation themoviedb_JuanManuelMorenoBeltranApplaudsTests

- (void)setUp {
    [super setUp];
    self.useCase = [[TMDBUseCase alloc] init];
    self.viewModel = [[TMDBViewModel alloc] initWithUseCase:self.useCase];
}

- (void)tearDown {
    [super tearDown];
    self.useCase = nil;
    self.viewModel = nil;
}

- (void)testFetchDataWithCompletionSuccess {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Fetch data with completion success"];
    [self.useCase fetchDataWithCompletion:^(NSArray<TVShow *> * _Nullable tvshows, NSError * _Nullable error) {
        XCTAssertNotNil(tvshows);
        XCTAssertNil(error);
        [expectation fulfill];
    }];
    [self waitForExpectationsWithTimeout:10 handler:nil];
}

- (void)testFetchDataWithCompletionFailure {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Fetch data with completion failure"];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://api.themoviedb.org/1"]];
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        NSInteger statusCode = httpResponse.statusCode;
        XCTAssertFalse(statusCode == 200);
        [expectation fulfill];
    }];
    
    [task resume];
    [self waitForExpectationsWithTimeout:10 handler:nil];
}

- (void)testFetchDataWithCompletionEmptyData {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Fetch data with completion empty data"];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://api.themoviedb.org/3/tv/popular?api_key=123"]];
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        id objectType = [TMDB class];
        if ([NSJSONSerialization JSONObjectWithData:data options:0 error:nil]) {
            id jsonObject = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            XCTAssertFalse([jsonObject isKindOfClass:objectType]);
        }
        [expectation fulfill];
    }];
    
    [task resume];
    [self waitForExpectationsWithTimeout:10 handler:nil];
}

- (void)testFetchDataWithCompletionValidJSON {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Fetch data with completion valid JSON"];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://api.themoviedb.org/3/tv/popular"]];
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        id jsonObject = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        XCTAssertFalse(error);
        [expectation fulfill];
    }];
    
    [task resume];
    [self waitForExpectationsWithTimeout:10 handler:nil];
}

- (void)testFetchDataWithCompletionMultipleTVShows {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Fetch data with completion multiple TV shows"];
    [self.useCase fetchDataWithCompletion:^(NSArray<TVShow *> * _Nullable tvshows, NSError * _Nullable error) {
        XCTAssertNotNil(tvshows);
        XCTAssertTrue(tvshows.count > 1);
        [expectation fulfill];
    }];
    [self waitForExpectationsWithTimeout:10 handler:nil];
}

- (void)testFetchDataWithCompletionViewModel {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Fetch data with completion view model"];
    [self.viewModel fetchTVShowsWithCompletion:^(NSArray<TVShow *> * _Nullable tvshows, NSError * _Nullable error) {
        XCTAssertNotNil(tvshows);
        XCTAssertTrue(tvshows.count > 0);
        [expectation fulfill];
    }];
    [self waitForExpectationsWithTimeout:10 handler:nil];
}

- (void)testFetchDataWithCompletionMaximumTime {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Fetch data with completion maximum time"];
    [self.useCase fetchDataWithCompletion:^(NSArray<TVShow *> * _Nullable tvshows, NSError * _Nullable error) {
        [expectation fulfill];
        NSTimeInterval startTime = [[NSDate date] timeIntervalSince1970];
        NSTimeInterval maxTimeDuration = 5.0;
        NSTimeInterval endTime = [[NSDate date] timeIntervalSince1970];
        NSTimeInterval timeDuration = endTime - startTime;
        XCTAssertLessThanOrEqual(timeDuration, maxTimeDuration, @"Fetch data delays: %f seconds", timeDuration);
    }];
    [self waitForExpectationsWithTimeout:10 handler:nil];
}

- (void)testFetchDataWithCompletionHasAnImage {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Fetch data with completion shiw has an image"];
    [self.useCase fetchDataWithCompletion:^(NSArray<TVShow *> * _Nullable tvshows, NSError * _Nullable error) {
        NSUInteger randomIndex = arc4random() % tvshows.count;
        id randomElement = tvshows[randomIndex];
        XCTAssertTrue([randomElement valueForKey:@"poster_path"] != nil);
        [expectation fulfill];
    }];
    [self waitForExpectationsWithTimeout:10 handler:nil];
}

@end
