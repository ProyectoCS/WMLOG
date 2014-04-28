//
//  BaseDatosManager.m
//  WMLOG
//
//  Created by Francisco Santos on 23/04/14.
//  Copyright (c) 2014 CLICKSOFT. All rights reserved.
//

#import "BaseDatosManager.h"
#import "ConfigInicialVC.h"

@implementation BaseDatosManager
static BaseDatosManager *_instanceBdM;

+(id)getInstance{
    //verifca si esta creada la instancia
    if(_instanceBdM == nil){
        //crear la instancia
        _instanceBdM = [[BaseDatosManager alloc] init];
    }
    //regresamos la instancia
    return _instanceBdM;
}

-(void)dataBaseCreate{
    
}

-(id)init{
    if(self = [super init]){
    NSString *docsDir;
    NSArray *dirPaths;
    // Obtener el directorio de documentos
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir = dirPaths[0];
    // Construimos el directorio para la BD
    _databasePath = [[NSString alloc]
                     initWithString: [docsDir stringByAppendingPathComponent:@"DBWMlog.db"]];
    NSFileManager *filemgr = [NSFileManager defaultManager];
    
    if([filemgr fileExistsAtPath:_databasePath] == NO){
        NSLog(@"%s","No existe la base");
        NSLog(@"%s","Se creo la BD");
        const char *dbpath = [_databasePath UTF8String];
        //creamos y abrimos la BD
        if(sqlite3_open(dbpath, &_appDBWMlog) == SQLITE_OK){
            NSLog(@"%s","Se abrio correctamente la base de datos");
            char *errorMessage;
            const char *sql=
            "CREATE TABLE IF NOT EXISTS INIT_CONFIG(ID INTEGER PRIMARY KEY, SERVIDOR TEXT,PUERTO TEXT,USUARIO TEXT, CONTRASENA TEXT,AUTENT TEXT, AMBIENTE TEXT)";
            //creamos la tabla INIT_CONFIG
            if(sqlite3_exec(_appDBWMlog, sql, NULL, NULL, &errorMessage) != SQLITE_OK){
                NSLog(@"%s","error al crear la tabla");
            }else{
                NSLog(@"%s","las tabla INIT_CONFIG se creo exitosamente");
            }
            //cerramos la BD
            sqlite3_close(_appDBWMlog);
        }else{
            NSLog(@"%s","Error al abrir/crear la base de datos");
        }
    }
    else{
        //si la BD ya esta creada solo lal abrimos para su posterior uso
        NSLog(@"%s","la base de datos ya esta creada");
        if(self.openDatabase){
            NSLog(@"%s","la base de datos se abrio correcatemente");
        }
    }
    
    }
    return self;
}

-(Boolean)openDatabase{
    //accesamos al directorio de bas de datos
    NSString *path = [[NSBundle mainBundle] pathForResource:@"DBWMlog" ofType:@"sqlite"];
    //abrimos la BD
    if(sqlite3_open([path UTF8String],&(_appDBWMlog)) != SQLITE_OK){
        return NO;
    }
    return YES;
    
}

//falta implementar metodos de consulta e insercion
-(NSArray *) selectData{
    return nil;
}
-(NSString *) insertData{
    return nil;
}

@end
