//
//  FinalViewController.m
//  RemitanceOiX
//
//  Created by Luiz cavalieri on 10/06/2016.
//  Copyright © 2016 The Interactive Hippo. All rights reserved.
//

#import "FinalViewController.h"

@import FirebaseAuth;
@import FirebaseDatabase;
@import FirebaseStorage;

@interface FinalViewController ()

@end

@implementation FinalViewController

@synthesize currentExchange, currentClient, currentReceiver;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if([[segue identifier] isEqualToString:SeguesBacktoInitial]){
        
        ExchangeViewController *exchangeViewController = (ExchangeViewController *)[segue destinationViewController];
        
        [exchangeViewController setCurrentExchange:currentExchange];
        [exchangeViewController setCurrentClient:currentClient];
        [exchangeViewController setCurrentReceiver:currentReceiver];
        
    }

}


- (IBAction)btnReturnMainScreen:(id)sender {
    [self performSegueWithIdentifier:SeguesBacktoInitial sender:nil];
    
}
@end
