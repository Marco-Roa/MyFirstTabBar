//
//  GamesObject.h
//  MyFirstTabBar
//
//  Created by Marco Antonio Roa De La Cruz on 11/15/17.
//  Copyright © 2017 MarcoRoa. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@protocol MatchObject
@end
@interface GamesObject : JSONModel

@property (strong, nonatomic) NSString *games;

@end
