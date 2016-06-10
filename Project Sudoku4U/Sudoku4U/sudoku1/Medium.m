//
//  Medium.m
//  sudoku1
//
//  Created by kmitfs2 on 9/26/14.
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "Medium.h"
#import "ViewController.h"
@implementation Medium
{
    NSMutableArray *sudoku;
@public NSTimer *timerObject;
    int countMedium;
    int countTimer;
}


@synthesize resultlbl;
@synthesize timerlbl;
@synthesize lbl1;
@synthesize txt2;
@synthesize lbl3;
@synthesize txt4;
@synthesize txt5;
@synthesize lbl6;
@synthesize txt7;
@synthesize lbl8;
@synthesize lbl9;
@synthesize txt10;
@synthesize txt11;
@synthesize lbl12;
@synthesize txt13;
@synthesize txt14;
@synthesize lbl15;
@synthesize txt16;


- (void)viewDidLoad
{
    [super viewDidLoad];
    countMedium=0;
    countTimer=60;
    
    txt2.keyboardType=UIKeyboardTypeNumberPad;
    txt4.keyboardType=UIKeyboardTypeNumberPad;
    txt5.keyboardType=UIKeyboardTypeNumberPad;
    txt7.keyboardType=UIKeyboardTypeNumberPad;
    txt10.keyboardType=UIKeyboardTypeNumberPad;
    txt11.keyboardType=UIKeyboardTypeNumberPad;
    txt13.keyboardType=UIKeyboardTypeNumberPad;
    txt14.keyboardType=UIKeyboardTypeNumberPad;
    txt16.keyboardType=UIKeyboardTypeNumberPad;
    
    
    
    timerObject = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(changetime) userInfo:nil repeats:YES];
    
}
-(void)changetime
{
    
    if(countTimer>=0)
    {
        self.timerlbl.text=[NSString stringWithFormat:@"Seconds left: %d",(int)countTimer];
        countTimer--;
    }
    else
        [timerObject invalidate];
    
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [txt2 resignFirstResponder];
    [txt4 resignFirstResponder];
    [txt5 resignFirstResponder];
    [txt7 resignFirstResponder];
    [txt10 resignFirstResponder];
    [txt11 resignFirstResponder];
    [txt13 resignFirstResponder];
    [txt14 resignFirstResponder];
    [txt16 resignFirstResponder];
}

-(IBAction)submit
{
    Medium *sud=[[Medium alloc]init];
    NSInteger boxes[16];
    sudoku=[NSMutableArray arrayWithObjects:lbl1.text,txt2.text,lbl3.text,txt4.text,txt5.text,lbl6.text,txt7.text,lbl8.text,lbl9.text,txt10.text,txt11.text,lbl12.text,txt13.text,txt14.text,lbl15.text,txt16.text, nil];
    
    for(int i=0;i<16;i++)
    {
        boxes[i]=[[sudoku objectAtIndex:i]intValue];
    }
    
    if ([sud checkrows:boxes]==YES && [sud checkcol:boxes]==YES)
        resultlbl.text=@"SOLVED";
    else
        resultlbl.text=@"FAILED";
    
    
}
-(IBAction)tryNew
{
    countTimer=60;
    countMedium++;
    
    if(countMedium == 1)
    {
        lbl1.text=@"1";
        lbl3.text=@"3";
        lbl6.text=@"3";
        lbl8.text=@"1";
        lbl9.text=@"3";
        lbl12.text=@"2";
        lbl15.text=@"3";   
    }
    else if(countMedium == 2)
    {
        lbl1.text=@"1";
        lbl3.text=@"3";
        lbl6.text=@"2";
        lbl8.text=@"1";
        lbl9.text=@"4";
        lbl12.text=@"3";
        lbl15.text=@"1";  
    }
    else if(countMedium == 3)
    {
        lbl1.text=@"2";
        lbl3.text=@"4";
        lbl6.text=@"3";
        lbl8.text=@"1";
        lbl9.text=@"1";
        lbl12.text=@"4";
        lbl15.text=@"1";   
    }
    else if(countMedium == 4)
    {
        lbl1.text=@"4";
        lbl3.text=@"3";
        lbl6.text=@"2";
        lbl8.text=@"4";
        lbl9.text=@"1";
        lbl12.text=@"3";
        lbl15.text=@"4";     
    }
    else if(countMedium == 5)
    {
        lbl1.text=@"1";
        lbl3.text=@"3";
        lbl6.text=@"3";
        lbl8.text=@"1";
        lbl9.text=@"4";
        lbl12.text=@"3";
        lbl15.text=@"2";
    }
    else if(countMedium == 6)
    {
        lbl1.text=@"2";
        lbl3.text=@"3";
        lbl6.text=@"4";
        lbl8.text=@"2";
        lbl9.text=@"4";
        lbl12.text=@"1";
        lbl15.text=@"4";
    }
    else if(countMedium == 7)
    {
        lbl1.text=@"3";
        lbl3.text=@"2";
        lbl6.text=@"2";
        lbl8.text=@"4";
        lbl9.text=@"2";
        lbl12.text=@"3";
        lbl15.text=@"1";
    }
    else if(countMedium == 8)
    {
        lbl1.text=@"4";
        lbl3.text=@"1";
        lbl6.text=@"1";
        lbl8.text=@"4";
        lbl9.text=@"1";
        lbl12.text=@"2";
        lbl15.text=@"4";
    }
    
    
    else
        countMedium=0;
}

-(BOOL)checkrows:(NSInteger *)array
{
    long sum;
    int i,j,k=0;
    for(i=0;i<4;i++)
    {
        sum=0;
        if(i>0)
            k=4*i;
        
        for(j=k;j<(k+4);j++)
        {
            sum=sum+array[j];
        }
        if(sum==10)
            continue;
        else
            return NO;
        
    }
    return YES;
    
}

-(BOOL)checkcol:(NSInteger *)array
{
    long sum;
    int i,j,k=0;
    for(i=0;i<4;i++)
    {
        k=0;
        sum=0;
        for(j=i;k<4;k++)
        {
            sum=sum+array[j];
            j+=4;
        }
        if(sum==10)
            continue;
        else
            return NO;
    }
    return YES;
}

-(void)viewDidUnload
{
    [super viewDidUnload];
    [self setLbl1:nil];
    [self setLbl3:nil];
    [self setTxt2:nil];
    [self setLbl3:nil];
    [self setTxt4:nil];
    [self setTxt5:nil];
    [self setLbl6:nil];
    [self setTxt7:nil];
    [self setLbl8:nil];
    [self setLbl9:nil];
    [self setTxt10:nil];
    [self setLbl12:nil];
    [self setTxt11:nil];
    [self setTxt13:nil];
    [self setTxt14:nil];
    [self setLbl15:nil];
    [self setTxt16:nil];
    [self setResultlbl:nil];
    [self setTimerlbl:nil];
    
}

@end

