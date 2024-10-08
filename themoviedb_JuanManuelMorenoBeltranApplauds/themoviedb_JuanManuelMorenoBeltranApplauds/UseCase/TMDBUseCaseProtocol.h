//
//  TMDBUseCaseProtocol.h
//  themoviedb_JuanManuelMorenoBeltranApplauds
//
//  Created by Juan Manuel Moreno on 5/10/24.
//

#ifndef TMDBUseCaseProtocol_h
#define TMDBUseCaseProtocol_h


#endif /* TMDBUseCaseProtocol_h */

#import <Foundation/Foundation.h>
#import "Movie.h"

// TMDBUseCaseProtocol definition
@protocol TMDBUseCaseProtocol <NSObject>

- (void)fetchDataWithCompletion:(void (^)(NSArray<Movie *> * _Nullable movies, NSError * _Nullable error))completion;

@end
