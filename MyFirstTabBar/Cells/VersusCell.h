//
//  VersusCell.h
//  MyFirstTabBar
//
//  Created by Marco Antonio Roa De La Cruz on 11/8/17.
//  Copyright © 2017 MarcoRoa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VersusCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *team1Label;
@property (strong, nonatomic) IBOutlet UILabel *team2Label;
@property (strong, nonatomic) IBOutlet UILabel *vsLabel;
@property (strong, nonatomic) IBOutlet UILabel *timeLabel;

@end
