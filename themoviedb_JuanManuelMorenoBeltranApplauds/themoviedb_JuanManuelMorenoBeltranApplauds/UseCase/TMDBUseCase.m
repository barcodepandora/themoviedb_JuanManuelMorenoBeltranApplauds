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
#import "TVShow.h"
#import "APIRouter.h"

static NSString * const ApplaudoErrorDomain = @"com.Applaudo.error";

typedef NS_ENUM(NSInteger, ApplaudoErrorCode) {
    ApplaudoErrorWhenRequest,
    ApplaudoErrorWhenData,
    ApplaudoErrorWhenViewModel
};

NSError * ApplaudoErrorWithCode(ApplaudoErrorCode code) {
    NSString *errorMessage;
    switch (code) {
        case ApplaudoErrorWhenRequest:
            errorMessage = @"Request failed.";
            break;
        case ApplaudoErrorWhenData:
            errorMessage = @"Data is empty.";
            break;
        case ApplaudoErrorWhenViewModel:
            errorMessage = @"ViewModel error.";
            break;
    }
    
    return [NSError errorWithDomain:ApplaudoErrorDomain code:code userInfo:@{NSLocalizedDescriptionKey: errorMessage}];
}

@implementation TMDBUseCase

- (void)fetchDataWithCompletion:(NSInteger) indexFor completion:(void (^)(NSArray<TVShow *> * _Nullable tvshows, NSError * _Nullable error))completion {
    NSURLRequest *request;
    switch (indexFor) {
    case 1:
        request = [APIRouterHelper requestForRoute:APIRouterGetData];
    case 2:
        request = [APIRouterHelper requestForRoute:APIRouterGetDataTopRated];
    }
    
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            completion(nil, ApplaudoErrorWithCode(ApplaudoErrorWhenRequest));
            return;
        }
        
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        if (httpResponse.statusCode < 200 || httpResponse.statusCode > 300) {
            completion(nil, ApplaudoErrorWithCode(ApplaudoErrorWhenRequest));
            return;
        }
        
        if (data.length == 0) {
            completion(nil, ApplaudoErrorWithCode(ApplaudoErrorWhenData));
            return;
        }
        
        NSError *decodeError = nil;
        TMDB *tmdb = [[TMDB alloc] initWithData:data error:&decodeError];
        if (decodeError) {
            completion(nil, ApplaudoErrorWithCode(ApplaudoErrorWhenViewModel));
            return;
        }
        
        self.tvshows = tmdb.results;
        completion(self.tvshows, nil);
    }];
    
    [task resume];
}

@end
