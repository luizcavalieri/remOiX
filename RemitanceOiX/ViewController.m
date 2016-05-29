//
//  ViewController.m
//  RemitanceOiX
//
//  Created by Luiz cavalieri on 12/05/2016.
//  Copyright © 2016 The Interactive Hippo. All rights reserved.
//

#import "ViewController.h"
#import "AppState.h"
#import "AppConstant.h"


@import Firebase;
@import FirebaseDatabase;
@import FirebaseAuth;

@interface ViewController ()

@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];

    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}




@end
