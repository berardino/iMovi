#import <UIKit/UIKit.h>
#include <CoreLocation/CoreLocation.h>


@interface ViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate, CLLocationManagerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *longitude;
@property (weak, nonatomic) IBOutlet UILabel *latitude;
- (IBAction)clickTakeLocation:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)clickTakeAPicture:(UIButton *)sender;
@end
