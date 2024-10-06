//
//  APIRouter.h
//  themoviedb_JuanManuelMorenoBeltranApplauds
//
//  Created by Juan Manuel Moreno on 5/10/24.
//

#ifndef APIRouter_h
#define APIRouter_h


#endif /* APIRouter_h */

typedef NS_ENUM(NSUInteger, APIRouter) {
    APIRouterGetData
};

@interface APIRouterHelper : NSObject

+ (NSURLRequest *)requestForRoute:(APIRouter)route;

@end

@interface APIConstant : NSObject

+ (instancetype)shared;

@property (nonatomic, readonly) NSString *URLStringTMDB;
@property (nonatomic, readonly) NSString *URLStringPoster;

@end
