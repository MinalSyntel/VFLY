//
//  HomePageViewController.h
//  unitedAirlines
//
//  Created by Minal on 12/02/15.
//  Copyright (c) 2015 Syntel. All rights reserved.
//
import UIKit


class HomePageViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, SlideNavigationControllerDelegate
{
    
    var objDatabaseManager = DatabaseManager()
    var arrOfValues:NSArray = []
    var arrOfValuesDate:NSMutableArray = []
    var arrOfValuesFiltered:NSMutableArray = []
    
    @IBOutlet weak var lblTodayCount: UILabel!
    @IBOutlet weak var lblUpcmgCount: UILabel!
    @IBOutlet weak var boeingLbl: UILabel!
    @IBOutlet weak var terminalLbl: UILabel!
    
    @IBOutlet weak var slotTimeSgmt: UISegmentedControl!
   
    @IBOutlet var todaysTblview: UITableView!
    
    @IBOutlet var upcomingTblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationController!.navigationBarHidden = false
        self.title = "Home"
        self.navigationItem.hidesBackButton = true
        self.addCutomButtonsToNavigationController(self.navigationController!)

        self.navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.navigationController!.navigationBar.barTintColor = UIColor(red: 6.0 / 255.0, green: 55.0 / 255.0, blue: 150.0 / 255.0, alpha: 1.0)
        
        self.fetchValues()
        
        
        lblTodayCount.text = "\(UInt(arrOfValuesDate.count))"
        lblUpcmgCount.text = "\(UInt(arrOfValuesFiltered.count))"
        
//        let cell: UITableViewCell = UITableViewCell()
//        let indexPath: NSIndexPath = self.upcomingTblView.indexPathForCell(cell)!
//
//
//
//        self.boeingLbl.text = String((arrOfValuesDate.objectAtIndex(indexPath.row).valueForKey("flightType")))
//        
//        self.terminalLbl.text =
//           String(( arrOfValuesDate.objectAtIndex(indexPath.row).valueForKey("te")))

    }
    
    override func viewWillAppear(animated: Bool) {
        self.todaysTblview.reloadData()
        self.upcomingTblView.reloadData()
       // self.slotTimeSgmt.reloadInputViews()
    }
    
    func slideNavigationControllerShouldDisplayLeftMenu() -> Bool {
        return true
    }
    
    func slideNavigationControllerShouldDisplayRightMenu() -> Bool {
        return false
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        

        let flightDetailsViewController:FlightDetailsViewController = segue.destinationViewController as! FlightDetailsViewController
        let cell: UITableViewCell = sender as! UITableViewCell
        if (segue.identifier == "moreDetail") {
                        let indexPath: NSIndexPath = self.todaysTblview.indexPathForCell(cell)!
                        flightDetailsViewController.sSubArray = arrOfValuesDate[indexPath.row] as! NSMutableArray
                        flightDetailsViewController.sSubArrOfValuesDate = arrOfValuesDate
                        flightDetailsViewController.i = "0"
                    }
        else if (segue.identifier == "moreDetail1") {
                        let indexPath: NSIndexPath = self.upcomingTblView.indexPathForCell(cell)!
                        flightDetailsViewController.sSubArray = arrOfValuesFiltered[indexPath.row] as! NSMutableArray
                        flightDetailsViewController.sSubArrOfValuesDate = arrOfValuesFiltered
                        flightDetailsViewController.i = "1"
                    }

    }
 
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(tableView == self.todaysTblview)
        {
            return arrOfValuesDate.count
        }
        else
            if (tableView == self.upcomingTblView) {
                return arrOfValuesFiltered.count
        }
        
        
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell
        if tableView == self.todaysTblview {
            
            cell = tableView.dequeueReusableCellWithIdentifier("cell1", forIndexPath: indexPath) as UITableViewCell
            
            
            
            let dateFormat: NSDateFormatter = NSDateFormatter()
            dateFormat.dateFormat = "yyyy-MM-dd"
            let format: NSDateFormatter = NSDateFormatter()
            format.dateFormat = "MMM dd, yyyy"
            let timeFormat: NSDateFormatter = NSDateFormatter()
            timeFormat.dateFormat = "HH:mm:ss"
            let dateFormatter: NSDateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "EEEE,"
            let now: NSDate = NSDate()
            let dateString: String = format.stringFromDate(now)
//            let theDate: String = dateFormat.stringFromDate(now)
//            let theTime: String = timeFormat.stringFromDate(now)
            let week: String = dateFormatter.stringFromDate(now)
            
            
            //custom labels
            let stationsLbl: UILabel = cell.viewWithTag(101) as! UILabel
            let vfNoLbl: UILabel = cell.viewWithTag(102) as! UILabel
            let dayLabel: UILabel = cell.viewWithTag(103) as! UILabel
            let dateLabel: UILabel = cell.viewWithTag(104) as! UILabel
            let dptLabel: UILabel = cell.viewWithTag(105) as! UILabel
            let dptTimeLabel: UILabel = cell.viewWithTag(106) as! UILabel
            let gateDLbl: UILabel = cell.viewWithTag(107) as! UILabel
            let arrLabel: UILabel = cell.viewWithTag(108) as! UILabel
            let arrTimeLabel: UILabel = cell.viewWithTag(109) as! UILabel
            let gateALbl: UILabel = cell.viewWithTag(110) as! UILabel

            
            
            var string: String = week
            let index: String.Index = string.startIndex.advancedBy(3) //
            string = string.substringToIndex(index)
            

            dayLabel.text = string.stringByAppendingString(",")
            dateLabel.text = dateString
            
            
            dptLabel.text = String((arrOfValuesDate.objectAtIndex(indexPath.row).valueForKey("fromID"))as! NSString)
           arrLabel.text = String((arrOfValuesDate.objectAtIndex(indexPath.row).valueForKey("destID"))as! NSString)
           arrTimeLabel.text = String((arrOfValuesDate.objectAtIndex(indexPath.row).valueForKey("arvTime"))as! NSString)
            dptTimeLabel.text = String((arrOfValuesDate.objectAtIndex(indexPath.row).valueForKey("depTime"))as! NSString)
         stationsLbl.text =  ((arrOfValuesDate.objectAtIndex(indexPath.row).valueForKey("baseStation"))as! NSString).stringByAppendingString(" To ").stringByAppendingString(((arrOfValuesDate.objectAtIndex(indexPath.row).valueForKey("destStation"))as! NSString) as String)
            
        gateDLbl.text = String((arrOfValuesDate.objectAtIndex(indexPath.row).valueForKey("gateD"))as! NSString)
           gateALbl.text = String((arrOfValuesDate.objectAtIndex(indexPath.row).valueForKey("gateA"))as! NSString)
          vfNoLbl.text =  String((arrOfValuesDate.objectAtIndex(indexPath.row).valueForKey("vfNo"))as! NSString)
           
            /*for base location*/
            if (arrLabel.text == "LAX") {
//                orangeView.hidden = false
//                orangeABLbl.hidden = false
//                orangeLocLbl.hidden = false
            }

            cell.accessoryView = UIImageView(image: UIImage(named: "icn-arw.png"))
            cell.accessoryType = .DisclosureIndicator
        }
        if tableView == self.upcomingTblView {
            
            cell = tableView.dequeueReusableCellWithIdentifier("cell2", forIndexPath: indexPath) as UITableViewCell
            
            let dptLblUp: UILabel = cell.viewWithTag(120) as! UILabel
            let dateLabel: UILabel = cell.viewWithTag(121) as! UILabel
            let dptTimeLblUp: UILabel = cell.viewWithTag(122) as! UILabel
            let img: UIImageView = cell.viewWithTag(123) as! UIImageView
            let imgTimeLbl: UILabel = cell.viewWithTag(124) as! UILabel
            let arrLblUp: UILabel = cell.viewWithTag(125) as! UILabel
            let dateLabel2: UILabel = cell.viewWithTag(126) as! UILabel
            let arrTimeLblUp: UILabel = cell.viewWithTag(127) as! UILabel
            
            /*to show base location*/
            let orangeView: UIView = cell.viewWithTag(300)!
            let orangeABLbl: UILabel = cell.viewWithTag(301) as! UILabel
            let orangeLocLbl: UILabel = cell.viewWithTag(302) as! UILabel
            
            orangeView.hidden = true
            orangeABLbl.hidden = true
            orangeLocLbl.hidden = true
            /*sorting of date order- ascending*/

            
          print(  arrOfValuesFiltered)
            let dateSortDescriptor: NSSortDescriptor = NSSortDescriptor(key: "month", ascending: true)
            arrOfValuesFiltered.sortedArrayUsingDescriptors([dateSortDescriptor])
            print("changed:",  arrOfValuesFiltered)

            
            arrLblUp.text = String((arrOfValuesFiltered.objectAtIndex(indexPath.row).valueForKey("destID"))as! NSString)
            dptLblUp.text = String((arrOfValuesFiltered.objectAtIndex(indexPath.row).valueForKey("fromID"))as! NSString)
            arrTimeLblUp.text = String((arrOfValuesFiltered.objectAtIndex(indexPath.row).valueForKey("arvTime"))as! NSString)
            dptTimeLblUp.text = String((arrOfValuesFiltered.objectAtIndex(indexPath.row).valueForKey("depTime"))as! NSString)
            let dateFormat: NSDateFormatter = NSDateFormatter()
            dateFormat.dateFormat = "dd-MM-yyyy"
            
            dateLabel.text = String((arrOfValuesFiltered.objectAtIndex(indexPath.row).valueForKey("date"))as! NSString)
            dateLabel2.text = String((arrOfValuesFiltered.objectAtIndex(indexPath.row).valueForKey("date"))as! NSString)
            if (arrLblUp.text == "LAX") {
                orangeView.hidden = false
                orangeABLbl.hidden = false
                orangeLocLbl.hidden = false
            }
            /* to show delay in timings in just immediate flight */
            img.image = UIImage(named: "ico-pln_grn@2x.png")
            imgTimeLbl.text = "ON TIME"
            imgTimeLbl.textColor = UIColor(red: 73.0 / 255.0, green: 205.0 / 255.0, blue: 9.0 / 255.0, alpha: 1.0)
            if indexPath.row == 0 {
                img.image = UIImage(named: "ico-pln_orn@2x.png")
                imgTimeLbl.text = "DELAYED"
                imgTimeLbl.textColor = UIColor.redColor()
            }
            cell.accessoryView = UIImageView(image: UIImage(named: "icn-arw.png"))
            cell.accessoryType = .DisclosureIndicator
            
        }
        

        return UITableViewCell()

    }
    
        func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        }
        //to add custom navigation bar items
        
        func addCutomButtonsToNavigationController(navigationController: UINavigationController) {
            let customNavigationTitleView: UIView = UIView(frame: CGRectMake(36, 30, 325, 44))
            let alertButton: UIButton = UIButton(type:UIButtonType.System) as UIButton
            
            
            alertButton.addTarget(self, action: "onAlertClick" , forControlEvents: .TouchUpInside)
            let alertCountLabel: UILabel = UILabel(frame: CGRectMake(246, 14, 15, 10))
            alertCountLabel.textColor = UIColor.whiteColor()
            alertCountLabel.font = UIFont.systemFontOfSize(11)
            alertCountLabel.textAlignment = .Center
            alertCountLabel.text = "4"
            let welLabel: UILabel = UILabel(frame: CGRectMake(158, 9, 80, 20))
            welLabel.backgroundColor = UIColor.clearColor()
            welLabel.text = "WELCOME"
            welLabel.textColor = UIColor.whiteColor()
            welLabel.font = UIFont.systemFontOfSize(10.0)
            welLabel.textAlignment = .Center
            let nameLabel: UILabel = UILabel(frame: CGRectMake(158, 21, 85, 20))
            nameLabel.backgroundColor = UIColor.clearColor()
            nameLabel.text = "SJ A101"
            nameLabel.textColor = UIColor.whiteColor()
            nameLabel.font = UIFont.systemFontOfSize(10.0)
            nameLabel.textAlignment = .Center
            let image: UIImage = UIImage(named: "00_sep@2x.png")!
            let imageview: UIImageView = UIImageView(image: image)
            imageview.frame = CGRectMake(230, 9, 2, 32)
            let navimage: UIImage = UIImage(named: "Small_Logo.png")!
            let navimageview: UIImageView = UIImageView(image: navimage)
            navimageview.frame = CGRectMake(0, 8, 80, 30)
            alertButton.setImage(UIImage(named: "ico-bell_red@2x.png"), forState: .Normal)
            alertButton.frame = CGRectMake(219, 0, 60, 48)
            customNavigationTitleView.addSubview(alertButton)
            customNavigationTitleView.addSubview(alertCountLabel)
            customNavigationTitleView.addSubview(welLabel)
            customNavigationTitleView.addSubview(nameLabel)
            customNavigationTitleView.addSubview(imageview)
            customNavigationTitleView.addSubview(navimageview)
            
            self.navigationItem.titleView = customNavigationTitleView
            
        }
    
    
    func onAlertClick() {

        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)

        self.navigationController!.pushViewController(mainStoryboard.instantiateViewControllerWithIdentifier("notif"), animated: true)
    }
    
    func fetchValues() {
                objDatabaseManager = DatabaseManager.sharedInstance()

        var arrOfColumnName:NSMutableArray = []
             arrOfColumnName = ["crewID", "destID", "fromID", "arvTime", "depTime", "date", "baseStation", "destStation", "gateD", "gateA", "te", "flightType", "vfNo"]
        objDatabaseManager.checkAndStoreSqliteDatabase("flightDtlDB")
        let dateFormatter: NSDateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd-MM-YYYY"
        let todayDateString: String = dateFormatter.stringFromDate(NSDate())
      
        
        arrOfValues = objDatabaseManager.Select(arrOfColumnName as [AnyObject], table: "crewDetails", `where`: "where 1=1")

        print("here:",objDatabaseManager.Select(arrOfColumnName as [AnyObject], table: "crewDetails", `where`: "\("where date =")\("'")\(todayDateString)\("'")"))
        arrOfValuesDate = NSMutableArray(array:(objDatabaseManager.Select(arrOfColumnName as [AnyObject], table: "crewDetails", `where`: "\("where date =")\("'")\(todayDateString)\("'")")))
        
        
        arrOfValuesFiltered = NSMutableArray(array: arrOfValues)
        arrOfValuesFiltered.removeObjectsInArray(arrOfValuesDate as [AnyObject])
        
    
        print("here filteration:",arrOfValuesFiltered)
        

    }
    
    @IBAction func segmentBtn(sender: AnyObject) {
        /* segment view*/
        if slotTimeSgmt.selectedSegmentIndex == 0 {
            //        UIStoryboard* iPhoneStoryBoard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
            //        ViewController = (*)[iPhoneStoryBoard instantiateViewControllerWithIdentifier:@""];
        }
        else if slotTimeSgmt.selectedSegmentIndex == 1 {
           // self.performSegueWithIdentifier("pushToCalendar", sender: self)
        }
    }
}
    