//
//  MyViewController2.m
//  MyFirstTabBar
//
//  Created by Marco Antonio Roa De La Cruz on 11/1/17.
//  Copyright © 2017 MarcoRoa. All rights reserved.
//

#import "MyViewController2.h"
#import "VersusCell.h"


@interface MyViewController2 ()

@property (strong, nonatomic) NSMutableArray *matches;

@end

@implementation MyViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _matches = [[NSMutableArray alloc] init];
    
    [self getMatches];
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
- (NSInteger)tableView:(UIView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"PMK - numberOfRows %li",_matches.count);
    return _matches.count;
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
    
    
    /*
    @property (strong, nonatomic) NSString *time;
    @property (strong, nonatomic) NSString *startTime;
    @property (strong, nonatomic) NSString *away_name;
    @property (strong, nonatomic) NSString *home_name;
    @property (strong, nonatomic) NSString *away_logo;
    @property (strong, nonatomic) NSString *home_logo;
     
     */
    NSDictionary *matchInfo = [_matches objectAtIndex:indexPath.row];
    
    
    
    NSString *homeName = [matchInfo objectForKey:@"home_name"];//matchInfo.home_name;
    NSString *awayName = [matchInfo objectForKey:@"away_name"];//matchInfo.home_name;
    NSString *time = [matchInfo objectForKey:@"time"];//matchInfo.home_name;
    //NSString *awayName = matchInfo.away_name;
    //NSString *time = matchInfo.time;
    
    
    //NSString *homeName = [NSString stringWithFormat:@"%@",(NSString *)matchInfo.home_name];
    //NSString *awayName = [NSString stringWithFormat:@"%@",(NSString *)matchInfo.away_name];
    //NSString *time = [NSString stringWithFormat:@"%@",(NSString *)matchInfo.time];
    
   
    NSLog(@"PMK - Cell creation");

    NSLog(@"PMK - homeName %@",homeName);
    NSLog(@"PMK - awayName %@",awayName);
    NSLog(@"PMK - time %@",time);

    cell.team1Label.text = homeName;
    cell.team2Label.text = awayName;
    cell.vsLabel.text = @"VS";
    cell.timeLabel.text = time;
    
    
    return cell;
}

//********************************************************************************************
#pragma mark                            Data methods
//********************************************************************************************
- (void)getMatches{
    
    NSLog(@"PMK - getMatches");
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    [WebServices getMatches:^(NSMutableArray<MatchObject> *matches) {
        
        if(matches){
            [_matches removeAllObjects];
            [_matches addObjectsFromArray:matches];
            
            //SWObject *person = [people objectAtIndex:indexPerson];
            //NSString *name = person.name;
            
            NSLog(@"Data arrived, refreshing...");
            //self.lblName.text = name;
            //self.lblName.adjustsFontSizeToFitWidth = YES;
            //indexPerson++;
            
            [self.tableView2 reloadData];
        }
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    }];
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
