//
//  TMDBViewController.h
//  themoviedb_JuanManuelMorenoBeltranApplauds
//
//  Created by Juan Manuel Moreno on 4/10/24.
//

#import "ViewController.h"
#import "Movie.h"

NS_ASSUME_NONNULL_BEGIN

@interface TMDBViewController : ViewController

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) NSArray<Movie *> *movies;

@end

NS_ASSUME_NONNULL_END
