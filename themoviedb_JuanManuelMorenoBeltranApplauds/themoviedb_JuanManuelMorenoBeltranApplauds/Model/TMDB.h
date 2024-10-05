//
//  TMDB.h
//  themoviedb_JuanManuelMorenoBeltranApplauds
//
//  Created by Juan Manuel Moreno on 5/10/24.
//

#ifndef TMDB_h
#define TMDB_h


#endif /* TMDB_h */

#import <Foundation/Foundation.h>

@interface TMDB : NSObject

@property (nonatomic, assign) NSInteger page;
@property (nonatomic, strong) NSArray *results;

- (instancetype)initWithData:(NSData *)data error:(NSError **)error;

@end
