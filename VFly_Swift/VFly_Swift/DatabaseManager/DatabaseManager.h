//
//  DatabaseManager.h
//  UA
//
//  Created by Minal on 09/08/13.
//  Copyright (c) 2013 syntel. All rights reserved.
//


/*!
 Prerequisites
 frameworks Required - libsqlite
 */

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "sqlite3.h"

@interface DatabaseManager : NSObject
{
    sqlite3* database;
    NSManagedObjectContext* managedObjectContext;
    BOOL dataSaved;
    NSString* userId;
    NSString* userRole;

}
@property(nonatomic,retain) NSManagedObjectContext* managedObjectContext;
@property(nonatomic,retain) NSString* userId;

+ (DatabaseManager*) sharedInstance;
- (BOOL) checkAndStoreSqliteDatabase:(NSString*)databaseName;
- (BOOL) openDatabase:(NSString*)databaseName;
- (BOOL) existDatabase:(NSString*)databaseName;
- (BOOL) copyDatabase:(NSString*)databaseName;
- (BOOL) createDatabase:(NSString*)databaseName;

/*! database methods for insertion, update and display values */


// generic mes
-(BOOL)Insertinto:(NSArray *)columnnames table:(NSString *)tablename values:(NSArray*)values;
-(BOOL)UpdateValueIntoTable:(NSString *)tablename Value:(NSString *)value IntoColumn:(NSString *)columnname Where:(NSString*)whereClause;
-(BOOL)UpdateSetOfValuesIntoTable:(NSString *)tablename Set:(NSString *)set Where:(NSString*)whereClause;
-(NSArray*)Select:(NSArray*)columnnames table:(NSString*)tablename where:(NSString*)whereclause;
-(NSArray*)selectColumnNames:(NSString*)tablename;
//-(BOOL)InsertImageInto:(NSString*)tablename image:(NSData*)img inrow:(NSString*)loginid;
//-(BOOL)InsertImageIntoTable:(NSString *)tablename Image:(UIImage *)image IntoColumn:(NSString *)columnname Where:(NSString*)whereClause;
//-(NSData*)SelectImageFrom:(NSString *)tablename inrow:(NSString *)loginid;
-(NSData*)SelectImageFrom:(NSString*)columnname table:(NSString*)tablename where:(NSString*)whereclause;

-(NSMutableArray*)getList:(NSString*)tableName:(NSUInteger)idOfMed;

@end
