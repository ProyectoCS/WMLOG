//
//  Validaciones.h
//  WMLOG
//
//  Created by Francisco Santos on 29/04/14.
//  Copyright (c) 2014 CLICKSOFT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Validaciones : NSObject
-(BOOL)isEmpty:(NSString *)text;
-(BOOL)isNumberOk:(NSString *)text;
-(BOOL)isEmailOk:(NSString *)text;
@end
