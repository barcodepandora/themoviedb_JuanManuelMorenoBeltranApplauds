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

- (void)configureWithMovie:(Movie *)movie {
    if (self) {
        [self setupViews:movie];
        [self setupConstraints];
    }
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    return self;
}

- (void)setupViews:(Movie *)movie {
//    starImageView.tintColor = [UIColor yellowColor];
//    [self loadImageWithURL:[movie valueForKey:@"poster_path"]];
//    [mainStackView addArrangedSubview:starImageView];

    // Movie Title Label
    self.movieTitleLabel = [[UILabel alloc] init];
//    NSLog(@"Movie Title: %@", [movie valueForKey:@"title"]);
    self.movieTitleLabel.text = [movie valueForKey:@"title"]; //@"Insatiable";
    self.movieTitleLabel.font = [UIFont boldSystemFontOfSize:13.0];
    self.movieTitleLabel.textColor = [UIColor greenColor];
    self.movieTitleLabel.textAlignment = NSTextAlignmentLeft;
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
    self.descriptionLabel.text = [movie valueForKey:@"overview"];
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
    
    [self loadImageWithURL:[movie valueForKey:@"poster_path"]];
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
//        [self.movieTitleLabel.topAnchor constraintEqualToAnchor:self.rectangleView.bottomAnchor constant:10],
//        [self.movieTitleLabel.centerXAnchor constraintEqualToAnchor:self.rectangleView.centerXAnchor],
        
        // HStackView constraints
        [self.hStackView.topAnchor constraintEqualToAnchor:self.movieTitleLabel.bottomAnchor constant:10],
//        [self.hStackView.centerXAnchor constraintEqualToAnchor:self.rectangleView.centerXAnchor],
        
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
//                    [self.imageView.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:20],
                    [self.imageView.widthAnchor constraintEqualToConstant:200],
                    [self.imageView.heightAnchor constraintEqualToConstant:220]
                ]];
            }
        });
    });
}

@end
