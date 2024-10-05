//
//  TMDBUseCase.h
//  themoviedb_JuanManuelMorenoBeltranApplauds
//
//  Created by Juan Manuel Moreno on 5/10/24.
//

#ifndef TMDBUseCase_h
#define TMDBUseCase_h


#endif /* TMDBUseCase_h */

#import <Foundation/Foundation.h>
#import "TMDBUseCaseProtocol.h"
#import "Movie.h"

// TMDBUseCase class implementation
@interface TMDBUseCase : NSObject <TMDBUseCaseProtocol>

@property (nonatomic, strong) NSArray<Movie *> *movies;

@end
