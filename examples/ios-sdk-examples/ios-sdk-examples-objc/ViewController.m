//
//  ViewController.m
//  ios-sdk-examples-objc
//
//  Created by Huy Dang on 01/02/2021.
//

#import "ViewController.h"
#import "GroundOverlayViewController.h"
#import <Map4dMap/Map4dMap.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *collectionsView;
@property (weak, nonatomic) IBOutlet MFMapView *mapView;
@property (weak, nonatomic) IBOutlet UIButton *modeButton;

@end

@implementation ViewController
{
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.navigationItem.title = @"Map4D iOS SDK Explore";
  [self addListeners];
}

- (void)addListeners {
  UITapGestureRecognizer *tapCollections = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapCollectionsView)];
  [_collectionsView addGestureRecognizer:tapCollections];
}

- (void)tapCollectionsView {
  UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Collection" bundle:nil];
  UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"CollectionViewController"];
  [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)changeMode:(id)sender {
  [_mapView enable3DMode:!_mapView.is3DMode];
  [_modeButton setTitle:(_mapView.is3DMode ? @"2D" : @"3D") forState:UIControlStateNormal];
}

@end


