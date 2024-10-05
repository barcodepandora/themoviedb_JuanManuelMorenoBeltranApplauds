//
//  TMDBViewController.m
//  themoviedb_JuanManuelMorenoBeltranApplauds
//
//  Created by Juan Manuel Moreno on 4/10/24.
//

#import "TMDBViewController.h"
#import "TMDBUseCase.h"

@interface TMDBViewController ()

@end

@implementation TMDBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSLog(@"OK");
    
    TMDBUseCase *useCase = [[TMDBUseCase alloc] init];
    [useCase fetchDataWithCompletion:^(NSArray<Movie *> * _Nullable movies, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error fetching data: %@", error.localizedDescription);
        } else {
            NSLog(@"Successfully fetched %lu movies", (unsigned long)movies.count);
            // Here, you can process the array of Movie objects
            for (Movie *movie in movies) {
                NSLog(@"Movie Title: %@", movie.title);
            }
        }
    }];
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
