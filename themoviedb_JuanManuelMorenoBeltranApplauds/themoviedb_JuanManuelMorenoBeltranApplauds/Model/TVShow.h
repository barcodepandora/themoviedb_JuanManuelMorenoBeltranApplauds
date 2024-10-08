//
//  TVShow.h
//  themoviedb_JuanManuelMorenoBeltranApplauds
//
//  Created by Juan Manuel Moreno on 5/10/24.
//

#ifndef TVShow_h
#define TVShow_h


#endif /* TVShow_h */

#import <Foundation/Foundation.h>

@interface TVShow : NSObject

@property (nonatomic, assign) BOOL adult;
@property (nonatomic, copy) NSString *backdrop_path;
@property (nonatomic, assign) NSInteger id;
@property (nonatomic, copy) NSString *original_language;
@property (nonatomic, copy) NSString *overview;
@property (nonatomic, assign) double popularity;
@property (nonatomic, copy) NSString *poster_path;
@property (nonatomic, copy) NSString *release_date;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) BOOL video;
@property (nonatomic, assign) double vote_average;
@property (nonatomic, assign) NSInteger vote_count;

- (instancetype)initWithAdult:(BOOL)adult backdrop_path:(NSString *)backdrop_path id:(NSInteger)id original_language:(NSString *)original_language overview:(NSString *)overview popularity:(double)popularity poster_path:(NSString *)poster_path release_date:(NSString *)release_date name:(NSString *)name video:(BOOL)video vote_average:(double)vote_average vote_count:(NSInteger)vote_count;

@end
