//
//  FormController.m
//  RemitanceOiX
//
//  Created by Luiz cavalieri on 13/05/2016.
//  Copyright © 2016 The Interactive Hippo. All rights reserved.
//

#import "FormController.h"

@interface FormController ()

@end

@implementation FormController

@synthesize uiTblViewName, uiTblViewEmail, uitblViewPhone, uiTblViewPassword, tbxName, tbxEmail, tbxPhone, tbxPassword, cells;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
  
    self.cells = [NSArray arrayWithObjects:uiTblViewName, uiTblViewEmail, uitblViewPhone, uiTblViewPassword, nil];
    
    for(UITableViewCell * cell in cells)
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    

}

-(NSInteger)numberOfSectionsInTableView: (UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [cells count];
}

- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [cells objectAtIndex:indexPath.row];
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
