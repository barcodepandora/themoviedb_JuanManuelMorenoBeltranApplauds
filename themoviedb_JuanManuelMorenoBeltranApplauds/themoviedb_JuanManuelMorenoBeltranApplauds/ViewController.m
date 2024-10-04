//
//  ViewController.m
//  themoviedb_JuanManuelMorenoBeltranApplauds
//
//  Created by Juan Manuel Moreno on 4/10/24.
//

#import "ViewController.h"

#import "ViewController.h"
#import "TMDBViewController.h"

@implementation ViewController
- (IBAction)bGo:(id)sender {
    [self.navigationController pushViewController:[[TMDBViewController alloc] init] animated:YES];
    NSLog(@"Go");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
}

//- (IBAction)go:(id)sender {
//    [self.navigationController pushViewController:[[TMDBViewController alloc] init] animated:YES];
//}

@end
