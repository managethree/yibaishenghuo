//
//  GWViewController.m
//  SnowFlow
//
//  Created by 木木 on 15-9-22.
//  Copyright (c) 2015年 Alibaba. All rights reserved.
//

#import "GWViewController.h"

@interface GWViewController ()

@end

@implementation GWViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIImageView*imageview=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 480)];
   imageview.image=[UIImage imageNamed:@"back.png"];
    [self.view addSubview:imageview];
    NSTimer *snowtimer=[NSTimer scheduledTimerWithTimeInterval:0.2f target:self selector:@selector(snow) userInfo:nil repeats:YES];
   // NSTimer*birdtimer=[NSTimer scheduledTimerWithTimeInterval:3.0f target:self selector:@selector(bird) userInfo:nil repeats:YES];
    [snowtimer fire];
    [self bird];
    //[birdtimer fire];
    //[self snow];一个雪花落下
}
-(void)snow
{
    
    //创建一个雪花,大小25*25,位置随机x(-50,370)y(-50)
    /*
     arc4random()%n
     arc4random()%421-50
     
     */
    UIImageView*snowview=[[UIImageView alloc]initWithFrame:CGRectMake(arc4random()%320,-50,25,25)];
    snowview.image=[UIImage imageNamed:@"snow.png"];
    [self.view addSubview:snowview];
    [UIView beginAnimations:nil context:(__bridge void *)(snowview)];
    [UIView setAnimationDuration:3.0f];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
    snowview.frame=CGRectMake(arc4random()%421-50,400+arc4random()%80,25, 25);
    //snowview.alpha=0.1;
    [UIView commitAnimations];
}
//雪花下落到指定位置后变透明
-(void)animationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context
{
//先找到雪花
    UIImageView*snow=(UIImageView*)context;
    //改变透明度
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1.0f];
    snow.alpha=0.0;
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(an:fi:co:)];
    [UIView commitAnimations];
}
//移除雪花

-(void)an:(NSString *)animationID fi:(NSNumber *)finished co:(void *)context
{
    UIImageView*snow=(UIImageView*)context;
    [snow removeFromSuperview];

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)bird
{
    UIImageView*birdview=[[UIImageView alloc]initWithFrame:CGRectMake(-100,
       arc4random()%150-20, 60, 50)];
    birdview.image=[UIImage imageNamed:@"bird,png"];
    [self.view addSubview:birdview];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:3.0f];
    birdview.frame=CGRectMake(320, arc4random()%200-20, 60, 50);
    [UIView commitAnimations];
}

@end
