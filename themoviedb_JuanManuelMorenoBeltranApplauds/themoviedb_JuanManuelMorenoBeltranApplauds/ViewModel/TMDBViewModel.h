//
//  TMDBViewModel.h
//  themoviedb_JuanManuelMorenoBeltranApplauds
//
//  Created by Juan Manuel Moreno on 5/10/24.
//

#ifndef TMDBViewModel_h
#define TMDBViewModel_h


#endif /* TMDBViewModel_h */

#import "TMDBUseCase.h"
#import "Movie.h"

@interface TMDBViewModel : NSObject

@property (nonatomic, strong) TMDBUseCase *useCase;
@property (nonatomic, strong) NSArray<Movie *> *movies;

- (instancetype)initWithUseCase:(TMDBUseCase *)useCase;

- (void)fetchMoviesWithCompletion:(void (^)(NSArray<Movie *> * _Nullable movies, NSError * _Nullable error))completion;

@end
