//
//  TVShowViewController.h
//  themoviedb_JuanManuelMorenoBeltranApplauds
//
//  Created by Juan Manuel Moreno on 5/10/24.
//

//#import "ViewController.h"

//NS_ASSUME_NONNULL_BEGIN

//@interface TVShowViewController : ViewController
//
//@end

#import <UIKit/UIKit.h>
#import "TVShow.h"

@interface TVShowViewController : UIViewController

@property (nonatomic, strong) NSArray *elements;

- (instancetype)initWithTVShow:(TVShow *)movie;

@end

//NS_ASSUME_NONNULL_END
