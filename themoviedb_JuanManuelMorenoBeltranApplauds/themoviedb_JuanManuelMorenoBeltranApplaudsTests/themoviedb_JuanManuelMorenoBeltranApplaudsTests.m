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
#import "Movie.h"

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
    
    [self.useCase fetchDataWithCompletion:^(NSArray<Movie *> * _Nullable movies, NSError * _Nullable error) {
        XCTAssertNotNil(movies);
        XCTAssertNil(error);
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:10 handler:nil];
}

- (void)testFetchDataWithCompletionFailure {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Fetch data with completion failure"];
    
    // Simulate a network error
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://api.paramount.org/3/discover/movie?api_key=123"]];
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        [expectation fulfill];
    }];
    
    [task resume];
    
    [self waitForExpectationsWithTimeout:10 handler:nil];
}

- (void)testFetchDataWithCompletionEmptyData {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Fetch data with completion empty data"];
    
    // Simulate an empty data response
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://api.themoviedb.org/3/discover/movie?api_key=123"]];
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(data);
        XCTAssertEqual(data.length, 0);
        [expectation fulfill];
    }];
    
    [task resume];
    
    [self waitForExpectationsWithTimeout:10 handler:nil];
}

- (void)testFetchDataWithCompletionInvalidJSON {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Fetch data with completion invalid JSON"];
    
    // Simulate an invalid JSON response
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://api.themoviedb.org/3/discover/movie?api_key=123"]];
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        [expectation fulfill];
    }];
    
    [task resume];
    
    [self waitForExpectationsWithTimeout:10 handler:nil];
}

- (void)testFetchDataWithCompletionValidJSON {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Fetch data with completion valid JSON"];
    
    // Simulate a valid JSON response
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://api.themoviedb.org/3/discover/movie?api_key=41bb2316eccb422b9542a10273931559"]];
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(data);
        XCTAssertNotNil(response);
        XCTAssertNil(error);
        [expectation fulfill];
    }];
    
    [task resume];
    
    [self waitForExpectationsWithTimeout:10 handler:nil];
}

- (void)testFetchDataWithCompletionMultipleMovies {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Fetch data with completion multiple movies"];
    
    [self.useCase fetchDataWithCompletion:^(NSArray<Movie *> * _Nullable movies, NSError * _Nullable error) {
        XCTAssertNotNil(movies);
        XCTAssertNotNil(error);
        XCTAssertEqual(movies.count, 2);
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:10 handler:nil];
}

- (void)testFetchDataWithCompletionSingleMovie {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Fetch data with completion single movie"];
    
    [self.useCase fetchDataWithCompletion:^(NSArray<Movie *> * _Nullable movies, NSError * _Nullable error) {
        XCTAssertNotNil(movies);
        XCTAssertNotNil(error);
        XCTAssertEqual(movies.count, 1);
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:10 handler:nil];
}

- (void)testFetchDataWithCompletionNoMovies {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Fetch data with completion no movies"];
    
    [self.useCase fetchDataWithCompletion:^(NSArray<Movie *> * _Nullable movies, NSError * _Nullable error) {
        XCTAssertNotNil(movies);
        XCTAssertNotNil(error);
        XCTAssertEqual(movies.count, 0);
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:10 handler:nil];
}

- (void)testFetchDataWithCompletionViewModel {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Fetch data with completion view model"];
    
    [self.viewModel fetchMoviesWithCompletion:^(NSArray<Movie *> * _Nullable movies, NSError * _Nullable error) {
        XCTAssertNotNil(movies);
        XCTAssertNotNil(error);
        XCTAssertEqual(movies.count, 2);
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:10 handler:nil];
}

@end
