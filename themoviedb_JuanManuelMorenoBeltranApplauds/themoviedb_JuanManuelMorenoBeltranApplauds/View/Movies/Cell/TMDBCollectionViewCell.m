//
//  TMDBCollectionViewCell.m
//  themoviedb_JuanManuelMorenoBeltranApplauds
//
//  Created by Juan Manuel Moreno on 5/10/24.
//

#import "TMDBCollectionViewCell.h"
#import "Movie.h"

@implementation TMDBCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialize the title label and poster image view
        self.posterImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height - 30)];
        [self.contentView addSubview:self.posterImageView];
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, frame.size.height - 30, frame.size.width, 30)];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.titleLabel];
    }
    return self;
}

// Configure the cell with movie data
- (void)configureWithMovie:(Movie *)movie {
    self.titleLabel.text = [movie valueForKey:@"title"];
    
    // Assuming you have a method to fetch image data from the poster path
    // For simplicity, you can use a placeholder image
//    self.posterImageView.image = [UIImage imageNamed:@"placeholder"];
    // You can asynchronously load images from the movie.poster_path if needed
}

@end
