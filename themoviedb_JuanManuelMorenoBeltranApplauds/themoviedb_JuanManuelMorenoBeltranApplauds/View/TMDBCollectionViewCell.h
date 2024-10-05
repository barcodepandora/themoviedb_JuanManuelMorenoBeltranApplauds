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

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *posterImageView;

- (void)configureWithMovie:(Movie *)movie;

@end
