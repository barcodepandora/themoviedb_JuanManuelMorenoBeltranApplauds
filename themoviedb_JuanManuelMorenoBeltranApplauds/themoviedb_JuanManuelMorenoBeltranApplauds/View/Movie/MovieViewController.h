//
//  MovieViewController.h
//  themoviedb_JuanManuelMorenoBeltranApplauds
//
//  Created by Juan Manuel Moreno on 5/10/24.
//

//#import "ViewController.h"

//NS_ASSUME_NONNULL_BEGIN

//@interface MovieViewController : ViewController
//
//@end

#import <UIKit/UIKit.h>
#import "Movie.h"

@interface MovieViewController : UIViewController

@property (nonatomic, strong) NSArray *elements;

- (instancetype)initWithMovie:(Movie *)movie;

@end

//NS_ASSUME_NONNULL_END
