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

- (void)fetchMoviesWithCompletion:(void (^)(NSArray<Movie *> * _Nullable movies, NSError * _Nullable error))completion {
    [self.useCase fetchDataWithCompletion:^(NSArray<Movie *> * _Nullable movies, NSError * _Nullable error) {
        if (error) {
            completion(nil, error);
            return;
        }
        
        self.movies = movies;
        completion(self.movies, nil);
    }];
}

@end
