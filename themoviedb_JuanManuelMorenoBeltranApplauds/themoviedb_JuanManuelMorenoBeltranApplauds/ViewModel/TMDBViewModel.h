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
#import "TVShow.h"

@interface TMDBViewModel : NSObject

@property (nonatomic, strong) TMDBUseCase *useCase;
@property (nonatomic, strong) NSArray<TVShow *> *tvshows;

- (instancetype)initWithUseCase:(TMDBUseCase *)useCase;

- (void)fetchTVShowsWithCompletion:(NSInteger) indexFor completion:(void (^)(NSArray<TVShow *> * _Nullable tvshows, NSError * _Nullable error))completion;

@end
