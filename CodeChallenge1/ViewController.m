//
//  ViewController.m
//  CodeChallenge1
//
//  Created by Yi-Chin Sun on 1/9/15.
//  Copyright (c) 2015 Yi-Chin Sun. All rights reserved.
//

#import "ViewController.h"
#import "WebViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITextField *firstOperandField;
@property (strong, nonatomic) IBOutlet UITextField *secondOperandField;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *webButton;

@property int answer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webButton.enabled = NO;
}

- (IBAction)onCalculateButtonTapped:(id)sender
{
    [self.view endEditing:YES];
    self.answer = [self.firstOperandField.text intValue] * [self.secondOperandField.text intValue];
    self.navigationItem.title = [NSString stringWithFormat:@"%i", self.answer];
    if ((self.answer % 5) == 0) //checks if answer is divisible by 5
    {
        self.webButton.enabled = YES;
    }
    else
    {
        self.webButton.enabled = NO;
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    WebViewController *vc = segue.destinationViewController;
    vc.navigationItem.title = [NSString stringWithFormat:@"%i", self.answer];

}


@end
