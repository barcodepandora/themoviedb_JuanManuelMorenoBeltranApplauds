//
//  TMDBViewModel.m
//  themoviedb_JuanManuelMorenoBeltranApplauds
//
//  Created by Juan Manuel Moreno on 5/10/24.
//

#import <Foundation/Foundation.h>
#import "TMDBViewModel.h"
#import "TMDBUseCaseProtocol.h"
#import "TMDBUseCase.h"
#import "TMDB.h"
       
@implementation TMDBViewModel

- (instancetype)initWithUseCase:(TMDBUseCase *)useCase {
    self = [super init];
    if (self) {
        _useCase = useCase;
    }
    return self;
}

- (void)fetchTVShowsWithCompletion:(void (^)(NSArray<TVShow *> * _Nullable tvshows, NSError * _Nullable error))completion {
    [self.useCase fetchDataWithCompletion:^(NSArray<TVShow *> * _Nullable tvshows, NSError * _Nullable error) {
        if (error) {
            completion(nil, error);
            return;
        }
        
        self.tvshows = tvshows;
        completion(self.tvshows, nil);
    }];
}

@end
