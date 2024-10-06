//
//  APIRouter.m
//  themoviedb_JuanManuelMorenoBeltranApplauds
//
//  Created by Juan Manuel Moreno on 5/10/24.
//

#import <Foundation/Foundation.h>
#import "APIRouter.h"

//@interface APIConstant : NSObject
//
//+ (instancetype)shared;
//
//@property (nonatomic, readonly) NSString *URLStringTMDB;
//@property (nonatomic, readonly) NSString *URLStringPoster;
//
//@end

@implementation APIConstant

+ (instancetype)shared {
    static APIConstant *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[APIConstant alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _URLStringTMDB = @"https://api.themoviedb.org/3/movie/popular?api_key=41bb2316eccb422b9542a10273931559";
        _URLStringPoster = @"https://image.tmdb.org/t/p/original";
    }
    return self;
}

@end

@implementation APIRouterHelper

+ (NSURLRequest *)requestForRoute:(APIRouter)route {
    switch (route) {
        case APIRouterGetData: {
            NSString *urlString = [APIConstant.shared URLStringTMDB];
            NSURL *url = [NSURL URLWithString:urlString];
            NSURLRequest *request = [NSURLRequest requestWithURL:url];
            return request;
        }
    }
}

@end
