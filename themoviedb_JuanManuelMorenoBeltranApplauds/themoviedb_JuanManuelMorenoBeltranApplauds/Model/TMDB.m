//
//  TMDB.m
//  themoviedb_JuanManuelMorenoBeltranApplauds
//
//  Created by Juan Manuel Moreno on 4/10/24.
//

#import <Foundation/Foundation.h>
#import "TMDB.h"
#import "Movie.h"

//@interface TMDB : NSObject
//
//@property (nonatomic, assign) NSInteger page;
//@property (nonatomic, strong) NSArray *results;
//
//- (instancetype)initWithPage:(NSInteger)page results:(NSArray *)results;
//
//@end

@implementation TMDB

- (instancetype)initWithData:(NSData *)data error:(NSError **)error {
    self = [super init];
    if (self) {
        NSError *decodeError = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&decodeError];
        
        if (decodeError) {
            if (error) {
                *error = decodeError;
            }
            return nil;
        }
        
        self.page = [json[@"page"] integerValue];
        self.results = json[@"results"];
    }
    return self;
}

@end

//@interface Movie : NSObject
//
//@property (nonatomic, assign) BOOL adult;
//@property (nonatomic, copy) NSString *backdrop_path;
//@property (nonatomic, assign) NSInteger id;
//@property (nonatomic, copy) NSString *original_language;
//@property (nonatomic, copy) NSString *overview;
//@property (nonatomic, assign) double popularity;
//@property (nonatomic, copy) NSString *poster_path;
//@property (nonatomic, copy) NSString *release_date;
//@property (nonatomic, copy) NSString *title;
//@property (nonatomic, assign) BOOL video;
//@property (nonatomic, assign) double vote_average;
//@property (nonatomic, assign) NSInteger vote_count;
//
//- (instancetype)initWithAdult:(BOOL)adult backdrop_path:(NSString *)backdrop_path id:(NSInteger)id original_language:(NSString *)original_language overview:(NSString *)overview popularity:(double)popularity poster_path:(NSString *)poster_path release_date:(NSString *)release_date title:(NSString *)title video:(BOOL)video vote_average:(double)vote_average vote_count:(NSInteger)vote_count;
//
//@end

@implementation Movie

- (instancetype)initWithAdult:(BOOL)adult backdrop_path:(NSString *)backdrop_path id:(NSInteger)id original_language:(NSString *)original_language overview:(NSString *)overview popularity:(double)popularity poster_path:(NSString *)poster_path release_date:(NSString *)release_date title:(NSString *)title video:(BOOL)video vote_average:(double)vote_average vote_count:(NSInteger)vote_count {
    self = [super init];
    if (self) {
        _adult = adult;
        _backdrop_path = [backdrop_path copy];
        _id = id;
        _original_language = [original_language copy];
        _overview = [overview copy];
        _popularity = popularity;
        _poster_path = [poster_path copy];
        _release_date = [release_date copy];
        _title = [title copy];
        _video = video;
        _vote_average = vote_average;
        _vote_count = vote_count;
    }
    return self;
}

@end
