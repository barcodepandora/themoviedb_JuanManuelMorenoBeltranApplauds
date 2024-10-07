//
//  TMDBViewController.m
//  themoviedb_JuanManuelMorenoBeltranApplauds
//
//  Created by Juan Manuel Moreno on 4/10/24.
//

#import "TMDBViewController.h"
#import "TMDBViewModel.h"
#import "TMDBCollectionViewCell.h"
#import "MovieViewController.h"
#import "TMDBUseCaseProtocol.h"

@interface TMDBViewController ()

@end

@implementation TMDBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.collectionView registerClass:[TMDBCollectionViewCell class] forCellWithReuseIdentifier:@"MovieCell"];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self fetchMovies];
}

- (void)fetchMovies {
    // Example data, replace with actual fetch logic
//    Movie *movie1 = [[Movie alloc] initWithAdult:NO
//                                  backdrop_path:@"path1"
//                                              id:1
//                              original_language:@"en"
//                                        overview:@"Overview 1"
//                                      popularity:8.0
//                                     poster_path:@"poster1"
//                                   release_date:@"2024-01-01"
//                                           title:@"Movie 1"
//                                           video:NO
//                                    vote_average:7.5
//                                      vote_count:1000];
//    
//    Movie *movie2 = [[Movie alloc] initWithAdult:NO
//                                  backdrop_path:@"path2"
//                                              id:2
//                              original_language:@"en"
//                                        overview:@"Overview 2"
//                                      popularity:9.5
//                                     poster_path:@"poster2"
//                                   release_date:@"2024-02-01"
//                                           title:@"Movie 2"
//                                           video:NO
//                                    vote_average:8.5
//                                      vote_count:2000];
//    
//    self.movies = @[movie1, movie2];
    if (self.movies.count == 0) {
        TMDBViewModel *vm = [[TMDBViewModel alloc] initWithUseCase:(TMDBUseCase *)[[TMDBUseCase alloc] init]];
        [vm fetchMoviesWithCompletion:^(NSArray<Movie *> * _Nullable movies, NSError * _Nullable error) {
            if (error) {
                NSLog(@"Error fetching data: %@", error.localizedDescription);
            } else {
                NSLog(@"Successfully fetched %lu movies", (unsigned long)movies.count);
    //            self.movies = movies;
                dispatch_async(dispatch_get_main_queue(), ^{
                    self.movies = movies;
                    [self.collectionView reloadData];
                });
            }
        }];
        self.movies = [[NSArray alloc] init];
        [self.collectionView reloadData];
        [self.collectionView.collectionViewLayout invalidateLayout];
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.movies.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TMDBCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MovieCell" forIndexPath:indexPath];
    Movie *movie = self.movies[indexPath.item];
    [cell configureWithMovie:movie];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    Movie *movie = self.movies[indexPath.item];
    MovieViewController *detailViewController = [[MovieViewController alloc] initWithMovie:movie];
    [self.navigationController pushViewController:detailViewController animated:YES];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    // Example: Full width and a custom height
    CGFloat width = 180; //collectionView.frame.size.width;
    CGFloat height = 350; // Example height for the cell
    return CGSizeMake(width, height);
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
