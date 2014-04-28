//
//  ConfigInicialVC.h
//  WMLOG
//
//  Created by Francisco Santos on 23/04/14.
//  Copyright (c) 2014 CLICKSOFT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseDatosManager.h"
#import <sqlite3.h>

@interface ConfigInicialVC : UIViewController
@property(strong,nonatomic)IBOutlet UITextField *txtServer;
@property(strong,nonatomic)IBOutlet UITextField *txtPort;
@property(strong,nonatomic)IBOutlet UITextField *txtUser;
@property(strong,nonatomic)IBOutlet UITextField *txtPass;
@property(strong,nonatomic)IBOutlet UISwitch *swAuthen;
@property(strong,nonatomic)IBOutlet UISegmentedControl *segControlAmbiente;

-(IBAction)saveConfig:(id)sender;
-(void)goToMenu;
@end
