//
//  Easy.h
//  sudoku1
//
//  Created by kmitfs2 on 9/26/14.
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface Easy : UIViewController
-(BOOL)checkrows:(NSInteger *)array;
-(BOOL)checkcol:(NSInteger *)array;
@property (strong, nonatomic) IBOutlet UITextField *txt2;
@property (strong, nonatomic) IBOutlet UILabel *lbl1;
@property (strong, nonatomic) IBOutlet UILabel *lbl3;
@property (strong, nonatomic) IBOutlet UITextField *txt4;
@property (strong, nonatomic) IBOutlet UITextField *txt5;
@property (strong, nonatomic) IBOutlet UILabel *lbl6;
@property (strong, nonatomic) IBOutlet UITextField *txt7;
@property (strong, nonatomic) IBOutlet UILabel *lbl8;
@property (strong, nonatomic) IBOutlet UILabel *lbl9;
@property (strong, nonatomic) IBOutlet UILabel *lbl10;
@property (strong, nonatomic) IBOutlet UITextField *txt11;
@property (strong, nonatomic) IBOutlet UITextField *txt12;
@property (strong, nonatomic) IBOutlet UITextField *txt14;
@property (strong, nonatomic) IBOutlet UILabel *lbl16;
@property (strong, nonatomic) IBOutlet UITextField *txt15;

@property (strong, nonatomic) IBOutlet UILabel *lbl13;
@property (strong, nonatomic) IBOutlet UILabel *timerlbl;
@property (strong, nonatomic) IBOutlet UILabel *resultlbl;
-(IBAction)submit;
@end
