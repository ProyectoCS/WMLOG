//
//  DefaultConfigManager.m
//  WMLOG
//
//  Created by Francisco Santos on 24/04/14.
//  Copyright (c) 2014 CLICKSOFT. All rights reserved.
//

#import "DefaultConfigManager.h"
#import <UIKit/UIKit.h>


@implementation DefaultConfigManager

static DefaultConfigManager *_instanceDefault;

+(id)getInstance{
    if(_instanceDefault == nil){
        _instanceDefault = [DefaultConfigManager alloc];
    }
    return _instanceDefault;
}
-(void)saveData:(NSString*) server portt:(NSString*) port userr:(NSString*) user passs:(NSString*) pass reqAuthh:(NSString*) reqAuth envv:(NSString*) environment isSavedd:(NSString *)isSaved{
    if(_configDefaults == nil){
            _configDefaults = [[NSUserDefaults standardUserDefaults]init];
    }
        [_configDefaults setObject:server forKey:@"server"];
        [_configDefaults setObject:port forKey:@"port"];
        [_configDefaults setObject:user forKey:@"user"];
        [_configDefaults setObject:pass forKey:@"pass"];
        [_configDefaults setObject:reqAuth forKey:@"reqAuth"];
        [_configDefaults setObject:environment forKey:@"environment"];
        [_configDefaults setObject:isSaved forKey:@"isSaved"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        NSLog(@"%s", "La configuracion se guardo correctamente!");
        NSLog(@"%@",[_configDefaults objectForKey:@"server"]);
        NSLog(@"%@",[_configDefaults objectForKey:@"isSaved"]);

}

-(NSArray *)getData{
    NSMutableArray *configurations = [[NSMutableArray alloc]init];
    if(_configDefaults == nil){
        _configDefaults = [[NSUserDefaults standardUserDefaults]init];
    }
    if([_configDefaults objectForKey:@"isSaved"] != nil){
        [configurations addObject:[_configDefaults valueForKey:@"server"]];
        [configurations addObject:[_configDefaults valueForKey:@"port"]];
        [configurations addObject:[_configDefaults valueForKey:@"user"]];
        [configurations addObject:[_configDefaults valueForKey:@"pass"]];
        [configurations addObject:[_configDefaults valueForKey:@"reqAuth"]];
        [configurations addObject:[_configDefaults valueForKey:@"environment"]];
        [configurations addObject:[_configDefaults valueForKey:@"isSaved"]];
    }else{
        return nil;
    }
    return configurations;
    
}
@end
