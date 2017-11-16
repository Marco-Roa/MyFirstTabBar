//
//  WebServices.h
//  MyFirstTabBar
//
//  Created by Marco Antonio Roa De La Cruz on 11/15/17.
//  Copyright © 2017 MarcoRoa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MatchObject.h"

@interface WebServices : NSObject
+ (void)getMatches:(void (^)(NSMutableArray *people)) handler;

@end
