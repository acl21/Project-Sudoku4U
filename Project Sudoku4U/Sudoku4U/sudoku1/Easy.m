//
//  Easy.m
//  sudoku1
//
//  Created by kmitfs2 on 9/26/14.
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//
#import "ViewController.h"
#import "Easy.h"

@implementation Easy
{
    NSMutableArray *sudoku;
    @public NSTimer *timerObject;
    int countEasy;
    int countTimer;
}
@synthesize txt2;
@synthesize lbl1;
@synthesize lbl3;
@synthesize txt4;
@synthesize txt5;
@synthesize lbl6;
@synthesize txt7;
@synthesize lbl8;
@synthesize lbl9;
@synthesize lbl10;
@synthesize txt11;
@synthesize txt12;
@synthesize txt14;
@synthesize lbl16;
@synthesize txt15;
@synthesize lbl13;
@synthesize timerlbl;
@synthesize resultlbl;

- (void)viewDidLoad
{
    countEasy=0;
    countTimer=30;
    
    txt2.keyboardType=UIKeyboardTypeNumberPad;
    txt4.keyboardType=UIKeyboardTypeNumberPad;
    txt5.keyboardType=UIKeyboardTypeNumberPad;
    txt7.keyboardType=UIKeyboardTypeNumberPad;
    txt11.keyboardType=UIKeyboardTypeNumberPad;
    txt12.keyboardType=UIKeyboardTypeNumberPad;
    txt14.keyboardType=UIKeyboardTypeNumberPad;
    txt15.keyboardType=UIKeyboardTypeNumberPad;
    
    [super viewDidLoad];
    
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
    [txt12 resignFirstResponder];
    [txt11 resignFirstResponder];
    [txt14 resignFirstResponder];
    [txt15 resignFirstResponder];
    
}

-(IBAction)submit
{
    Easy *sud=[[Easy alloc]init];
    NSInteger boxes[16];
    sudoku=[NSMutableArray arrayWithObjects:lbl1.text,txt2.text,lbl3.text,txt4.text,txt5.text,lbl6.text,txt7.text,lbl8.text,lbl9.text,lbl10.text,txt11.text,txt12.text,lbl13.text,txt14.text,txt15.text,lbl16.text, nil];
    
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
    countTimer=30;
    countEasy++;
    
    if(countEasy == 1)
    {
        lbl1.text=@"1";
        lbl3.text=@"3";
        lbl6.text=@"3";
        lbl8.text=@"1";
        lbl9.text=@"3";
        lbl10.text=@"1";
        lbl13.text=@"2";
        lbl16.text=@"3";
    }
    else if(countEasy == 2)
    {
        lbl1.text=@"3";
        lbl3.text=@"2";
        lbl6.text=@"4";
        lbl8.text=@"1";
        lbl9.text=@"4";
        lbl10.text=@"2";
        lbl13.text=@"1";
        lbl16.text=@"2";
    }
    else if(countEasy == 3)
    {
        lbl1.text=@"2";
        lbl3.text=@"4";
        lbl6.text=@"3";
        lbl8.text=@"1";
        lbl9.text=@"1";
        lbl10.text=@"2";
        lbl13.text=@"3";
        lbl16.text=@"2";
    }
    else if(countEasy == 4)
    {
        lbl1.text=@"1";
        lbl3.text=@"3";
        lbl6.text=@"2";
        lbl8.text=@"1";
        lbl9.text=@"4";
        lbl10.text=@"1";
        lbl13.text=@"2";
        lbl16.text=@"4";
    }
    else if(countEasy == 5)
    {
        lbl1.text=@"2";
        lbl3.text=@"3";
        lbl6.text=@"4";
        lbl8.text=@"2";
        lbl9.text=@"4";
        lbl10.text=@"3";
        lbl13.text=@"1";
        lbl16.text=@"3";
    }
    else if(countEasy == 6)
    {
        lbl1.text=@"3";
        lbl3.text=@"2";
        lbl6.text=@"2";
        lbl8.text=@"4";
        lbl9.text=@"2";
        lbl10.text=@"1";
        lbl13.text=@"4";
        lbl16.text=@"2";
    }
    else if(countEasy == 7)
    {
        lbl1.text=@"1";
        lbl3.text=@"3";
        lbl6.text=@"3";
        lbl8.text=@"1";
        lbl9.text=@"4";
        lbl10.text=@"2";
        lbl13.text=@"3";
        lbl16.text=@"4";
    }
    else if(countEasy == 8)
    {
        lbl1.text=@"4";
        lbl3.text=@"1";
        lbl6.text=@"1";
        lbl8.text=@"4";
        lbl9.text=@"1";
        lbl10.text=@"4";
        lbl13.text=@"2";
        lbl16.text=@"1";
    }
    else
        countEasy=0;
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
    [self setLbl1:nil];
    [self setTxt2:nil];
    [self setLbl3:nil];
    [self setTxt4:nil];
    [self setTxt5:nil];
    [self setLbl6:nil];
    [self setTxt7:nil];
    [self setLbl8:nil];
    [self setLbl9:nil];
    [self setLbl10:nil];
    [self setTxt11:nil];
    [self setTxt12:nil];
    [self setLbl13:nil];
    [self setTxt14:nil];
    [self setTxt15:nil];
    [self setLbl16:nil];
    [self setTimerlbl:nil];
    [self setResultlbl:nil];
    [super viewDidUnload];
}
@end
