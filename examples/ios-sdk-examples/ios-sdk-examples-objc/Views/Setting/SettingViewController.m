//
//  SettingViewController.m
//  ios-sdk-examples-objc
//
//  Created by iMacbook on 2/2/21.
//

#import "SettingViewController.h"
#import <Map4dMap/Map4dMap.h>
#import <CoreLocation/CoreLocation.h>

@interface SettingViewController ()

@property (weak, nonatomic) IBOutlet UIButton *titleButton;
@property (weak, nonatomic) IBOutlet MFMapView *mapView;

@end

@interface SettingViewController(MFMapViewDelegate) <MFMapViewDelegate>
@end

@implementation SettingViewController {
  bool isCurrentTime;
  enum Province : NSUInteger {
      hanoi,
      danang,
      hcm
  } province;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  [[self navigationItem] setTitle: @"SETTING"];
  [_mapView setDelegate: self];
  isCurrentTime = YES;
}
- (IBAction)enableMylocation:(id)sender {
  [_mapView setMyLocationEnabled: YES];
  [[_mapView settings] setMyLocationButton: YES];
}

- (IBAction)didTapMode:(id)sender {
  [_mapView enable3DMode: ![_mapView is3DMode]];
}

- (IBAction)didTapMove:(id)sender {
  CLLocationCoordinate2D toHanoi = CLLocationCoordinate2DMake(21.05039610950348, 105.82528557836378);
  CLLocationCoordinate2D toDanang = CLLocationCoordinate2DMake(16.074276600711926, 108.22425964117832);
  CLLocationCoordinate2D toHcm = CLLocationCoordinate2DMake(10.772135138352994, 106.705807305434);
  if (province == hanoi) {
    province = danang;
  }
  else if (province == danang) {
    province = hcm;
  }
  else if (province == hcm){
    province = hanoi;
  }
  switch (province) {
    case 0:
      [_mapView moveCamera:[MFCameraUpdate setTarget:toHanoi]];
      break;
    case 1:
      [_mapView moveCamera: [MFCameraUpdate setTarget:toDanang]];
      break;
    case 2:
      [_mapView moveCamera: [MFCameraUpdate setTarget:toHcm]];
      break;
  }
}

- (IBAction)didTapAnimate:(id)sender {
  CLLocationCoordinate2D toHanoi = CLLocationCoordinate2DMake(21.05039610950348, 105.82528557836378);
  CLLocationCoordinate2D toDanang = CLLocationCoordinate2DMake(16.074276600711926, 108.22425964117832);
  CLLocationCoordinate2D toHcm = CLLocationCoordinate2DMake(10.772135138352994, 106.705807305434);
  if (province == hanoi) {
    province = danang;
  }
  else if (province == danang) {
    province = hcm;
  }
  else if (province == hcm){
    province = hanoi;
  }
  switch (province) {
    case 0:
      [_mapView animateCamera:[MFCameraUpdate setTarget:toHanoi]];
      break;
    case 1:
      [_mapView animateCamera: [MFCameraUpdate setTarget:toDanang]];
      break;
    case 2:
      [_mapView animateCamera: [MFCameraUpdate setTarget:toHcm]];
      break;
  }
}

- (IBAction)didTapSetTime:(id)sender {
  isCurrentTime = !isCurrentTime;
  if (isCurrentTime) {
    NSString *isoDate = @"2020-04-14T10:44:00+0000";
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat: @"yyyy-MM-dd'T'HH:mm:ssZ"];
    [_mapView setTime: [dateFormat dateFromString:isoDate]];
  }
  else {
    NSString *isoDate = @"1990-04-14T10:44:00+0000";
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat: @"yyyy-MM-dd'T'HH:mm:ssZ"];
    [_mapView setTime: [dateFormat dateFromString:isoDate]];
  }
  
}

@end

@implementation SettingViewController(MFMapViewDelegate)
- (void)mapView:(MFMapView *)mapView didTapAtCoordinate:(CLLocationCoordinate2D)coordinate {
  NSString *str = [NSString stringWithFormat: @"did tap At: %f, %f", coordinate.latitude, coordinate.longitude];
  [_titleButton setTitle: str forState: UIControlStateNormal];
}

- (void)mapView:(MFMapView *)mapView willMove:(BOOL)gesture {
  [_titleButton setTitle: @"gesture" forState: UIControlStateNormal];
}

- (void)mapView:(MFMapView *)mapView movingCameraPosition:(MFCameraPosition *)position {
  NSString *str = [NSString stringWithFormat: @"moving %f, %f", position.target.latitude, position.target.longitude];
  [_titleButton setTitle: str forState: UIControlStateNormal];
}

@end
