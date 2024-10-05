//
//  TMDBUseCase.m
//  themoviedb_JuanManuelMorenoBeltranApplauds
//
//  Created by Juan Manuel Moreno on 5/10/24.
//

#import <Foundation/Foundation.h>
#import "TMDBUseCaseProtocol.h"
#import "TMDBUseCase.h"
#import "TMDB.h"
#import "Movie.h"
#import "APIRouter.h"

// Define the errors as constants
static NSString * const ScotiaBankErrorDomain = @"com.scotiabank.error";

typedef NS_ENUM(NSInteger, ScotiaBankErrorCode) {
    ScotiaBankErrorWhenRequest,
    ScotiaBankErrorWhenData,
    ScotiaBankErrorWhenViewModel
};

// Define a method to generate NSError for ScotiaBank errors
NSError * ScotiaBankErrorWithCode(ScotiaBankErrorCode code) {
    NSString *errorMessage;
    switch (code) {
        case ScotiaBankErrorWhenRequest:
            errorMessage = @"Request failed.";
            break;
        case ScotiaBankErrorWhenData:
            errorMessage = @"Data is empty.";
            break;
        case ScotiaBankErrorWhenViewModel:
            errorMessage = @"ViewModel error.";
            break;
    }
    
    return [NSError errorWithDomain:ScotiaBankErrorDomain code:code userInfo:@{NSLocalizedDescriptionKey: errorMessage}];
}

//// TMDBUseCaseProtocol definition
//@protocol TMDBUseCaseProtocol <NSObject>
//
//- (void)fetchDataWithCompletion:(void (^)(NSArray<Movie *> * _Nullable movies, NSError * _Nullable error))completion;
//- (NSArray<Movie *> *)getDataWithFilter:(Handler *)filterForMovies order:(MovieOrder)order filter:(NSString *)filter;
//- (NSArray<Movie *> *)orderDataWithMovies:(NSArray<Movie *> *)moviesForOrder order:(MovieOrder)order filter:(NSString *)filter;
//
//@end

//// TMDBUseCase class implementation
//@interface TMDBUseCase : NSObject <TMDBUseCaseProtocol>
//
//@property (nonatomic, strong) NSArray<Movie *> *movies;
//
//@end

@implementation TMDBUseCase

// Fetch data method using completion handler
- (void)fetchDataWithCompletion:(void (^)(NSArray<Movie *> * _Nullable movies, NSError * _Nullable error))completion {
    NSURLRequest *request = [APIRouterHelper requestForRoute:APIRouterGetData];
    
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            completion(nil, ScotiaBankErrorWithCode(ScotiaBankErrorWhenRequest));
            return;
        }
        
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        if (httpResponse.statusCode < 200 || httpResponse.statusCode > 300) {
            completion(nil, ScotiaBankErrorWithCode(ScotiaBankErrorWhenRequest));
            return;
        }
        
        if (data.length == 0) {
            completion(nil, ScotiaBankErrorWithCode(ScotiaBankErrorWhenData));
            return;
        }
        
        NSError *decodeError = nil;
        TMDB *tmdb = [[TMDB alloc] initWithData:data error:&decodeError];
        if (decodeError) {
            completion(nil, ScotiaBankErrorWithCode(ScotiaBankErrorWhenViewModel));
            return;
        }
        
        self.movies = tmdb.results;
        completion(self.movies, nil);
    }];
    
    [task resume];
}

//// Get data with filtering logic
//- (NSArray<Movie *> *)getDataWithFilter:(Handler *)filterForMovies order:(MovieOrder)order filter:(NSString *)filter {
//    NSMutableArray<Movie *> *filteredMovies = [NSMutableArray arrayWithArray:(filter.length == 0 ? self.movies : [self.movies filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"title CONTAINS %@", filter]])];
//    
//    // Filter based on adult content
//    switch (filterForMovies.adult) {
//        case HandlerAdultAllMinusAdult:
//            [filteredMovies filterUsingPredicate:[NSPredicate predicateWithFormat:@"adult == NO"]];
//            break;
//        case HandlerAdultAdult:
//            [filteredMovies filterUsingPredicate:[NSPredicate predicateWithFormat:@"adult == YES"]];
//            break;
//        case HandlerAdultAll:
//            break;
//    }
//    
//    // Filter based on language
//    switch (filterForMovies.language) {
//        case HandlerLanguageEnglish:
//            [filteredMovies filterUsingPredicate:[NSPredicate predicateWithFormat:@"original_language == %@", @"en"]];
//            break;
//        case HandlerLanguageFrancaise:
//            [filteredMovies filterUsingPredicate:[NSPredicate predicateWithFormat:@"original_language == %@", @"fr"]];
//            break;
//        case HandlerLanguageAll:
//            break;
//    }
//    
//    // Filter based on vote average
//    switch (filterForMovies.average) {
//        case HandlerAverageLessThan5K:
//            [filteredMovies filterUsingPredicate:[NSPredicate predicateWithFormat:@"vote_average <= 7"]];
//            break;
//        case HandlerAverageMoreThan5K:
//            [filteredMovies filterUsingPredicate:[NSPredicate predicateWithFormat:@"vote_average > 7"]];
//            break;
//        case HandlerAverageAll:
//            break;
//    }
//    
//    return [self orderDataWithMovies:filteredMovies order:order filter:filter];
//}
//
//// Order data method
//- (NSArray<Movie *> *)orderDataWithMovies:(NSArray<Movie *> *)moviesForOrder order:(MovieOrder)order filter:(NSString *)filter {
//    NSArray<Movie *> *orderedMovies;
//    
//    switch (order) {
//        case MovieOrderPopularity:
//            orderedMovies = [moviesForOrder sortedArrayUsingComparator:^NSComparisonResult(Movie *movie1, Movie *movie2) {
//                return [movie2.popularity compare:movie1.popularity];
//            }];
//            break;
//        case MovieOrderTopRated:
//            orderedMovies = [moviesForOrder sortedArrayUsingComparator:^NSComparisonResult(Movie *movie1, Movie *movie2) {
//                return [movie2.vote_count compare:movie1.vote_count];
//            }];
//            break;
//    }
//    
//    return orderedMovies;
//}

@end
