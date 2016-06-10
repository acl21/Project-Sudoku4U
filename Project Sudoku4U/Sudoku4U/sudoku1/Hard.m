//
//  Hard.m
//  sudoku1
//
//  Created by kmitfs2 on 9/26/14.
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "Hard.h"

@implementation Hard
{
    NSMutableArray *sudoku;
@public NSTimer *timerObject;
    int countHard;
    int countTimer;
}
@synthesize resultlbl;
@synthesize txt1;
@synthesize timerlbl;
@synthesize txt2;
@synthesize txt3;
@synthesize lbl4;
@synthesize lbl5;
@synthesize txt6;
@synthesize txt7;
@synthesize txt8;
@synthesize txt9;
@synthesize txt10;
@synthesize txt15;
@synthesize lbl13;
@synthesize txt14;
@synthesize txt16;
@synthesize lbl12;
@synthesize txt11;



- (void)viewDidLoad
{
    countHard=0;
    countTimer=100;
    
    txt1.keyboardType=UIKeyboardTypeNumberPad;
    txt2.keyboardType=UIKeyboardTypeNumberPad;
    txt3.keyboardType=UIKeyboardTypeNumberPad;
    txt6.keyboardType=UIKeyboardTypeNumberPad;
    txt7.keyboardType=UIKeyboardTypeNumberPad;
    txt8.keyboardType=UIKeyboardTypeNumberPad;
    txt9.keyboardType=UIKeyboardTypeNumberPad;
    txt10.keyboardType=UIKeyboardTypeNumberPad;
    txt11.keyboardType=UIKeyboardTypeNumberPad;
    txt14.keyboardType=UIKeyboardTypeNumberPad;
    txt15.keyboardType=UIKeyboardTypeNumberPad;
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
    [txt1 resignFirstResponder];
    [txt2 resignFirstResponder];
    [txt3 resignFirstResponder];
    [txt6 resignFirstResponder];
    [txt7 resignFirstResponder];
    [txt8 resignFirstResponder];
    [txt9 resignFirstResponder];
    [txt10 resignFirstResponder];
    [txt11 resignFirstResponder];
    [txt14 resignFirstResponder];
    [txt15 resignFirstResponder];
    [txt16 resignFirstResponder];
}

-(IBAction)submit
{
    Hard *sud=[[Hard alloc]init];
    NSInteger boxes[16];
    sudoku=[NSMutableArray arrayWithObjects:txt1.text,txt2.text,txt3.text,lbl4.text,lbl5.text,txt6.text,txt7.text,txt8.text,txt9.text,txt10.text,txt11.text,lbl12.text,lbl13.text,txt14.text,txt15.text,txt16.text, nil];
    
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
    countTimer=100;
    countHard++;
    
    if(countHard == 1)
    {
        lbl4.text=@"3";
        lbl5.text=@"2";
        lbl12.text=@"4";
        lbl13.text=@"1";
        
    }
    else if(countHard == 2)
    {
        lbl4.text=@"4";
        lbl5.text=@"4";
        lbl12.text=@"2";
        lbl13.text=@"2";
        
    }
    else if(countHard == 3)
    {
        lbl4.text=@"3";
        lbl5.text=@"4";
        lbl12.text=@"4";
        lbl13.text=@"3";
        
        
    }
    else if(countHard == 4)
    {
        lbl4.text=@"2";
        lbl5.text=@"1";
        lbl12.text=@"4";
        lbl13.text=@"2";
        
    }
    else if(countHard == 5)
    {
        lbl4.text=@"2";
        lbl5.text=@"1";
        lbl12.text=@"3";
        lbl13.text=@"2";
        
    }
    else if(countHard == 6)
    {
        lbl4.text=@"3";
        lbl5.text=@"3";
        lbl12.text=@"2";
        lbl13.text=@"2";
        
    }
    else if(countHard == 7)
    {
        lbl4.text=@"3";
        lbl5.text=@"2";
        lbl12.text=@"2";
        lbl13.text=@"4";
        
    }
    else if(countHard == 8)
    {
        lbl4.text=@"3";
        lbl5.text=@"4";
        lbl12.text=@"4";
        lbl13.text=@"3";
        
    }
    else
        countHard=0;
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
    [self setTxt1:nil];
    [self setTxt2:nil];
    [self setTxt3:nil];
    [self setLbl4:nil];
    [self setLbl5:nil];
    [self setTxt6:nil];
    [self setTxt7:nil];
    [self setTxt8:nil];
    [self setTxt9:nil];
    [self setTxt10:nil];
    [self setTxt11:nil];
    [self setLbl12:nil];
    [self setLbl13:nil];
    [self setTxt14:nil];
    [self setTxt15:nil];
    [self setTxt16:nil];
    [self setTimerlbl:nil];
    [self setResultlbl:nil];
    [super viewDidUnload];
}



@end
