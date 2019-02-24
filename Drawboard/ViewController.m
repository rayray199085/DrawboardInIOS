//
//  ViewController.m
//  Drawboard
//
//  Created by Stephen Cao on 24/2/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

#import "ViewController.h"
#import "SCDrawView.h"
#define red 101
#define green 102
#define blue 103

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *redButton;
@property (weak, nonatomic) IBOutlet SCDrawView *drawView;
- (IBAction)sliderValueUpdate:(UISlider *)sender;
@property (weak, nonatomic) IBOutlet UISlider *slider;
- (IBAction)clearAllPath:(id)sender;
- (IBAction)deleteLastPath:(id)sender;
- (IBAction)changePathColor:(UIButton *)sender;
- (IBAction)saveDrawboardImage:(id)sender;
- (IBAction)erasePath:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self sliderValueUpdate:self.slider];
    self.drawView.pathColor = self.redButton.backgroundColor;
}

- (BOOL)prefersStatusBarHidden{
    return YES;
}

- (IBAction)sliderValueUpdate:(UISlider *)sender {
    self.drawView.pathWidth = sender.value;
}
- (IBAction)clearAllPath:(id)sender {
    [self.drawView.pathGroup removeAllObjects];
    [self.drawView setNeedsDisplay];
}

- (IBAction)deleteLastPath:(id)sender {
    [self.drawView.pathGroup removeLastObject];
    [self.drawView setNeedsDisplay];
}

- (IBAction)changePathColor:(UIButton *)sender {
    self.drawView.pathColor = sender.backgroundColor;
}

- (IBAction)saveDrawboardImage:(id)sender {
    UIGraphicsBeginImageContextWithOptions(self.drawView.bounds.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self.drawView.layer renderInContext:context];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIImageWriteToSavedPhotosAlbum(image, NULL, NULL, NULL);
    UIGraphicsEndImageContext();
}

- (IBAction)erasePath:(id)sender {
    self.drawView.pathColor = self.drawView.backgroundColor;
}
@end
