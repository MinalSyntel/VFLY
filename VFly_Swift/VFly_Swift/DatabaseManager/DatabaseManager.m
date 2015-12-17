//
//  DatabaseManager.m
//UA
//  Created by Minal on 09/08/13.
//  Copyright (c) 2013 syntel. All rights reserved.
//

#import "DatabaseManager.h"
#define DatabaseName @"flightDtlDB"


@implementation DatabaseManager
@synthesize managedObjectContext,userId;
static DatabaseManager * sharedInstance = nil;

+ (DatabaseManager*) sharedInstance
{
    @synchronized(self)
	{
		if(sharedInstance==nil)
		{
			sharedInstance = [[DatabaseManager alloc] init];
		}
	}
	return sharedInstance;
}

- (BOOL) checkAndStoreSqliteDatabase:(NSString*)databaseName
{
    BOOL exist = [[DatabaseManager sharedInstance] existDatabase:databaseName];
    
    
    if (!exist)
    {
        BOOL copied =   [[DatabaseManager sharedInstance] copyDatabase:databaseName];
        if (copied)
        {
            // NSLog(@"Database copied successfully");
            BOOL opened =  [[DatabaseManager sharedInstance] openDatabase:databaseName];
            if (opened)
            {
                // NSLog(@"Database Opened succesfully");
                //[[DatabaseManager sharedInstance] transferDataToCoreDataFromDatabase:@"MarketComparator" withManagedObjectContext:self.managedObjectContext];
            }
        }
        else
        {
            // NSLog(@"Failed to copy Database");
        }
    }
    else
    {
        // NSLog(@"Database already exist");
    }
    
    return exist;
}


- (BOOL) openDatabase:(NSString*)databaseName
{
    BOOL success = NO;
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:databaseName];
    if (sqlite3_open([path UTF8String], &database) == SQLITE_OK)
	{
		success = YES;
	}
    
	return success;
}

// Check if the SQL database has already been saved to the users phone, if not then copy it over
- (BOOL) existDatabase:(NSString*)databaseName
{
    BOOL success = NO;
	
	// Get the path to the documents directory and append the databaseName
	NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDir = [documentPaths objectAtIndex:0];
	NSString *databasePath = [documentsDir stringByAppendingPathComponent:databaseName];
	
	// Create a FileManager object, we will use this to check the status
	// of the database and to copy it over if required
	NSFileManager *fileManager = [NSFileManager defaultManager];
	
	// Check if the database has already been created in the users filesystem
	success = [fileManager fileExistsAtPath:databasePath];
    
    
    return success;
}

- (BOOL)copyDatabase:(NSString*)databaseName
{
    BOOL success = NO;
    // Get the path to the documents directory and append the databaseName
	NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDir = [documentPaths objectAtIndex:0];
	NSString *databasePath = [documentsDir stringByAppendingPathComponent:databaseName];
    
    NSFileManager* fileManager = [NSFileManager defaultManager];
    NSError* error = nil;
    
    //get resource path
    NSString* path = [[NSBundle mainBundle] pathForResource:databaseName ofType:@"sqlite"];
    
    success = [fileManager copyItemAtPath:path toPath:databasePath error:&error];
    
    if (!success)
    {
        // NSLog(@"error:%@",[error description]);
    }
    
    return success;
}

- (BOOL) createDatabase:(NSString*)databaseName
{
    BOOL success = NO;
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:databaseName];
    if (sqlite3_open([path UTF8String], &database) == SQLITE_OK)
	{
		success = YES;
	}
    
    
    return success;
}



//generic function definition

-(BOOL)UpdateValueIntoTable:(NSString *)tablename Value:(NSString *)value IntoColumn:(NSString *)columnname Where:(NSString*)whereClause
{
    bool result = NO;
    if([self openDatabase:DatabaseName])
    {
        NSString* query = [NSString stringWithFormat:@"%@%@%@%@%@%@%@%@",@"update ",tablename,@" set ",columnname,@" = '",value,@"' where ",whereClause];
        // NSLog(@"query:%@",query);
        const char *sql = [query UTF8String];
        sqlite3_stmt *stmt;
        
        int res = sqlite3_prepare_v2(database, sql, -1, &stmt, NULL);
        // NSLog(@"Result is:- %d",res);
        if(res == SQLITE_OK)
        {
            result = YES;
            int resultCode = sqlite3_exec(database, [query UTF8String], NULL, NULL, NULL);
             NSLog(@"resultCode:%d",resultCode);
            
        }
        
        sqlite3_finalize(stmt);
    }
    return result;
    
    
}


// generic update for set of values

-(BOOL)UpdateSetOfValuesIntoTable:(NSString *)tablename Set:(NSString *)set Where:(NSString*)whereClause
{
    bool result = NO;
    if([self openDatabase:DatabaseName])
    {
        NSString* query = [NSString stringWithFormat:@"%@%@%@%@%@",@"update ",tablename,@" set ",set,whereClause];
        // NSLog(@"query:%@",query);
        const char *sql = [query UTF8String];
        sqlite3_stmt *stmt;
        
        int res = sqlite3_prepare_v2(database, sql, -1, &stmt, NULL);
        // NSLog(@"Result is:- %d",res);
        if(res == SQLITE_OK)
        {
            result = YES;
            int resultCode = sqlite3_exec(database, [query UTF8String], NULL, NULL, NULL);
             NSLog(@"resultCode:%d",resultCode);
            
        }
        
        sqlite3_finalize(stmt);
    }
    return result;
    
    
}



-(NSArray*) Select:(NSArray *)columnnames table:(NSString *)tablename where:(NSString *)whereclause
{
    NSMutableArray *results =[NSMutableArray array];
    NSArray *columnnames_local  = [NSArray array] ;
    NSArray *resultarray = [NSArray array];
    NSString *columnNameString ;
    if([columnnames count]>0 )
    {
        NSString *data = [columnnames objectAtIndex:0];
        
        if([data isEqual:@"*"])
        {
            columnNameString = @"*";
            // NSLog(@"data val is :%@",data);
        }
        else
        {
            
            columnNameString = [columnnames componentsJoinedByString:@","];
            // NSLog(@"column name val is :%@",[columnnames objectAtIndex:0]);
            columnnames_local = [NSMutableArray arrayWithArray:columnnames];
        }
        
        
    }
    else
    {
        columnNameString = @"*";
        //[columnnames release];
        
        
        
    }
    
    if ([whereclause length]==0) {
        whereclause = @" where 1=1";
    }
    
    //    NSString *columnValueString = [values componentsJoinedByString:@","];
    
    NSString *sql1 = @"Select ";
    // NSString *sql2 = @"testtable";
    NSString *sql3 = @" from ";
    NSString *sql4 = @" ";
    //    NSString *sql5 = @") values(";
    // NSString *sql6 = @"\"";
    
    
    NSString *string_final = [NSString stringWithFormat:@"%@%@%@%@%@%@",sql1,columnNameString,sql3,tablename,sql4,whereclause];
    
  //  int counter_count=0;
   // NSLog(@"final query is:%@",string_final);
    
    if([self openDatabase:DatabaseName])
    {
        if([columnNameString isEqual:@"*"])
        {
            
            columnnames_local = [self selectColumnNames:tablename];
            
        }        // NSLog(@"exe the query");
        
        sqlite3_stmt *stmt;
        int res =    sqlite3_prepare_v2(database, [string_final UTF8String], -1, &stmt, NULL);
        
        if(res == SQLITE_OK )
        {
            // NSLog(@"the data is being read");
            int number_Columns = sqlite3_column_count(stmt);
            
            NSString *val_object;
            while (sqlite3_step(stmt) == SQLITE_ROW) {
                //NSMutableArray *array = [NSMutableArray array];
                NSMutableDictionary *dict = [NSMutableDictionary dictionary];
                
                // NSLog(@"column count is in select :%i",++counter_count);
                for (int i=0; i<number_Columns; i++) {
                    // [array addObject:[NSString stringWithUTF8String:(char*)sqlite3_column_text(stmt, i)]];
                    if (sqlite3_column_text(stmt, i)==nil)
                    {
                        val_object = @" ";
                    }
                    else
                    {
                    val_object = [NSString stringWithUTF8String:(char*)sqlite3_column_text(stmt, i)];
                    }
                    // NSLog(@"%@",val_object);
                    if([val_object isEqualToString:@" "])
                    {
                       [dict setObject:@"" forKey:[NSString stringWithFormat:@"%@",[columnnames_local objectAtIndex:i]]];
                    }
                    else
                    {
                    [dict setObject:val_object forKey:[NSString stringWithFormat:@"%@",[columnnames_local objectAtIndex:i]]];
                    }
                    // NSLog(@"\n value of i in select  is:%@",[columnnames_local objectAtIndex:i]);
                    // NSLog(@"%@",dict);
                }
                
                [results addObject:dict];
                
            }
            
            resultarray = [NSArray arrayWithArray:results];
            
            
        }
        
    }
    // NSLog(@"resultarray%@",resultarray);
    return  resultarray;
    
}

-(BOOL) Insertinto:(NSArray *)columnnames table:(NSString *)tablename values:(NSArray *)values
{
    BOOL volatile returnValue;
    if([self openDatabase:DatabaseName])
    {
        
        // NSLog(@"Trying to insert data");
        NSString *columnNameString = [columnnames componentsJoinedByString:@","];
        NSString *columnValueString = [values componentsJoinedByString:@","];
        
        NSString *sql1 = @"insert into ";
        // NSString *sql2 = @"testtable";
        NSString *sql3 = @"(";
        //NSString *sql4 = @")";
        NSString *sql5 = @") values (";
        NSString *sql6 = @")";
        
        
        NSString *string_final = [NSString stringWithFormat:@"%@%@%@%@%@%@%@",sql1,tablename,sql3,columnNameString,sql5,columnValueString,sql6];
        
        
       // NSLog(@"final query is:%@",string_final);
        
        
        int res =    sqlite3_exec(database, [string_final UTF8String], NULL,NULL,NULL);
        
        if(res == SQLITE_OK)
        {
           // NSLog(@"Data inserted successfully %i",res);
            returnValue = YES;
            // NSLog(@"returnValue %d",returnValue);
        }
        else
        {
           // NSLog(@"Data inserted unsuccessfully %i",res);
            returnValue = NO;
        }
    }
    else
    {
        // NSLog(@"Data inserted unsuccessfully");
        returnValue =  0;
    }
    return returnValue;
}


-(NSArray*)selectColumnNames:(NSString*)tablename
{
    BOOL  result = NO;
    NSMutableArray *columns = [NSMutableArray array];
    NSArray *array  = [NSArray array];
    
    if ([self openDatabase:DatabaseName])
    {
        //fetch table categoryTable
        NSString* sql1 = @"pragma table_info(";
        NSString * sql2  = @")";
        NSString* query = [NSString stringWithFormat:@"%@%@%@",sql1,tablename,sql2];
        
        // NSLog(@"query:%@",query);
        
        const char *sql = [query UTF8String];
        //[query release];
        sqlite3_stmt *statement;
        int output = sqlite3_prepare_v2(database, sql, -1, &statement, NULL);
        // NSLog(@"output:%d",output);
        if (output == SQLITE_OK)
        {
            while(sqlite3_step(statement) == SQLITE_ROW)
            {
                NSString* seNum = [NSString stringWithUTF8String:(char*)sqlite3_column_text(statement, 1)];
                // NSLog(@"seNum:%@",seNum);
                [columns addObject:seNum];
                
            }
            
        }
        
        result = YES;
        array = [NSArray arrayWithArray:columns];
        // [columns release];
        
    }
    
    //    sqlite3_finalize(statement);
    
    
    
    
    return array ;
}



/*
-(BOOL)InsertImageIntoTable:(NSString *)tablename Image:(UIImage *)image IntoColumn:(NSString *)columnname Where:(NSString*)whereClause
{
    bool result = NO;
    if([self openDatabase:DatabaseName])
    {
        //        const char *sql = "update patienttable set pimage =? where ploginid = 'frank'";
        NSData *imageData = [[NSData alloc] initWithData:UIImageJPEGRepresentation(image, 0)];
        //NSString* sql1 = @"update ";
        //NSString * sql2  = @" set ";
        NSString* sql3 = @"=?";
        //NSString * sql4  = @" where ";
        //NSString *sql5 = @"?";
        // NSLog(@"whereClause  %@",whereClause);
        NSString* query = [NSString stringWithFormat:@"%@%@%@%@%@%@%@",@"update ",tablename,@" set ",columnname,sql3,@" where ",whereClause];
        // NSLog(@"query:%@",query);
        const char *sql = [query UTF8String];
        sqlite3_stmt *stmt;
        
        int res = sqlite3_prepare_v2(database, sql, -1, &stmt, NULL);
        // NSLog(@"Result is:- %d",res);
        if(res== SQLITE_OK)
        {
            sqlite3_bind_blob(stmt, 1, [imageData bytes], [imageData length], SQLITE_STATIC);
        }
        else
        {
            // NSLog(@"Error inserting image:- %s",sqlite3_errmsg(database));
        }
        
        if(sqlite3_step(stmt) == SQLITE_DONE)
        {
            // NSLog(@"Success");
            result = YES;
        }
        else
        {
            
            // NSLog(@"unsuccessful");
        }
        
        sqlite3_finalize(stmt);
    }
    return result;
}
*/

-(NSData*)SelectImageFrom:(NSString*)columnname table:(NSString*)tablename where:(NSString*)whereclause
{
    NSData* imagedata = [NSData data];
    
    
    if([self openDatabase:DatabaseName])
    {
        NSString *query = [NSString stringWithFormat:@"%@%@%@%@%@%@",@"select ", columnname,@" from ",tablename,@" ",whereclause];
        
        sqlite3_stmt *stmt;
        
        if(sqlite3_prepare_v2(database, [query UTF8String], -1, &stmt, NULL) == SQLITE_OK)
        {
            
        
        
        while (sqlite3_step(stmt) == SQLITE_ROW)
        {
//            const void * blobBytes = sqlite3_column_blob(stmt, 0);
//            int blobBytesLength = sqlite3_column_int(stmt, 0);
//            imagedata = [NSData dataWithBytes:blobBytes length:blobBytesLength];
//            NSLog(@"Here's the image data %@", imagedata);
            
            imagedata = [[NSData alloc] initWithBytes:sqlite3_column_blob(stmt, 0) length:sqlite3_column_bytes(stmt, 0)];
            
            if(imagedata == nil)
                NSLog(@"No image found.");
            else
            {
                NSLog(@" image found.");
                
            }
            

        }
        }
    }
  return  imagedata;

}

-(NSMutableArray*)getList:(NSString*)tableName:(NSUInteger)idOfMed
{
    NSMutableArray *arrM = [[NSMutableArray alloc] init] ;
    
    // Open the database from the users filessytem
    if ([self openDatabase:DatabaseName])
        
    {
        // Setup the SQL Statement and compile it for faster access
        NSString *strSQL = [NSString stringWithFormat: @"SELECT * from %@ where id =%lu",tableName,(unsigned long)idOfMed];
        // NSLog(@"query %@",strSQL);
        const char *sql = [strSQL UTF8String];
        //[query release];
        sqlite3_stmt *statement;
        int output = sqlite3_prepare_v2(database, sql, -1, &statement, NULL);
        if (output == SQLITE_OK)  {
            // Loop through the results and add them to the feeds array
            while(sqlite3_step(statement) == SQLITE_ROW) {
                // Read the data from the result row
                NSMutableDictionary *_dict = [[NSMutableDictionary alloc] init];
                int nColumns = sqlite3_column_count( statement );
                for (int i = 0; i < nColumns; i += 1) {
                    if (sqlite3_column_text(statement, i)) {
                        NSString *strValue = [NSString stringWithUTF8String:(char*)sqlite3_column_text(statement, i)];
                        
                        //printf("/////////QUAD BREAKPOINT 4. GET LIST strValue : %s\n", [strValue UTF8String]);
                        NSString *strColumn = [NSString stringWithUTF8String:(char*)sqlite3_column_name(statement, i)];
                        //    printf("/////////QUAD BREAKPOINT 4. GET LIST strColumn : %s\n", [strColumn UTF8String]);
                        
                        //printf("[%s] %s => %s\n", [table UTF8String], [strValue UTF8String], [strColumn UTF8String]);
                        
                        [_dict setValue:strValue  forKey: strColumn];
                    }
                }
                //printf("--------------------------------------------------------------------------------------------------\n");
                
                [arrM addObject: _dict];
            }
        }
        // Release the compiled statement from memory
        sqlite3_finalize(statement);
        
    }
    //sqlite3_close(database);
    // NSLog(@"array M%@",arrM);
    
    return arrM;
    
    
    
}



@end
