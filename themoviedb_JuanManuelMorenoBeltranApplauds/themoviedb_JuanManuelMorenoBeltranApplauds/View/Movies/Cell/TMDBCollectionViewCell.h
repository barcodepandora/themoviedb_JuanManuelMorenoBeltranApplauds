//
//  TMDBCollectionViewCell.h
//  themoviedb_JuanManuelMorenoBeltranApplauds
//
//  Created by Juan Manuel Moreno on 5/10/24.
//

#ifndef TMDBCollectionViewCell_h
#define TMDBCollectionViewCell_h


#endif /* TMDBCollectionViewCell_h */

#import <UIKit/UIKit.h>
#import "Movie.h"

@interface TMDBCollectionViewCell : UICollectionViewCell

//@property (nonatomic, strong) UILabel *nameLabel;
//@property (nonatomic, strong) UIImageView *posterImageView;

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *subnameLabel;
//@property (nonatomic, strong) UIView *rectangleView;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *movienameLabel;
@property (nonatomic, strong) UILabel *releaseDateLabel;
@property (nonatomic, strong) UILabel *ratingLabel;
@property (nonatomic, strong) UILabel *descriptionLabel;
@property (nonatomic, strong) UIStackView *hStackView;

- (void)configureWithMovie:(Movie *)movie;

@end
