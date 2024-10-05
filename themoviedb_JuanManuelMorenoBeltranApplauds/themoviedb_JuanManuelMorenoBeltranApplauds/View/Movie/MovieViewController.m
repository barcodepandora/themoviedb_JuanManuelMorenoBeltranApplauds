//
//  MovieViewController.m
//  themoviedb_JuanManuelMorenoBeltranApplauds
//
//  Created by Juan Manuel Moreno on 5/10/24.
//

#import "MovieViewController.h"
#import "Movie.h"

@interface MovieViewController ()

@end

@implementation MovieViewController

//- (void)viewDidLoad {
//    [super viewDidLoad];
//    // Do any additional setup after loading the view from its nib.
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

//#import <UIKit/UIKit.h>
//#import "Movie.h"
//
//@interface TMDBDetailViewController : UIViewController
//
//- (instancetype)initWithMovie:(Movie *)movie;
//
//@end

//@implementation MovieViewController {
    Movie *_movie;
//}

- (instancetype)initWithMovie:(Movie *)movie {
    self = [super init];
    if (self) {
        _movie = movie;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Configure the view with movie data
    self.title = [_movie valueForKey:@"title"];
    
    // Create a label to display the movie title
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, self.view.bounds.size.width - 20, 20)];
    titleLabel.text = [_movie valueForKey:@"title"];
    [self.view addSubview:titleLabel];
    
    // Create a label to display the movie overview
    UILabel *overviewLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 40, self.view.bounds.size.width - 20, 100)];
    overviewLabel.text = [_movie valueForKey:@"overview"];
    overviewLabel.numberOfLines = 0;
    [self.view addSubview:overviewLabel];
    
//    // Create a label to display the movie release date
//    UILabel *releaseDateLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 150, self.view.bounds.size.width - 20, 20)];
//    releaseDateLabel.text = _movie.release_date;
//    [self.view addSubview:releaseDateLabel];
//    
//    // Create a label to display the movie vote average
//    UILabel *voteAverageLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 180, self.view.bounds.size.width - 20, 20)];
//    voteAverageLabel.text = [NSString stringWithFormat:@"Vote Average: %.1f", _movie.vote_average];
//    [self.view addSubview:voteAverageLabel];
//    
//    // Create a label to display the movie vote count
//    UILabel *voteCountLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 210, self.view.bounds.size.width - 20, 20)];
//    voteCountLabel.text = [NSString stringWithFormat:@"Vote Count: %ld", (long)_movie.vote_count];
//    [self.view addSubview:voteCountLabel];
}

@end
