//
//  TMDBViewController.h
//  themoviedb_JuanManuelMorenoBeltranApplauds
//
//  Created by Juan Manuel Moreno on 4/10/24.
//

#import "ViewController.h"
#import "TVShow.h"

NS_ASSUME_NONNULL_BEGIN

@interface TMDBViewController : ViewController

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) NSArray<TVShow *> *tvshows;
@property (nonatomic) NSUInteger selectedIndex;

@property (weak, nonatomic) IBOutlet UIView *menu;

- (void)callFunction1;
- (void)callFunction2;

@end

NS_ASSUME_NONNULL_END
