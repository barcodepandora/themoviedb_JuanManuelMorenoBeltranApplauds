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
    // Do any additional setup after loading the view from its nib.
    NSLog(@"OK");
    
    // Register custom cell
    [self.collectionView registerClass:[TMDBCollectionViewCell class] forCellWithReuseIdentifier:@"MovieCell"];
    
    // Set up data source and delegate
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    
    // Initialize movies array
    [self fetchMovies]; // You can implement this to get your data
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
    
    // Reload the collection view to display the movies
//    TMDBUseCase *useCase = [[TMDBUseCase alloc] init];
//    [useCase fetchDataWithCompletion:^(NSArray<Movie *> * _Nullable movies, NSError * _Nullable error) {
        
    TMDBViewModel *vm = [[TMDBViewModel alloc] initWithUseCase:(TMDBUseCase *)[[TMDBUseCase alloc] init]];
    [vm fetchMoviesWithCompletion:^(NSArray<Movie *> * _Nullable movies, NSError * _Nullable error) {

        if (error) {
            NSLog(@"Error fetching data: %@", error.localizedDescription);
        } else {
            NSLog(@"Successfully fetched %lu movies", (unsigned long)movies.count);
            // Here, you can process the array of Movie objects
            
            for (Movie *movie in movies) {
//                NSLog(@"Movie Title: %@", movie.title);
                NSLog(@"Movie Title: %@", [movie valueForKey:@"title"]);
            }
            self.movies = movies;
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.collectionView reloadData];
            });
//            [self.collectionView reloadData];
        }
    }];
    
    
}

// This method is required for UICollectionViewDataSource. It returns the number of items in the section.
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.movies.count;
}

// This method is required for UICollectionViewDataSource. It returns the cell for a given index path.
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TMDBCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MovieCell" forIndexPath:indexPath];
    
    // Configure the cell with movie data
    Movie *movie = self.movies[indexPath.item];
    [cell configureWithMovie:movie];
    
    return cell;
}

// This method is required for UICollectionViewDelegate. It is called when a user selects an item in the collection view.
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    // Get the selected movie
    Movie *movie = self.movies[indexPath.item];
    
    // Create a detail view controller
    MovieViewController *detailViewController = [[MovieViewController alloc] initWithMovie:movie];
    
    // Push the detail view controller onto the navigation stack
    [self.navigationController pushViewController:detailViewController animated:YES];
}

- (NSArray<Movie *> *)parseMoviesFromJSON:(NSArray *)jsonArray {
    NSMutableArray<Movie *> *moviesArray = [NSMutableArray array];
    
    for (NSDictionary *dict in jsonArray) {
        Movie *movie = [[Movie alloc] initWithAdult:[dict[@"adult"] boolValue]
                                      backdrop_path:dict[@"backdrop_path"]
                                                 id:[dict[@"id"] integerValue]
                                  original_language:dict[@"original_language"]
                                           overview:dict[@"overview"]
                                         popularity:[dict[@"popularity"] doubleValue]
                                        poster_path:dict[@"poster_path"]
                                       release_date:dict[@"release_date"]
                                              title:dict[@"title"]
                                              video:[dict[@"video"] boolValue]
                                       vote_average:[dict[@"vote_average"] doubleValue]
                                         vote_count:[dict[@"vote_count"] integerValue]];
        
        [moviesArray addObject:movie];
    }
    
    return [moviesArray copy];
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
