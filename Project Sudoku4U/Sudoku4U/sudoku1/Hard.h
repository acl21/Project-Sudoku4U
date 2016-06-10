//
//  Hard.h
//  sudoku1
//
//  Created by kmitfs2 on 9/26/14.
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//
#import "ViewController.h"
#import <UIKit/UIKit.h>

@interface Hard : UIViewController
-(BOOL)checkrows:(NSInteger *)array;
-(BOOL)checkcol:(NSInteger *)array;
-(IBAction)submit;
@property (strong, nonatomic) IBOutlet UILabel *resultlbl;
@property (strong, nonatomic) IBOutlet UITextField *txt1;
@property (strong, nonatomic) IBOutlet UILabel *timerlbl;
@property (strong, nonatomic) IBOutlet UITextField *txt2;
@property (strong, nonatomic) IBOutlet UITextField *txt3;
@property (strong, nonatomic) IBOutlet UILabel *lbl4;
@property (strong, nonatomic) IBOutlet UILabel *lbl5;
@property (strong, nonatomic) IBOutlet UITextField *txt6;
@property (strong, nonatomic) IBOutlet UITextField *txt7;
@property (strong, nonatomic) IBOutlet UITextField *txt8;
@property (strong, nonatomic) IBOutlet UITextField *txt9;
@property (strong, nonatomic) IBOutlet UITextField *txt10;
@property (strong, nonatomic) IBOutlet UITextField *txt15;
@property (strong, nonatomic) IBOutlet UILabel *lbl13;
@property (strong, nonatomic) IBOutlet UITextField *txt14;
@property (strong, nonatomic) IBOutlet UITextField *txt16;

@property (strong, nonatomic) IBOutlet UILabel *lbl12;
@property (strong, nonatomic) IBOutlet UITextField *txt11;

@end
