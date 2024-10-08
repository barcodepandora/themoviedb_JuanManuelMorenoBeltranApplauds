//
//  TVShowViewController.m
//  themoviedb_JuanManuelMorenoBeltranApplauds
//
//  Created by Juan Manuel Moreno on 5/10/24.
//

#import "TVShowViewController.h"
#import "TVShow.h"
#import "APIRouter.h"

@implementation TVShowViewController

    TVShow *_movie;

- (instancetype)initWithTVShow:(TVShow *)movie {
    self = [super init];
    if (self) {
        _movie = movie;
        self.elements = @[@"Ma", @"Pa", @"Bro", @"Liz", @"Luz", @"Har", @"Chi"];
        [self setupViews];

    }
    return self;
}

- (void)setupViews {
    UIScreen *screen = [UIScreen mainScreen];
    [self loadImageWithURL:[_movie valueForKey:@"backdrop_path"] withFrame:CGRectMake(0, 0, screen.bounds.size.width, screen.bounds.size.height * 0.3) andRefreshCard:YES];
    [self setupCard];
}

- (void)setupCard {
    UIScreen *screen = [UIScreen mainScreen];
    
    UIView *redRectangle = [[UIView alloc] initWithFrame:CGRectMake(0, 164, screen.bounds.size.width, screen.bounds.size.height * 0.7)];
    redRectangle.backgroundColor = [UIColor blackColor];
    [self.view addSubview:redRectangle];
    
    UIView *blueRectangle = [[UIView alloc] initWithFrame:CGRectMake(100, screen.bounds.size.height * 0.19, screen.bounds.size.width * 0.72, screen.bounds.size.height * 0.72)];
    blueRectangle.backgroundColor = [UIColor colorWithRed:55/255.0 green:57/255.0 blue:54/255.0 alpha:1.0];
    blueRectangle.layer.cornerRadius = 15;
    [self.view addSubview:blueRectangle];
    
    UILabel *summary = [[UILabel alloc] initWithFrame:CGRectMake(20, screen.bounds.size.height * 0.02, screen.bounds.size.width, 50)];
    summary.text = @"Summary";
    summary.font = [UIFont systemFontOfSize:24];
    summary.textColor = [UIColor greenColor];
    summary.textAlignment = NSTextAlignmentLeft;
    [blueRectangle addSubview:summary];
    
    UILabel *textView = [[UILabel alloc] initWithFrame:CGRectMake(20, screen.bounds.size.height * 0.05, screen.bounds.size.width * 0.64, 50)];
    textView.text = [_movie valueForKey:@"name"];
    textView.font = [UIFont systemFontOfSize:24];
    textView.textAlignment = NSTextAlignmentLeft;
    [blueRectangle addSubview:textView];
    
    UILabel *brief = [[UILabel alloc] initWithFrame:CGRectMake(20, screen.bounds.size.height * 0.1, screen.bounds.size.width * 0.64, 50)];
    brief.text = [_movie valueForKey:@"overview"];
    brief.font = [UIFont systemFontOfSize:16];
    brief.textAlignment = NSTextAlignmentLeft;
    brief.numberOfLines = 5;
    [blueRectangle addSubview:brief];

    UILabel *createdBy = [[UILabel alloc] initWithFrame:CGRectMake(20, screen.bounds.size.height * 0.16, screen.bounds.size.width * 0.64, 50)];
    createdBy.text = @"Created by";
    createdBy.font = [UIFont systemFontOfSize:24];
    createdBy.textAlignment = NSTextAlignmentLeft;
    [blueRectangle addSubview:createdBy];
    
    UILabel *lastSeason = [[UILabel alloc] initWithFrame:CGRectMake(20, screen.bounds.size.height * 0.21, screen.bounds.size.width, 50)];
    lastSeason.text = @"LastSeason";
    lastSeason.font = [UIFont systemFontOfSize:24];
    lastSeason.textColor = [UIColor greenColor];
    lastSeason.textAlignment = NSTextAlignmentLeft;
    [blueRectangle addSubview:lastSeason];

    [self loadImageWithURL:[_movie valueForKey:@"poster_path"] withFrame:CGRectMake(129, screen.bounds.size.height * 0.48, 150, 258) andRefreshCard:NO];

    UIView *greenCircle = [[UIView alloc] initWithFrame:CGRectMake(screen.bounds.size.width * 0.5, screen.bounds.size.height * -0.036, 64, 64)];
    greenCircle.backgroundColor = [UIColor greenColor];
    greenCircle.layer.cornerRadius = 32;
    [blueRectangle addSubview:greenCircle];
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, screen.bounds.size.height * 0.5, screen.bounds.size.width, 50)];
    scrollView.showsHorizontalScrollIndicator = NO;
    [blueRectangle addSubview:scrollView];
    
//    UIView *horizontalStackView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screen.bounds.size.width, 50)];
//    [scrollView addSubview:horizontalStackView];
//
//    CGFloat x = 0;
//    for (NSString *element in self.elements) {
//        UIView *circle = [[UIView alloc] initWithFrame:CGRectMake(x, 0, 40, 40)];
//        circle.backgroundColor = [UIColor greenColor];
//        circle.layer.cornerRadius = 20;
//        [horizontalStackView addSubview:circle];
//
//        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
//        label.text = element;
//        label.font = [UIFont systemFontOfSize:24];
//        label.textAlignment = NSTextAlignmentCenter;
//        label.textColor = [UIColor whiteColor];
//        [circle addSubview:label];
//
//        x += 50;
//    }
//
//    scrollView.contentSize = CGSizeMake(x, 50);
}

- (void)loadImageWithURL:(NSString *)url withFrame:(CGRect)frame andRefreshCard:(BOOL)refresh {
    NSString *urlString = [APIConstant.shared.URLStringPoster stringByAppendingString:url];
    NSURL *imageURL = [NSURL URLWithString:urlString];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
        UIImage *image = [UIImage imageWithData:imageData];
        dispatch_async(dispatch_get_main_queue(), ^{
            UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
            if (imageView != nil) {
                imageView.contentMode = UIViewContentModeScaleAspectFit;
                imageView.translatesAutoresizingMaskIntoConstraints = NO; // Disable autoresizing masks
                UIScreen *screen = [UIScreen mainScreen];
                UIView *imageRectangle = [[UIView alloc] initWithFrame:frame];
                imageRectangle.backgroundColor = [UIColor blackColor];
                [imageRectangle addSubview:imageView];
                [self.view addSubview:imageRectangle];
                [imageView.topAnchor constraintEqualToAnchor:imageRectangle.topAnchor].active = YES;
                [imageView.bottomAnchor constraintEqualToAnchor:imageRectangle.bottomAnchor].active = YES;
                [imageView.leadingAnchor constraintEqualToAnchor:imageRectangle.leadingAnchor].active = YES;
                [imageView.trailingAnchor constraintEqualToAnchor:imageRectangle.trailingAnchor].active = YES;
                if (refresh == YES) {
                    [self setupCard];
                }
            }
        });
    });
}

@end
