//
//  ViewController.m
//  p05-Depo
//
//  Created by 米拉 on 3/25/17.
//  Copyright © 2017 米拉. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize  lastDepo,todayDate,week,days,wks11,wks12,wks13,wks14,wks15;
@synthesize lastbn,todaybn;
@synthesize datepicker;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM-dd-yyyy"];
  
    self.todayDate.text = [dateFormatter stringFromDate:datepicker.date];
    self.lastDepo.text = [dateFormatter stringFromDate:datepicker.date];
   
    NSLog(@"Message == %@",self.todayDate.text);

    //[self calculteDate];
    [self calculteDate];
    
    [self calculteWksDay];

    // Do any additional setup after loading the view, typically from a nib.
}


-(void) calculteDate{
    
    // Initialize stringified date presentation
    NSString *myStringDate = self.lastDepo.text;
    NSLog(@"Text == %@",self.todayDate.text);
    NSLog(@"string == %@",myStringDate);
    for(int i=0;i<5;i++){
    // How much day to add
    int addDaysCount = 7*(i+11);
    
    // Creating and configuring date formatter instance
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM-dd-yyyy"];
    
    // Retrieve NSDate instance from stringified date presentation
    NSDate *dateFromString = [dateFormatter dateFromString:myStringDate];
    
    // Create and initialize date component instance
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setDay:addDaysCount];
    
    NSLog(@"dataComponents date: %@", dateFromString);


    NSDate *newDate = [[NSCalendar currentCalendar]
                       dateByAddingComponents:dateComponents
                       toDate:dateFromString options:0];
    
    NSLog(@"Original date: %@", [dateFormatter stringFromDate:dateFromString]);
    NSLog(@"New date: %@", [dateFormatter stringFromDate:newDate]);
    
    if(i==0)
        self.wks11.text=[dateFormatter stringFromDate:newDate];
    if(i==1)
        self.wks12.text=[dateFormatter stringFromDate:newDate];
    if(i==2)
        self.wks13.text=[dateFormatter stringFromDate:newDate];
    if(i==3)
            self.wks14.text=[dateFormatter stringFromDate:newDate];
        if(i==4)
            self.wks15.text=[dateFormatter stringFromDate:newDate];
    }
    
}

- (void) calculteWksDay{
    
    NSString *start = self.lastDepo.text;
    NSString *end = self.todayDate.text;
    
    NSDateFormatter *f = [[NSDateFormatter alloc] init];
    [f setDateFormat:@"MM-dd-yyyy"];
    NSDate *startDate = [f dateFromString:start];
    NSDate *endDate = [f dateFromString:end];
    
    NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [gregorianCalendar components:NSCalendarUnitDay
                                                        fromDate:startDate
                                                          toDate:endDate
                                                         options:0];
    
    self.week.text=[NSString stringWithFormat:@"%ld",components.day/7];
    self.days.text=[NSString stringWithFormat:@"%ld",components.day%7];

    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)CaculateLastDepo:(id)sender {
    
    [self updateLastDepo];
    [self calculteDate];

    
}

- (IBAction)CaculateTodayDepo:(id)sender {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM-dd-yyyy"];
    //NSString *dateString11 = [dateFormatter stringFromDate:lastDe];
    self.todayDate.text=[dateFormatter stringFromDate:datepicker.date];
    //[self calculteWksDay];
    [self calculteWksDay];
    
}

- (void)updateLastDepo {
    
   // NSDate *lastDe = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM-dd-yyyy"];
    //NSString *dateString11 = [dateFormatter stringFromDate:lastDe];
    self.lastDepo.text=[dateFormatter stringFromDate:datepicker.date];
    [self calculteWksDay];

    
}
@end
