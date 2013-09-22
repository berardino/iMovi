#import "ViewController.h"
#import <Foundation/NSArray.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()

@end

@implementation ViewController

CLLocationManager *locationManager;

- (void)viewDidLoad {
    [super viewDidLoad];
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)clickTakeAPicture:(UIButton *)sender {
    
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                              message:@"Device has no camera"
                                                             delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles: nil];
        
        [myAlertView show];
        
    }else {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;

        [self presentViewController:picker animated:YES completion:NULL];
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    [self.imageView setImage:image];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)clickTakeLocation:(UIButton *)sender {
    [locationManager startUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                          message:@"Unable to get the location"
                                                         delegate:nil
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles: nil];
    
    [myAlertView show];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    CLLocation *last = [locations lastObject];
    self.longitude.text = [NSString stringWithFormat:@"%.5f", last.coordinate.longitude ];
    self.latitude.text = [NSString stringWithFormat:@"%.5f", last.coordinate.latitude ];
    [locationManager stopUpdatingLocation];
}

@end
