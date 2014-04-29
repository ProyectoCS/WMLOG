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
    NSLog(@"la pantalla aparecio");
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"%s","la pantalla cargo");

    //obtiene la instancia a la BaseDatosManager, crea la Base de datos y la abre;
    _bdManager = [BaseDatosManager getInstance];
    //obtiene la instancia a DefaultConfigManager y obtiene los datos guardados en la configuracion.
    _configs = [[DefaultConfigManager getInstance]getData];
    
    //extrae los datos de configuracion cada que se entre a la pantalla de configuracion inicial
    if([[_configs objectAtIndex:[_configs count] - 1] isEqualToString:@"true"]){
        _txtServer.text = [NSString stringWithFormat:@"%@",[_configs objectAtIndex:0]];
        _txtPort.text = [NSString stringWithFormat:@"%@",[_configs objectAtIndex:1]];
        _txtUser.text =[NSString stringWithFormat:@"%@",[_configs objectAtIndex:2]];
        _txtPass.text =[NSString stringWithFormat:@"%@",[_configs objectAtIndex:3]];

        if([[_configs objectAtIndex:4] integerValue] == 1){
            [_swAuthen setOn:YES];
        }else{
            [_swAuthen setOn:NO];
        }
        
        if([[_configs objectAtIndex:5] isEqualToString:@"QA"]){
            [_segControlAmbiente setSelectedSegmentIndex:0];
        }else if([[_configs objectAtIndex:5] isEqualToString:@"DESARROLLO"]){
            [_segControlAmbiente setSelectedSegmentIndex:1];
        }else{
            [_segControlAmbiente setSelectedSegmentIndex:2];
        }
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)saveConfig:(id)sender{
    NSString *env;

      //esconde el teclado
    [self hideKeyboard];

        //evalua el ambiente seleccionado
        if([_segControlAmbiente  selectedSegmentIndex] == 0){
            env = @"QA";
        }else if ([_segControlAmbiente  selectedSegmentIndex] == 1){
            env = @"DESARROLLO";
        }else{
            env = @"PRODUCCION";
        }
    
        //Obtiene instancia de la clase DefaultConfigManager y guarda los datos que le mandamos a saveData
        //isSaveData = variable de configuracion para saber si ya guardo los datos en el NSUserDefaults
        [[DefaultConfigManager getInstance]saveData:[_txtServer text] portt:[_txtPort text] userr:[_txtUser text] passs:[_txtPass text] reqAuthh:[_swAuthen isOn] ? @"1" : @"0" envv:env isSavedd:@"true"];
    
        //Redirecciona el menu de la App
        [self goToMenu];
}
-(IBAction)closeKeyBoard:(id)sender{
    [self hideKeyboard];
}
-(void)goToMenu{
    UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *menuViewController = [mainStoryBoard instantiateViewControllerWithIdentifier:@"MenuInicio"];
    [self presentViewController:menuViewController animated:YES completion:nil];
}

//esconde el teclado cuando tocas DONE en el teclado 
-(void)hideKeyboard{
    [_txtServer resignFirstResponder];
    [_txtPort resignFirstResponder];
    [_txtUser resignFirstResponder];
    [_txtPass resignFirstResponder];
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
