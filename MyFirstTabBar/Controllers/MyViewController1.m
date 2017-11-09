//
//  MyViewController1.m
//  MyFirstTabBar
//
//  Created by Marco Antonio Roa De La Cruz on 11/1/17.
//  Copyright © 2017 MarcoRoa. All rights reserved.
//

#import "MyViewController1.h"
#import "VersusCell.h"

NSMutableArray *teamsA;
NSMutableArray *teamsB;
NSMutableArray *matchTimes;

@interface MyViewController1 ()

@end

@implementation MyViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    teamsA  = [[NSMutableArray alloc] initWithObjects: @"Leones", @"Patos", @"Tigres", @"Guacamayas", nil];
    
    teamsB  = [[NSMutableArray alloc] initWithObjects: @"Leopardos", @"Gansos", @"Ornitorrincos", @"Pericos", nil];
    
    matchTimes  = [[NSMutableArray alloc] initWithObjects: @"20:00", @"16:00", @"18:30", @"00:00", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table source and delegate methods
/**********************************************************************************************/
- (NSInteger)numberOfSectionsInTableView:(UIView *)tableView {
    return 1;
}
//-------------------------------------------------------------------------------
- (NSInteger)tableView:(UIView *)tableView numberOfRowsInSection:(NSInteger)section {
    return teamsA.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 74;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    VersusCell *cell = (VersusCell *)[tableView dequeueReusableCellWithIdentifier:@"VersusCell"];
    
    if (cell == nil) {
        [tableView registerNib:[UINib nibWithNibName:@"VersusCell" bundle:nil] forCellReuseIdentifier:@"VersusCell"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"VersusCell"];
    }
    
    //VersusCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VersusCell" forIndexPath:indexPath];
    
    //cell.team1Label.text = @"test";
    cell.team1Label.text = teamsA[indexPath.row];
    cell.team2Label.text = teamsB[indexPath.row];
    cell.vsLabel.text = @"VS";
    cell.timeLabel.text = matchTimes[indexPath.row];
    
    
    return cell;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
