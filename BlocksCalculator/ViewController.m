//
//  ViewController.m
//  BlocksCalculator
//
//  Created by Umut Kanbak on 7/23/13.
//  Copyright (c) 2013 Umut Kanbak. All rights reserved.
//

#import "ViewController.h"


//typedef NSInteger(^mathType)(NSInteger, NSInteger);
//mathType add=^(NSInteger int1, NSInteger int2){return int1+int2;};
//mathType subtract=^(NSInteger int1, NSInteger int2){return int1-int2;};

/*
 NSInteger (^add)(NSInteger,NSInteger)=^(NSInteger int1, NSInteger int2){return int1+int2;};
 
 
 NSInteger add(int int1, int int2)
 {
 return int1+int2;
 }
 */
@interface ViewController ()
{
    __weak IBOutlet UITextField *textField1;
    __weak IBOutlet UITextField *textField2;
    __weak IBOutlet UILabel *label;
    __weak IBOutlet UILabel *int1Label;
    __weak IBOutlet UILabel *int2Label;
    
    
}
- (IBAction)calculate:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad

{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)calculateNumber:(NSInteger)int1 toNumber:(NSInteger)int2 usingBlock:(NSInteger (^) (NSInteger, NSInteger)) mathBlock
{
    return mathBlock(int1,int2);
    //return int1+int2;
}

- (IBAction)calculate:(UIButton *)sender {
    //NSInteger newNumber=add(textField1.text.intValue, textField2.text.intValue);
    //NSInteger newNumber = [self calculateNumber:textField1.text.intValue toNumber:textField2.text.intValue];
    NSInteger newNumber;
    
    
    if (sender.tag==0)
    {
        newNumber = [self calculateNumber:textField1.text.intValue
                                 toNumber:textField2.text.intValue
                               usingBlock:^NSInteger (NSInteger int1, NSInteger int2)
        {
            return int1+int2;
        }];
        [UIView animateWithDuration:1.5 animations:^{
            self.view.backgroundColor=[UIColor orangeColor];
        } completion:^(BOOL finished){
            NSLog(@"animation finished");
        }];
    }
    if (sender.tag==1)
    {
        newNumber = [self calculateNumber:textField1.text.intValue
                                 toNumber:textField2.text.intValue
                               usingBlock:^NSInteger (NSInteger int1, NSInteger int2)
        {
            return int1-int2;
        }];
        [UIView animateWithDuration:1.5 animations:^{
            self.view.backgroundColor=[UIColor magentaColor];
        } completion:^(BOOL finished){
            NSLog(@"animation finished");
        }];
        
        
    }
    if(sender.tag==2)
    {
        newNumber = [self calculateNumber:textField1.text.intValue
                                 toNumber:textField2.text.intValue
                               usingBlock:^NSInteger (NSInteger int1, NSInteger int2)
                     {
                         return int1*int2;
                     }];
        [UIView animateWithDuration:1.5 animations:^{
            self.view.backgroundColor=[UIColor yellowColor];
        } completion:^(BOOL finished){
            NSLog(@"animation finished");
        }];
        
        
    }
    else if (sender.tag==3)
    {
        newNumber = [self calculateNumber:textField1.text.intValue
                                 toNumber:textField2.text.intValue
                               usingBlock:^NSInteger (NSInteger int1, NSInteger int2)
                     {
                         return int1/int2;
                     }];
        
        [UIView animateWithDuration:1.5 animations:^{
            self.view.backgroundColor=[UIColor greenColor];
        } completion:^(BOOL finished){
            NSLog(@"animation finished");
        }];
        
    }
            
    
    int1Label.text=textField1.text;
    int2Label.text=textField2.text;
    label.text=[NSString stringWithFormat:@"= %i",newNumber];
            
    }
    
@end
