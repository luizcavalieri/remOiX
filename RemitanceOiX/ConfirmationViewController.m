//
//  ConfirmationViewController.m
//  RemitanceOiX
//
//  Created by Luiz cavalieri on 31/05/2016.
//  Copyright © 2016 The Interactive Hippo. All rights reserved.
//

#import "ConfirmationViewController.h"

@interface ConfirmationViewController ()

@end

@implementation ConfirmationViewController

@synthesize currentClient, currentExchange, lblReferenceId, lblAmountTotalPayment, currentReceiver;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [lblAmountTotalPayment setText:[NSString stringWithFormat:@"Amount: AUD%0.2f", [currentExchange totalToPay]]];
    [lblReferenceId setText:[NSString stringWithFormat:@"Test: %@", [currentReceiver name]]];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
