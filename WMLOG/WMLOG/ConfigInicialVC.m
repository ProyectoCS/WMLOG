//
//  ConfigInicialVC.m
//  WMLOG
//
//  Created by Francisco Santos on 23/04/14.
//  Copyright (c) 2014 CLICKSOFT. All rights reserved.
//

#import "ConfigInicialVC.h"
#import "DefaultConfigManager.h"

@interface ConfigInicialVC ()
    @property BaseDatosManager *bdManager;
@end

@implementation ConfigInicialVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)viewDidAppear:(BOOL)animated{
    /*if(_configs == nil){
        NSLog(@"%s","muestra config inicial");
        _txtServer.text = @"muestra config inicial";
    }else{
        /*NSLog(@"%s","muestra menu");
         _txtServer.text = @"muestra menu";*/
       /* [self goToMenu];
    }*/
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"%s","Cargando pantalla");
    _bdManager = [BaseDatosManager getInstance];
    //_configs = [[DefaultConfigManager getInstance]getData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)saveConfig:(id)sender{
     NSString *env;
     [_txtServer resignFirstResponder];
     [_txtPort resignFirstResponder];
     [_txtUser resignFirstResponder];
     [_txtPass resignFirstResponder];
        if([_segControlAmbiente  selectedSegmentIndex] == 0){
            env = @"QA";
        }else if ([_segControlAmbiente  selectedSegmentIndex] == 1){
            env = @"DESARROLLO";
        }else{
            env = @"PRODUCCION";
        }
        
        [[DefaultConfigManager getInstance]saveData:[_txtServer text] portt:[_txtPort text] userr:[_txtUser text] passs:[_txtPass text] reqAuthh:[_swAuthen isOn] ? @"1" : @"0" envv:env isSavedd:@"true"];
        [self goToMenu];
        
        //NSLog(@"%@",_configs);
}
-(IBAction)saveExtraer:(id)sender{
    /*_configs = [[DefaultConfigManager getInstance]getData];
    NSLog(@"%@",_configs);*/
}
-(void)goToMenu{
    UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *menuViewController = [mainStoryBoard instantiateViewControllerWithIdentifier:@"principalMenu"];
    [self presentViewController:menuViewController animated:YES completion:nil];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
