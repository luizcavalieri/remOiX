//
//  FormController.h
//  RemitanceOiX
//
//  Created by Luiz cavalieri on 13/05/2016.
//  Copyright © 2016 The Interactive Hippo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FormController : UIViewController

@property (weak, nonatomic) IBOutlet UITableViewCell *uiTblViewPassword;
@property (weak, nonatomic) IBOutlet UITableViewCell *uitblViewPhone;
@property (weak, nonatomic) IBOutlet UITableViewCell *uiTblViewEmail;
@property (weak, nonatomic) IBOutlet UITableViewCell *uiTblViewName;


@property (weak, nonatomic) IBOutlet UITextField *tbxPassword;
@property (weak, nonatomic) IBOutlet UITextField *tbxPhone;
@property (weak, nonatomic) IBOutlet UITextField *tbxEmail;
@property (weak, nonatomic) IBOutlet UITextField *tbxName;

@property NSArray *cells;

@end
