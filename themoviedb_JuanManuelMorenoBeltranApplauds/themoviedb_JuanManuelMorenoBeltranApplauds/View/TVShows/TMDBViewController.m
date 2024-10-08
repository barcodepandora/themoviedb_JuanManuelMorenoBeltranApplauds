//
//  TMDBViewController.m
//  themoviedb_JuanManuelMorenoBeltranApplauds
//
//  Created by Juan Manuel Moreno on 4/10/24.
//

#import "TMDBViewController.h"
#import "TMDBViewModel.h"
#import "TMDBCollectionViewCell.h"
#import "TVShowViewController.h"
#import "TMDBUseCaseProtocol.h"

//@interface TMDBViewController ()
//
//@end

@implementation TMDBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.collectionView registerClass:[TMDBCollectionViewCell class] forCellWithReuseIdentifier:@"TVShowCell"];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self presentMenu];
    [self fetchTVShows];
}

- (void)callFunction1 {
    [self fetchTVShows];
}

- (void)callFunction2 {
    [self fetchTVShows];
}

-(void)presentMenu {
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeSystem];
    [button1 setTitle:@"Popular" forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(callFunction1) forControlEvents:UIControlEventTouchUpInside];

    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeSystem];
    [button2 setTitle:@"Top Rated" forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(callFunction2) forControlEvents:UIControlEventTouchUpInside];

    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeSystem];
    [button3 setTitle:@"More..." forState:UIControlStateNormal];
    [button3 addTarget:self action:@selector(callFunction1) forControlEvents:UIControlEventTouchUpInside];

    [self.menu addSubview:button1];
    [self.menu addSubview:button2];
    [self.menu addSubview:button3];

    button1.translatesAutoresizingMaskIntoConstraints = NO;
    button2.translatesAutoresizingMaskIntoConstraints = NO;
    button3.translatesAutoresizingMaskIntoConstraints = NO;

    [NSLayoutConstraint activateConstraints:@[
        // Button 1
        [button1.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:20],
        [button1.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:80],
        [button1.widthAnchor constraintEqualToAnchor:self.view.widthAnchor multiplier:0.3],
        [button1.heightAnchor constraintEqualToConstant:20],

        // Button 2
        [button2.leadingAnchor constraintEqualToAnchor:button1.trailingAnchor constant:10],
        [button2.topAnchor constraintEqualToAnchor:button1.topAnchor],
        [button2.widthAnchor constraintEqualToAnchor:button1.widthAnchor],
        [button2.heightAnchor constraintEqualToAnchor:button1.heightAnchor],

        // Button 3
        [button3.leadingAnchor constraintEqualToAnchor:button2.trailingAnchor constant:10],
        [button3.topAnchor constraintEqualToAnchor:button2.topAnchor],
        [button3.widthAnchor constraintEqualToAnchor:button2.widthAnchor],
        [button3.heightAnchor constraintEqualToAnchor:button2.heightAnchor],

        // Align buttons to the bottom of the view
        [button1.bottomAnchor constraintLessThanOrEqualToAnchor:self.view.bottomAnchor constant:-20],
        [button2.bottomAnchor constraintLessThanOrEqualToAnchor:self.view.bottomAnchor constant:-20],
        [button3.bottomAnchor constraintLessThanOrEqualToAnchor:self.view.bottomAnchor constant:-20]
    ]];
}

- (UIButton *)createButtonWithTitle:(NSString *)title action:(SEL)action {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}

- (void)fetchTVShows {
    if (self.tvshows.count == 0) {
        TMDBViewModel *vm = [[TMDBViewModel alloc] initWithUseCase:(TMDBUseCase *)[[TMDBUseCase alloc] init]];
        [vm fetchTVShowsWithCompletion:^(NSArray<TVShow *> * _Nullable tvshows, NSError * _Nullable error) {
            if (error) {
                NSLog(@"Error fetching data: %@", error.localizedDescription);
            } else {
                NSLog(@"Successfully fetched %lu tvshows", (unsigned long)tvshows.count);
                dispatch_async(dispatch_get_main_queue(), ^{
                    self.tvshows = tvshows;
                    [self.collectionView reloadData];
                });
            }
        }];
        self.tvshows = [[NSArray alloc] init];
        [self.collectionView reloadData];
        [self.collectionView.collectionViewLayout invalidateLayout];
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.tvshows.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TMDBCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TVShowCell" forIndexPath:indexPath];
    TVShow *movie = self.tvshows[indexPath.item];
    [cell configureWithTVShow:movie];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    TVShow *movie = self.tvshows[indexPath.item];
    TVShowViewController *detailViewController = [[TVShowViewController alloc] initWithTVShow:movie];
    [self.navigationController pushViewController:detailViewController animated:YES];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
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
