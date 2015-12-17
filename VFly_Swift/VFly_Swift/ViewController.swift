//
//  ViewController.h
//  unitedAirlines
//
//  Created by Minal on 11/02/15.
//  Copyright (c) 2015 Syntel. All rights reserved.
//
//

import UIKit

class ViewController: UIViewController {
    
    
    var arr:NSMutableArray = []
    var dateFormat : NSDateFormatter = NSDateFormatter()
    var objDatabaseManager = DatabaseManager()
    var string1 = String()
    var arrOfValuesDate:NSArray = []



    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        self.navigationController!.navigationBarHidden = true
//        Database.sharedInstance.createDatabase()

            
        
        
        dateFormat = NSDateFormatter()
        dateFormat.dateFormat = "dd-MM-yyyy"
        var arrOfColumnName:NSArray = []
        let numbers:NSMutableArray = []
      
        arrOfColumnName = ["date"]
        let bol =  DatabaseManager.sharedInstance().checkAndStoreSqliteDatabase("flightDtlDB")

        
        for var x = 0.0; x <= 8.0; x++ {
            if x == 0.0 || x == 1.0 {
                string1 = dateFormat.stringFromDate(NSDate(timeInterval: 60 * 60 * 24 * 0, sinceDate: NSDate()))
            }
            else {
                if x > 1 {
                    string1 = dateFormat.stringFromDate(NSDate(timeInterval: 60 * 60 * 24 * x, sinceDate: NSDate()))
                }
                print(string1)
                numbers.addObject(string1)
        }
            
            if(!bol){
                let result1: Bool = DatabaseManager.sharedInstance().UpdateValueIntoTable("crewDetails", value:(string1) , intoColumn: "date",`where`: "\("id =")\("'")\(Int(x) + 1)\("'")")
                
                print("bool%d", result1)
                
            }
        }

       
        arrOfValuesDate = objDatabaseManager.Select(arrOfColumnName as [AnyObject], table: "crewDetails", `where`: "where 1=1")

        print("bool%d", arrOfValuesDate)
    }
    
    
    override func viewWillAppear(animated: Bool) {
        
        navigationController?.setNavigationBarHidden(true, animated: true)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}



