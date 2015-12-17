////
////  CalendarViewController.h
////  unitedAirlines
////
////  Created by Minal on 30/03/15.
////  Copyright (c) 2015 Syntel. All rights reserved.
////
import UIKit
class CalendarViewController: UIViewController, SlideNavigationControllerDelegate, UITableViewDelegate {
    //VRGCalendarViewDelegate
//    @IBOutlet var calendarView: UIView! {
//        get {
//            // if (month==[[NSDate date] month]) {
//            var date1: NSDate = NSDate()
//            var calendar: NSCalendar = NSCalendar.currentCalendar()
//            var comps: NSDateComponents = calendar.components(.Day, fromDate: NSDate(timeInterval: 60 * 60 * 24 * 1, sinceDate: date1))
//            var day: Int = comps.day()
//            var dates: [AnyObject] = [Int(day + 1), Int(day + 3), Int(day + 4)]
//            calendarView.markDates(dates)
//            // }
//        }
//    }
//
//    @IBOutlet var calendr: UITableView!
//
//    @IBAction func backBtn(sender: AnyObject) {
//        self.navigationController.popViewControllerAnimated(true)
//    }
//
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        var calendar: VRGCalendarView = VRGCalendarView()
//        calendar.delegate = self
//        self.calendarView.addSubview(calendar)
//        self.addCutomButtonsToNavigationController(self.navigationController)
    }

    override func viewWillAppear(animated: Bool) {
       // self.calendr.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//     - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//     // Get the new view controller using [segue destinationViewController].
//     // Pass the selected object to the new view controller.
//     }
//     */
//
    func slideNavigationControllerShouldDisplayLeftMenu() -> Bool {
        return true
    }

    func slideNavigationControllerShouldDisplayRightMenu() -> Bool {
        return false
    }
//
//    func calendarView(calendarView: VRGCalendarView, dateSelected date: NSDate) {
//        NSLog("Selected date = %@", date)
//        //    string1 = [NSString string];
//        var dateFormat: NSDateFormatter = NSDateFormatter()
//        dateFormat.dateFormat = "dd-MM-yyyy"
//        string1 = dateFormat.stringFromDate(date)
//        self.fetchValues()
//        self.calendr.reloadData()
//    }
//
//    func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject) {
//        // Get the new view controller using [segue destinationViewController].
//        // Pass the selected object to the new view controller.
//        if (segue.identifier == "mapFromCal") {
//            var mapViewController: MapViewController = segue.destinationViewController
//            //        mapViewController.address = @"711 WEST CENTURY BOULEVARD,US" ;
//            if arrOfValuesDate.count > 0 {
//                mapViewController.address = arrOfValuesDate["hotelInfo"][0]
//            }
//            else {
//                mapViewController.address = "711 WEST CENTURY BOULEVARD,US"
//            }
//        }
//    }
//
//    func addCutomButtonsToNavigationController(navigationController: UINavigationController) {
//        var customNavigationTitleView: UIView = UIView(frame: CGRectMake(36, 30, 325, 44))
//        var alertButton: UIButton = UIButton.buttonWithType(.Custom)
//        // UIButton *logoutButton=[UIButton buttonWithType:UIButtonTypeCustom];
//        // [logoutButton addTarget:self action:@selector(onLogoutClick) forControlEvents:UIControlEventTouchUpInside];
//        alertButton.addTarget(self, action: "onAlertClick", forControlEvents: .TouchUpInside)
//        //    UIView *customView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
//        var alertCountLabel: UILabel = UILabel(frame: CGRectMake(246, 14, 15, 10))
//        alertCountLabel.textColor = UIColor.whiteColor()
//        alertCountLabel.font = UIFont.systemFontOfSize(11)
//        alertCountLabel.textAlignment = .Center
//        alertCountLabel.text = "4"
//        //        UILabel *navLabel = [[UILabel alloc] initWithFrame:CGRectMake(40,14, 150, 20)];
//        //        navLabel.backgroundColor = [UIColor clearColor];
//        //        navLabel.text = @"Home";
//        //        navLabel.textColor = [UIColor whiteColor];
//        //        navLabel.font = [UIFont fontWithName:@"System Bold" size:14.0];
//        //        navLabel.textAlignment = NSTextAlignmentCenter;
//        var welLabel: UILabel = UILabel(frame: CGRectMake(158, 9, 80, 20))
//        welLabel.backgroundColor = UIColor.clearColor()
//        welLabel.text = "WELCOME"
//        welLabel.textColor = UIColor.whiteColor()
//        welLabel.font = UIFont.systemFontOfSize(10.0)
//        welLabel.textAlignment = .Center
//        var nameLabel: UILabel = UILabel(frame: CGRectMake(158, 21, 85, 20))
//        nameLabel.backgroundColor = UIColor.clearColor()
//        nameLabel.text = "SJ A101"
//        nameLabel.textColor = UIColor.whiteColor()
//        nameLabel.font = UIFont.systemFontOfSize(10.0)
//        nameLabel.textAlignment = .Center
//        var image: UIImage = UIImage(named: "00_sep@2x.png")
//        var imageview: UIImageView = UIImageView(image: image)
//        imageview.frame = CGRectMake(230, 9, 2, 32)
//        var navimage: UIImage = UIImage(named: "Small_Logo.png")
//        var navimageview: UIImageView = UIImageView(image: navimage)
//        navimageview.frame = CGRectMake(0, 8, 80, 30)
//        alertButton.setImage(UIImage(named: "ico-bell_red@2x.png"), forState: .Normal)
//        alertButton.frame = CGRectMake(219, 0, 60, 48)
//        customNavigationTitleView.addSubview(alertButton)
//        customNavigationTitleView.addSubview(alertCountLabel)
//        customNavigationTitleView.addSubview(welLabel)
//        customNavigationTitleView.addSubview(nameLabel)
//        customNavigationTitleView.addSubview(imageview)
//        customNavigationTitleView.addSubview(navimageview)
//        //self.navigationItem.backBarButtonItem.image = [UIImage imageNamed:@"back_header_icon.png"];
//        self.navigationItem.titleView = customNavigationTitleView
//    }
//
//    func onAlertClick() {
//        //    UIAlertView* alert1 = [[UIAlertView alloc]initWithTitle:@"V FLY" message:@"You have few Notifications" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"See Notifications", nil];
//        //    [alert1 show];
//        var notTableViewContrl: notTableViewController = self.storyboard.instantiateViewControllerWithIdentifier("notif")
//        self.navigationController.pushViewController(notTableViewContrl, animated: true)
//    }
//
//    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
//        if buttonIndex == 1 {
//            var notTableViewContrl: notTableViewController = self.storyboard.instantiateViewControllerWithIdentifier("notif")
//            self.navigationController.pushViewController(notTableViewContrl, animated: true)
//        }
//    }
//
//    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        // Return the number of sections.
//        return 1
//    }
//
//    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // Return the number of rows in the section.
//        return 1
//    }
//
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        var cell: UITableViewCell
//        var CellIdentifier: String = "cell1"
//        cell = tableView.dequeueReusableCellWithIdentifier(CellIdentifier)
//        if cell == nil {
//            cell = UITableViewCell(style: .Default, reuseIdentifier: CellIdentifier)
//        }
//        var dateFormat: NSDateFormatter = NSDateFormatter()
//        dateFormat.dateFormat = "dd-MM-yyyy"
//        var format: NSDateFormatter = NSDateFormatter()
//        format.dateFormat = "MMM dd, yyyy"
//        var timeFormat: NSDateFormatter = NSDateFormatter()
//        timeFormat.dateFormat = "HH:mm:ss"
//        var dateFormatter: NSDateFormatter = NSDateFormatter()
//        dateFormatter.dateFormat = "EEEE,"
//        var now: NSDate = NSDate()
//        var dateString: String = format.stringFromDate(now)
//        var theDate: String = dateFormat.stringFromDate(now)
//        var theTime: String = timeFormat.stringFromDate(now)
//        var week: String = dateFormatter.stringFromDate(now)
//        "\n"
//        n, theDate, theTime, dateString, week)
//        var dayLabel: UILabel = cell.viewWithTag(11) as! UILabel
//        var dateLabel: UILabel = cell.viewWithTag(12) as! UILabel
//        var arrTimeLabel: UILabel = cell.viewWithTag(102) as! UILabel
//        var arrLabel: UILabel = cell.viewWithTag(2) as! UILabel
//        var dptTimeLabel: UILabel = cell.viewWithTag(104) as! UILabel
//        var gateLabel: UILabel = cell.viewWithTag(105) as! UILabel
//        var daytobLabel: UILabel = cell.viewWithTag(3) as! UILabel
//        var gateNLabel: UILabel = cell.viewWithTag(5) as! UILabel
//        var sepLabel: UIImageView = cell.viewWithTag(6) as! UIImageView
//        var hotelNLabel: UILabel = cell.viewWithTag(7) as! UILabel
//        var iconLabel: UIImageView = cell.viewWithTag(8) as! UIImageView
//        var icon2Label: UIImageView = cell.viewWithTag(13) as! UIImageView
//        var icon3Label: UIImageView = cell.viewWithTag(15) as! UIImageView
//        var sep1Label: UIImageView = cell.viewWithTag(9) as! UIImageView
//        var sep2Label: UIImageView = cell.viewWithTag(11) as! UIImageView
//        var pickUplbl: UILabel = cell.viewWithTag(10) as! UILabel
//        dayLabel.text = dateString.componentsSeparatedByString(",")[0]
//        dateLabel.text = dateString.componentsSeparatedByString(",")[0]
//        var string: String = week
//        string = string.substringToIndex(3)
//        daytobLabel.text = string
//        self.fetchValues()
//        if arrOfValuesDate.count > 0 {
//            dptTimeLabel.text = arrOfValuesDate["depTime"][indexPath.row]
//            var timeStr: String = arrOfValuesDate["arvTime"][indexPath.row]
//            /*to add 1 hr with NSFormatter use ths code
//                     NSString* timeStr = [[arrTimeLabel.text componentsSeparatedByString:@" "] objectAtIndex:0];
//                     
//                     NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//                     
//                     [formatter setLocale:[NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"]];
//                     
//                     [formatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"GMT"]];
//                     
//                     [formatter setDateFormat:@"HH:mm"];
//                     
//                     NSDate* result = [formatter dateFromString:timeStr];
//                     
//                     int hoursToAdd = 1;
//                     
//                     NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
//                     
//                     NSDateComponents *components = [[NSDateComponents alloc] init];
//                     
//                     [components setHour:hoursToAdd];
//                     
//                     NSDate *newDate= [calendar dateByAddingComponents:components toDate:result options:0];
//                     
//                     [formatter setDateStyle:NSDateFormatterMediumStyle];
//                     
//                     [formatter setTimeStyle:NSDateFormatterMediumStyle];
//                     
//                     NSString* resultDate = [formatter stringFromDate:newDate];
//                     
//                     NSLog(@"New Date and Time: %@",[[[[[resultDate componentsSeparatedByString:@", "] objectAtIndex:2] componentsSeparatedByString:@":00"] objectAtIndex:0] stringByAppendingString:[[arrTimeLabel.text componentsSeparatedByString:@" "] objectAtIndex:1]]);
//                     
//                     */
//            //or add 1 hr by using int convertion
//            var string: String = timeStr.componentsSeparatedByString(":")[0]
//            var value: Int = CInt(string)!
//            arrTimeLabel.text = "\(value + 1)".stringByAppendingString(":").stringByAppendingString(timeStr.componentsSeparatedByString(":")[1])
//        }
//        if (string1 == dateFormat.stringFromDate(NSDate(timeInterval: 60 * 60 * 24 * 2, sinceDate: NSDate()))) {
//            dayLabel.text = format.stringFromDate(NSDate(timeInterval: 60 * 60 * 24 * 2, sinceDate: NSDate()))
//            dateLabel.text = format.stringFromDate(NSDate(timeInterval: 60 * 60 * 24 * 2, sinceDate: NSDate()))
//            if arrOfValuesDate.count > 0 {
//                arrLabel.text = arrOfValuesDate["fromID"][indexPath.row].stringByAppendingString(" TO ").stringByAppendingString(arrOfValuesDate["destID"][indexPath.row])
//                gateLabel.text = arrOfValuesDate["gateD"][indexPath.row]
//                gateLabel.hidden = false
//                daytobLabel.hidden = false
//                gateNLabel.hidden = false
//                sepLabel.hidden = false
//                iconLabel.hidden = false
//                hotelNLabel.hidden = false
//                pickUplbl.hidden = false
//                icon2Label.hidden = false
//                sep1Label.hidden = false
//                sep2Label.hidden = false
//                icon3Label.hidden = false
//            }
//        }
//        else {
//            if (string1 == dateFormat.stringFromDate(NSDate(timeInterval: 60 * 60 * 24 * 4, sinceDate: NSDate()))) {
//                dayLabel.text = format.stringFromDate(NSDate(timeInterval: 60 * 60 * 24 * 4, sinceDate: NSDate()))
//                dateLabel.text = format.stringFromDate(NSDate(timeInterval: 60 * 60 * 24 * 4, sinceDate: NSDate()))
//                if arrOfValuesDate.count > 0 {
//                    arrLabel.text = arrOfValuesDate["fromID"][indexPath.row].stringByAppendingString(" TO ").stringByAppendingString(arrOfValuesDate["destID"][indexPath.row])
//                    gateLabel.text = arrOfValuesDate["gateD"][indexPath.row]
//                    gateLabel.hidden = false
//                    daytobLabel.hidden = false
//                    gateNLabel.hidden = false
//                    sepLabel.hidden = false
//                    iconLabel.hidden = false
//                    hotelNLabel.hidden = false
//                    pickUplbl.hidden = false
//                    icon2Label.hidden = false
//                    sep1Label.hidden = false
//                    sep2Label.hidden = false
//                    icon3Label.hidden = false
//                }
//            }
//            else {
//                if (string1 == dateFormat.stringFromDate(NSDate(timeInterval: 60 * 60 * 24 * 5, sinceDate: NSDate()))) {
//                    dayLabel.text = format.stringFromDate(NSDate(timeInterval: 60 * 60 * 24 * 5, sinceDate: NSDate()))
//                    dateLabel.text = format.stringFromDate(NSDate(timeInterval: 60 * 60 * 24 * 5, sinceDate: NSDate()))
//                    if arrOfValuesDate.count > 0 {
//                        arrLabel.text = arrOfValuesDate["fromID"][indexPath.row].stringByAppendingString(" TO ").stringByAppendingString(arrOfValuesDate["destID"][indexPath.row])
//                        gateLabel.text = arrOfValuesDate["gateD"][indexPath.row]
//                        gateLabel.hidden = false
//                        daytobLabel.hidden = false
//                        gateNLabel.hidden = false
//                        sepLabel.hidden = false
//                        iconLabel.hidden = false
//                        hotelNLabel.hidden = false
//                        pickUplbl.hidden = false
//                        icon2Label.hidden = false
//                        sep1Label.hidden = false
//                        sep2Label.hidden = false
//                        icon3Label.hidden = false
//                    }
//                }
//                else {
//                    gateLabel.hidden = true
//                    daytobLabel.hidden = true
//                    gateNLabel.hidden = true
//                    sepLabel.hidden = true
//                    iconLabel.hidden = true
//                    hotelNLabel.hidden = true
//                    pickUplbl.hidden = true
//                    icon2Label.hidden = true
//                    sep1Label.hidden = true
//                    sep2Label.hidden = true
//                    icon3Label.hidden = true
//                    arrLabel.text = "No data found"
//                    dayLabel.text = ""
//                    dateLabel.text = ""
//                    gateLabel.text = ""
//                    arrTimeLabel.text = ""
//                    dptTimeLabel.text = ""
//                }
//            }
//        }
//        cell.accessoryType = .None
//        return cell
//    }
//
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//    }
//
//    func fetchValues() {
//        objDatabaseManager = DatabaseManager.sharedInstance()
//        objDatabaseManager.checkAndStoreSqliteDatabase("flightDtlDB")
//        arrOfValues = [AnyObject]()
//        var arrOfColumnName: [AnyObject] = [AnyObject]()
//        arrOfColumnName = [AnyObject](objects: "crewID", "destID", "fromID", "arvTime", "depTime", "date", "gateD", "hotelInfo", nil)
//        arrOfValuesDate = objDatabaseManager.Select(arrOfColumnName, table: "crewDetails", where: "\("where date =")\("'")\(string1)\("'")")
//        arrOfValues = objDatabaseManager.Select(arrOfColumnName, table: "crewDetails", where: "where 1=1")
//        NSLog("%lu", UInt(arrOfValues.count))
//        NSLog("%lu", UInt(arrOfValuesDate.count))
//    }
    
    
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
}
