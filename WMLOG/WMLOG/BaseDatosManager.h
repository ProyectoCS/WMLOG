//
//  BaseDatosManager.h
//  WMLOG
//
//  Created by Francisco Santos on 23/04/14.
//  Copyright (c) 2014 CLICKSOFT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ConfigInicialVC.h"
#import <sqlite3.h>



@interface BaseDatosManager : NSObject
@property (nonatomic) sqlite3 *appDBWMlog;
@property(strong,nonatomic) NSString *databasePath;

+(id)getInstance;
-(void)dataBaseCreate;
-(Boolean)openDatabase;
-(NSArray *) selectData;
-(NSString *) insertData;
@end
