//
//  ViewController.h
//  p05-Depo
//
//  Created by 米拉 on 3/25/17.
//  Copyright © 2017 米拉. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *lastDepo,*todayDate,*week,*days,*wks11,*wks12,*wks13,*wks14,*wks15;

@property (strong, nonatomic) IBOutlet UIButton *lastbn,*todaybn;
@property (strong, nonatomic) IBOutlet UIDatePicker *datepicker;

- (IBAction)CaculateLastDepo:(id)sender;
- (IBAction)CaculateTodayDepo:(id)sender;

//- (IBAction)updateLastDepo:(id)sender;

@end

