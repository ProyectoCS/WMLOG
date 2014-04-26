//
//  DefaultConfigManager.h
//  WMLOG
//
//  Created by Francisco Santos on 24/04/14.
//  Copyright (c) 2014 CLICKSOFT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DefaultConfigManager : NSObject
@property (strong,nonatomic) NSUserDefaults *configDefaults;
+(id)getInstance;
-(void)saveData:(NSString*) server portt:(NSString *) port userr:(NSString*) user passs:(NSString*) pass reqAuthh:(NSString*) reqAuth envv:(NSString*) environment isSavedd:(NSString *) isSaved;
-(NSArray *)getData;
@end
