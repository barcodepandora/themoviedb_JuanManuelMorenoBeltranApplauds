//
//  TMDBCollectionViewCell.m
//  themoviedb_JuanManuelMorenoBeltranApplauds
//
//  Created by Juan Manuel Moreno on 5/10/24.
//

#import "TMDBCollectionViewCell.h"
#import "Movie.h"
#import "APIRouter.h"

@implementation TMDBCollectionViewCell

//- (instancetype)initWithFrame:(CGRect)frame {
//    self = [super initWithFrame:frame];
//    if (self) {
//        // Initialize the title label and poster image view
////        self.posterImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height - 30)];
//        [self.contentView addSubview:self.posterImageView];
//        
//        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, frame.size.height - 30, frame.size.width, 30)];
//        self.titleLabel.textAlignment = NSTextAlignmentCenter;
//        [self.contentView addSubview:self.titleLabel];
//    }
//    return self;
//}
//
// Configure the cell with movie data
- (void)configureWithMovie:(Movie *)movie {
//    self.titleLabel.text = [movie valueForKey:@"title"];
    if (self) {
        [self setupViews:movie];
        [self setupConstraints];
    }
    // Assuming you have a method to fetch image data from the poster path
    // For simplicity, you can use a placeholder image
//    self.posterImageView.image = [UIImage imageNamed:@"placeholder"];
    // You can asynchronously load images from the movie.poster_path if needed
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
//    if (self) {
//        [self setupViews:];
//        [self setupConstraints];
//    }
    return self;
}

- (void)setupViews:(Movie *)movie {
    // Title Label
//    self.titleLabel = [[UILabel alloc] init];
//    self.titleLabel.text = @"Now you’ll be asked to enter your credit card information to prevent multiple free trials for one person.";
//    self.titleLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleTitle2];
//    self.titleLabel.numberOfLines = 0;
//    [self.contentView addSubview:self.titleLabel];
//    
//    // Subtitle Label
//    self.subtitleLabel = [[UILabel alloc] init];
//    self.subtitleLabel.text = @"No worries, nothing will be charged for now. You can cancel your plan anytime from your profile page!";
//    self.subtitleLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
//    self.subtitleLabel.numberOfLines = 0;
//    [self.contentView addSubview:self.subtitleLabel];
    
    // Rectangle View
    self.rectangleView = [[UIView alloc] init];
    self.rectangleView.backgroundColor = [UIColor cyanColor];
    [self.contentView addSubview:self.rectangleView];
    
//    self.imageView = [[UIImageView alloc] initWithImage:[UIImage systemImageNamed:@"star.fill"]];
//    starImageView.tintColor = [UIColor yellowColor];
    [self loadImageWithURL:[movie valueForKey:@"poster_path"]];
//    [mainStackView addArrangedSubview:starImageView];

    // Movie Title Label
    self.movieTitleLabel = [[UILabel alloc] init];
    NSLog(@"Movie Title: %@", [movie valueForKey:@"title"]);
    self.movieTitleLabel.text = [movie valueForKey:@"title"]; //@"Insatiable";
    self.movieTitleLabel.font = [UIFont boldSystemFontOfSize:13.0];
    self.movieTitleLabel.textColor = [UIColor greenColor];
    self.movieTitleLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.movieTitleLabel];
    
    // Release Date Label
    self.releaseDateLabel = [[UILabel alloc] init];
    self.releaseDateLabel.text = @"Aug 10, 2018";
    self.releaseDateLabel.font = [UIFont systemFontOfSize:10.0 weight:UIFontWeightSemibold];
    self.releaseDateLabel.textColor = [UIColor greenColor];
    self.releaseDateLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.releaseDateLabel];
    
    // Rating Label
    self.ratingLabel = [[UILabel alloc] init];
    self.ratingLabel.text = @"7.6";
    self.ratingLabel.textColor = [UIColor greenColor];
    self.ratingLabel.font = [UIFont systemFontOfSize:10.0];
    self.ratingLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.ratingLabel];
    
    // Description Label
    self.descriptionLabel = [[UILabel alloc] init];
    self.descriptionLabel.text = @"A bullied teenager turns to beauty pageants as a way to exact her revenge, with the help of a disgraced coach who so...";
    self.descriptionLabel.font = [UIFont systemFontOfSize:10.0];
    self.descriptionLabel.textColor = [UIColor whiteColor];
    self.descriptionLabel.numberOfLines = 0;
    [self.contentView addSubview:self.descriptionLabel];
    
    // HStackView for date and rating
    self.hStackView = [[UIStackView alloc] initWithArrangedSubviews:@[self.releaseDateLabel, self.ratingLabel]];
    self.hStackView.axis = UILayoutConstraintAxisHorizontal;
    self.hStackView.alignment = UIStackViewAlignmentCenter;
    self.hStackView.spacing = 10;
    [self.contentView addSubview:self.hStackView];
    
    // Load image asynchronously
//        [self loadImageWithURL:self.imageURL];
}

- (void)setupConstraints {
    // Set translatesAutoresizingMaskIntoConstraints to NO for all subviews
    for (UIView *view in @[self.movieTitleLabel, self.hStackView, self.descriptionLabel]) {
//        for (UIView *view in @[self.titleLabel, self.subtitleLabel, self.rectangleView, self.movieTitleLabel, self.hStackView, self.descriptionLabel]) {

        view.translatesAutoresizingMaskIntoConstraints = NO;
    }

    // Add AutoLayout constraints
    [NSLayoutConstraint activateConstraints:@[
        // Title label constraints
//        [self.titleLabel.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:10],
//        [self.titleLabel.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:20],
//        [self.titleLabel.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-20],
//        
//        // Subtitle label constraints
//        [self.subtitleLabel.topAnchor constraintEqualToAnchor:self.titleLabel.bottomAnchor constant:10],
//        [self.subtitleLabel.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:20],
//        [self.subtitleLabel.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-20],
        
        // Rectangle view constraints
//        [self.rectangleView.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:20],
//        [self.rectangleView.widthAnchor constraintEqualToConstant:182],
//        [self.rectangleView.heightAnchor constraintEqualToConstant:100],

        // Ajusta el tamaño de la imagen (equivalente a .font(.largeTitle) en SwiftUI)
//        [starImageView.heightAnchor constraintEqualToConstant:30].active = YES;

        // Movie title label constraints
        [self.movieTitleLabel.topAnchor constraintEqualToAnchor:self.rectangleView.bottomAnchor constant:10],
        [self.movieTitleLabel.centerXAnchor constraintEqualToAnchor:self.rectangleView.centerXAnchor],
        
        // HStackView constraints
        [self.hStackView.topAnchor constraintEqualToAnchor:self.movieTitleLabel.bottomAnchor constant:10],
        [self.hStackView.centerXAnchor constraintEqualToAnchor:self.rectangleView.centerXAnchor],
        
        // Description label constraints
        [self.descriptionLabel.topAnchor constraintEqualToAnchor:self.hStackView.bottomAnchor constant:10],
        [self.descriptionLabel.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:20],
        [self.descriptionLabel.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-20],
        [self.descriptionLabel.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:-10],
        [self.descriptionLabel.heightAnchor constraintEqualToConstant:56]
    ]];
}

- (void)loadImageWithURL:(NSString *)url {
    NSString *urlString = [APIConstant.shared.URLStringPoster stringByAppendingString:url];
    NSURL *imageURL = [NSURL URLWithString:urlString];
    
    // Load image asynchronously
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
        UIImage *image = [UIImage imageWithData:imageData];
        
        // Update UI on main thread
        dispatch_async(dispatch_get_main_queue(), ^{
            self.imageView = [[UIImageView alloc] initWithImage:image];
            if (self.imageView != nil) {
                self.imageView.contentMode = UIViewContentModeScaleAspectFit;
                [self.contentView addSubview:self.imageView];
                for (UIView *view in @[self.imageView]) {
                    view.translatesAutoresizingMaskIntoConstraints = NO;
                }
                [NSLayoutConstraint activateConstraints:@[
                    [self.imageView.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:20],
                    [self.imageView.widthAnchor constraintEqualToConstant:182],
                    [self.imageView.heightAnchor constraintEqualToConstant:100]
                ]];
            }
        });
    });
}

@end
