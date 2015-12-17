//
//  FlightDetailsViewController.h
//  unitedAirlines
//
//  Created by Minal on 31/03/15.
//  Copyright (c) 2015 Syntel. All rights reserved.
//
import UIKit
class FlightDetailsViewController: UIViewController, UIScrollViewDelegate, UICollectionViewDelegate, SlideNavigationControllerDelegate {
    var sSubArray: NSMutableArray = []
    var sSubArrOfValuesDate: NSMutableArray = []
    var sSubArrOfValuesFiltered: NSMutableArray = []
    var i: String = ""

//
//    @IBAction func backBtnId(sender: AnyObject) {
//        self.navigationController.popViewControllerAnimated(true)
//    }
//    @IBOutlet var coll: UICollectionView!
//
//    @IBAction func rightBtn(sender: AnyObject) {
//        //    NSArray *visibleItems = [self.coll indexPathsForVisibleItems];
//        //    NSIndexPath *currentItem = [visibleItems objectAtIndex:0];
//        //    if (sSubArrOfValuesDate.count>1)
//        //    {
//        //        if ([visibleItems objectAtIndex:0]== [sSubArrOfValuesDate objectAtIndex:[sSubArrOfValuesDate count]-1])
//        //        {
//        //            rightBtn.userInteractionEnabled = NO;
//        //
//        //        }
//        //        else
//        //        {
//        //    NSIndexPath *nextItem = [NSIndexPath indexPathForItem:currentItem.item + 1 inSection:0];
//        //    [self.coll scrollToItemAtIndexPath:nextItem atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
//        //        }
//        //}
//        //    else
//        //    {
//        //        rightBtn.userInteractionEnabled = NO;
//        //
//        //    }
//        var visibleItems: [AnyObject] = self.coll.indexPathsForVisibleItems()
//        var currentItem: NSIndexPath = visibleItems[0]
//        if arrOfValuesFiltered.count > 1 {
//            if visibleItems[0] == arrOfValuesFiltered[arrOfValuesFiltered.count - 1] {
//                rightBtn.userInteractionEnabled = false
//            }
//            else {
//                var nextItem: NSIndexPath = NSIndexPath.indexPathForItem(currentItem.item, inSection: 0)
//                if currentItem.item + 1 == arrOfValuesFiltered.count {
//                    rightBtn.userInteractionEnabled = false
//                }
//                else {
//                    self.coll.scrollToItemAtIndexPath(nextItem, atScrollPosition: .Left, animated: true)
//                }
//            }
//        }
//        else {
//            rightBtn.userInteractionEnabled = false
//        }
//    }
//
//    @IBAction func leftBtn(sender: AnyObject) {
//        //    NSArray *visibleItems = [self.coll indexPathsForVisibleItems];
//        //    NSIndexPath *currentItem = [visibleItems objectAtIndex:0];
//        //    if (sSubArrOfValuesDate.count>1) {
//        //
//        //    NSIndexPath *nextItem = [NSIndexPath indexPathForItem:currentItem.item + 1 inSection:currentItem.section];
//        //        [self.coll scrollToItemAtIndexPath:nextItem atScrollPosition:UICollectionViewScrollPositionRight animated:YES];
//        //    }
//        //    else
//        //    {
//        //        leftBtn.userInteractionEnabled = NO;
//        //
//        //    }
//        var visibleItems: [AnyObject] = self.coll.indexPathsForVisibleItems()
//        var currentItem: NSIndexPath = visibleItems[0]
//        if arrOfValuesFiltered.count > 1 {
//            if visibleItems[0] == arrOfValuesFiltered[0] {
//                leftBtn.userInteractionEnabled = false
//            }
//            else {
//                var nextItem: NSIndexPath = NSIndexPath.indexPathForItem(currentItem.item - 1, inSection: 0)
//                if currentItem.item - 1 == 1 {
//                    leftBtn.userInteractionEnabled = false
//                }
//                else {
//                    self.coll.scrollToItemAtIndexPath(nextItem, atScrollPosition: .Right, animated: true)
//                }
//            }
//        }
//        else {
//            leftBtn.userInteractionEnabled = false
//        }
//    }
//
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.addCutomButtonsToNavigationController(self.navigationController!)
        //    arrOfValuesFiltered = [NSMutableArray arrayWithArray:self.sSubArrOfValuesDate];
        //    for (NSDictionary *d in self.sSubArray) {
        //        NSMutableArray *newValue = [NSMutableArray array];
        //                [newValue addObject:d];
        //        NSLog(@"%@",newValue);
        //    }
        //   // [arrOfValuesFiltered removeObjectsInArray:self.sSubArray];
        //    NSMutableArray *dictAllKeys=[NSMutableArray arrayWithArray:[sSubArray allKeys]];
        //    NSMutableArray *dictAllValues=[NSMutableArray arrayWithArray:[dict allValues]];
        //    NSMutableArray *keysAndValues=[NSMutableArray arrayWithArray:[dictAllKeys arrayByAddingObjectsFromArray:dictAllValues]];
    }

    func slideNavigationControllerShouldDisplayLeftMenu() -> Bool {
        return true
    }

    func slideNavigationControllerShouldDisplayRightMenu() -> Bool {
        return false
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//
//    func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject) {
//        // Get the new view controller using [segue destinationViewController].
//        // Pass the selected object to the new view controller.
//        if (segue.identifier == "mapFromFlight") {
//            var mapViewController: MapViewController = segue.destinationViewController
//            mapViewController.address = addr
//        }
//    }
//
//    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return sSubArrOfValuesDate.count
//    }
//
//    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
//        var identifier: String = "cell2"
//        var cell: UICollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier(identifier, forIndexPath: indexPath)
//        /* custom lables*/
//        var deptLbl: UILabel = cell.viewWithTag(1) as! UILabel
//        var arrLbl: UILabel = cell.viewWithTag(2) as! UILabel
//        var arrTimeLbl: UILabel = cell.viewWithTag(4) as! UILabel
//        var deptTimeLbl: UILabel = cell.viewWithTag(3) as! UILabel
//        var img: UIImageView = cell.viewWithTag(50) as! UIImageView
//        var imgLbl: UILabel = cell.viewWithTag(51) as! UILabel
//        var dayLbl: UILabel = cell.viewWithTag(5) as! UILabel
//        var dateLbl: UILabel = cell.viewWithTag(6) as! UILabel
//        var stationsLbl: UILabel = cell.viewWithTag(7) as! UILabel
//        var gateDLbl: UILabel = cell.viewWithTag(8) as! UILabel
//        var gateALbl: UILabel = cell.viewWithTag(9) as! UILabel
//        var hotelDateLbl: UILabel = cell.viewWithTag(101) as! UILabel
//        var hotelTimeLbl: UILabel = cell.viewWithTag(102) as! UILabel
//        var hotelStnLbl: UILabel = cell.viewWithTag(103) as! UILabel
//        var hotelInfoLbl: UILabel = cell.viewWithTag(104) as! UILabel
//        var boeingLbl: UILabel = cell.viewWithTag(52) as! UILabel
//        var terminalLbl: UILabel = cell.viewWithTag(53) as! UILabel
//        var vfNoLbl: UILabel = cell.viewWithTag(10) as! UILabel
//        var hotelDateDeptLbl: UILabel = cell.viewWithTag(105) as! UILabel
//        var hotelTimeDeptLbl: UILabel = cell.viewWithTag(106) as! UILabel
//        var hotelStnDeptLbl: UILabel = cell.viewWithTag(107) as! UILabel
//        var view1: UIView = cell.viewWithTag(1000) as! UIView
//        var view2: UIView = cell.viewWithTag(1001) as! UIView
//        var lblHtl: UILabel = cell.viewWithTag(1002) as! UILabel
//        /* date  with different formats */
//        var dateFormat: NSDateFormatter = NSDateFormatter()
//        dateFormat.dateFormat = "yyyy-MM-dd"
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
//        var string: String = week
//        string = string.substringToIndex(3)
//        dayLbl.text = string.stringByAppendingString(",")
//        dateLbl.text = dateString
//        /* arrOfValuesFiltered is subtraction of two arrays- whole array and today's value date array */
//        if self.sSubArray.isKindOfClass([NSObject : AnyObject]) {
//            arrOfValuesFiltered = [AnyObject].arrayWithArray(self.sSubArrOfValuesDate)
//            var arr: [AnyObject] = [AnyObject](objects: self.sSubArray, nil)
//            NSLog("%@", arr)
//            arrOfValuesFiltered.removeObjectsInArray(arr)
//        }
//        else {
//            if self.sSubArray.isKindOfClass([AnyObject]) {
//
//            }
//        }
//        if indexPath.row == 0 {
//            stationsLbl.text = sSubArray["baseStation"].stringByAppendingString(" To ").stringByAppendingString(sSubArray["destStation"])
//            gateDLbl.text = sSubArray["gateD"]
//            gateALbl.text = sSubArray["gateA"]
//            deptLbl.text = self.sSubArray["fromID"]
//            arrLbl.text = self.sSubArray["destID"]
//            arrTimeLbl.text = self.sSubArray["arvTime"]
//            deptTimeLbl.text = self.sSubArray["depTime"]
//            var dateFrmtr: NSDateFormatter = NSDateFormatter()
//            dateFrmtr.dateFormat = "dd/MM/yyyy"
//            var date1: NSDate = dateFrmtr.dateFromString(self.sSubArray["date"])
//            dateLbl.text = format.stringFromDate(date1)
//            self.fetchValues(self.sSubArray["date"])
//            hotelStnLbl.text = self.sSubArray["destID"].stringByAppendingString(" AIRPORT TO HOTEL HILTON")
//            hotelDateLbl.text = dateLbl.text
//            var timeStr: String = self.sSubArray["arvTime"]
//            var strr: String = timeStr.componentsSeparatedByString(":")[0]
//            var value: Int = CInt(strr)!
//            hotelTimeLbl.text = "\(value + 1)".stringByAppendingString(":").stringByAppendingString(timeStr.componentsSeparatedByString(":")[1])
//            var date: NSDate = dateFrmtr.dateFromString(self.sSubArray["date"])
//            var string: String = dateFormatter.stringFromDate(date)
//            string = string.substringToIndex(3)
//            dayLbl.text = string.stringByAppendingString(",")
//            vfNoLbl.text = self.sSubArray["vfNo"].stringByAppendingString(" /")
//            /* custom setting to combine hotels and stations */
//            hotelStnDeptLbl.text = "HOTEL HILTON TO ".stringByAppendingString(self.sSubArray["destID"]).stringByAppendingString(" AIRPORT")
//            hotelDateDeptLbl.text = format.stringFromDate(NSDate(timeInterval: 60 * 60 * 24 * 1, sinceDate: date))
//            if arrOfVal.count > 1 {
//                if (self.i == "0") {
//                    if (arrLbl.text == "DEN") {
//                        view1.hidden = false
//                        view2.hidden = true
//                        lblHtl.hidden = true
//                        hotelInfoLbl.text = arrOfVal["hotelInfo"][1]
//                        addr = arrOfVal["hotelInfo"][1]
//                        terminalLbl.text = arrOfVal["te"][1]
//                        boeingLbl.text = arrOfVal["flightType"][1]
//                        hotelTimeDeptLbl.text = arrOfVal["cabPickUpTime"][1]
//                    }
//                    if (arrLbl.text == "ORD") {
//                        view1.hidden = true
//                        view2.hidden = false
//                        lblHtl.text = "No Information Available!"
//                    }
//                }
//                else {
//                    view1.hidden = false
//                    view2.hidden = true
//                    lblHtl.hidden = true
//                    hotelInfoLbl.text = arrOfVal["hotelInfo"][indexPath.row]
//                    addr = arrOfVal["hotelInfo"][indexPath.row]
//                    terminalLbl.text = arrOfVal["te"][indexPath.row]
//                    boeingLbl.text = arrOfVal["flightType"][indexPath.row]
//                    hotelTimeDeptLbl.text = arrOfVal["cabPickUpTime"][indexPath.row]
//                }
//            }
//            else {
//                view1.hidden = false
//                view2.hidden = true
//                lblHtl.hidden = true
//                hotelInfoLbl.text = arrOfVal["hotelInfo"][0]
//                addr = arrOfVal["hotelInfo"][0]
//                terminalLbl.text = arrOfVal["te"][0]
//                boeingLbl.text = arrOfVal["flightType"][0]
//                hotelTimeDeptLbl.text = arrOfVal["cabPickUpTime"][0]
//            }
//        }
//        else {
//            if arrOfValuesFiltered.count > 1 {
//                view1.hidden = false
//                view2.hidden = true
//                lblHtl.hidden = true
//                deptLbl.text = arrOfValuesFiltered["fromID"][indexPath.row - 1]
//                arrLbl.text = arrOfValuesFiltered["destID"][indexPath.row - 1]
//                arrTimeLbl.text = arrOfValuesFiltered["arvTime"][indexPath.row - 1]
//                deptTimeLbl.text = arrOfValuesFiltered["depTime"][indexPath.row - 1]
//                stationsLbl.text = arrOfValuesFiltered["baseStation"][indexPath.row - 1].stringByAppendingString(" To ").stringByAppendingString(arrOfValuesFiltered["destStation"][indexPath.row - 1])
//                gateDLbl.text = arrOfValuesFiltered["gateD"][indexPath.row - 1]
//                gateALbl.text = arrOfValuesFiltered["gateA"][indexPath.row - 1]
//                var dateFrmtr: NSDateFormatter = NSDateFormatter()
//                dateFrmtr.dateFormat = "dd/MM/yyyy"
//                var date1: NSDate = dateFrmtr.dateFromString(arrOfValuesFiltered["date"][indexPath.row - 1])
//                dateLbl.text = format.stringFromDate(date1)
//                var date: NSDate = dateFrmtr.dateFromString(arrOfValuesFiltered["date"][indexPath.row - 1])
//                var string: String = dateFormatter.stringFromDate(date)
//                string = string.substringToIndex(3)
//                dayLbl.text = string.stringByAppendingString(",")
//                self.fetchValues(arrOfValuesFiltered["date"][indexPath.row - 1])
//                hotelStnLbl.text = arrOfValuesFiltered["destID"][indexPath.row - 1].stringByAppendingString(" AIRPORT TO HOTEL HILTON")
//                hotelStnDeptLbl.text = "HOTEL HILTON TO ".stringByAppendingString(arrOfValuesFiltered["destID"][indexPath.row - 1]).stringByAppendingString(" AIRPORT")
//                hotelDateLbl.text = dateLbl.text
//                var timeStr: String = arrOfValuesFiltered["arvTime"][indexPath.row - 1]
//                var strr: String = timeStr.componentsSeparatedByString(":")[0]
//                var value: Int = CInt(strr)!
//                hotelTimeLbl.text = "\(value + 1)".stringByAppendingString(":").stringByAppendingString(timeStr.componentsSeparatedByString(":")[1])
//                hotelDateDeptLbl.text = format.stringFromDate(NSDate(timeInterval: 60 * 60 * 24 * 1, sinceDate: date))
//                if arrOfVal.count > 1 {
//                    hotelInfoLbl.text = arrOfVal["hotelInfo"][indexPath.row - 1]
//                    addr = arrOfVal["hotelInfo"][indexPath.row - 1]
//                    hotelTimeDeptLbl.text = arrOfVal["cabPickUpTime"][indexPath.row - 1]
//                }
//                else {
//                    hotelInfoLbl.text = arrOfVal["hotelInfo"][0]
//                    addr = arrOfVal["hotelInfo"][0]
//                    hotelTimeDeptLbl.text = arrOfVal["cabPickUpTime"][0]
//                }
//                terminalLbl.text = arrOfVal["te"][0]
//                boeingLbl.text = arrOfVal["flightType"][0]
//                vfNoLbl.text = arrOfValuesFiltered["vfNo"][indexPath.row - 1].stringByAppendingString(" /")
//            }
//            else {
//                view1.hidden = false
//                view2.hidden = true
//                lblHtl.hidden = true
//                deptLbl.text = arrOfValuesFiltered["fromID"][0]
//                arrLbl.text = arrOfValuesFiltered["destID"][0]
//                arrTimeLbl.text = arrOfValuesFiltered["arvTime"][0]
//                deptTimeLbl.text = arrOfValuesFiltered["depTime"][0]
//                stationsLbl.text = arrOfValuesFiltered["baseStation"][0].stringByAppendingString(" To ").stringByAppendingString(arrOfValuesFiltered["destStation"][0])
//                gateDLbl.text = arrOfValuesFiltered["gateD"][0]
//                gateALbl.text = arrOfValuesFiltered["gateA"][0]
//                var dateFrmtr: NSDateFormatter = NSDateFormatter()
//                dateFrmtr.dateFormat = "dd/MM/yyyy"
//                var date1: NSDate = dateFrmtr.dateFromString(arrOfValuesFiltered["date"][0])
//                dateLbl.text = format.stringFromDate(date1)
//                var date: NSDate = dateFrmtr.dateFromString(arrOfValuesFiltered["date"][0])
//                var string: String = dateFormatter.stringFromDate(date)
//                string = string.substringToIndex(3)
//                dayLbl.text = string.stringByAppendingString(",")
//                self.fetchValues(arrOfValuesFiltered["date"][0])
//                hotelStnLbl.text = arrOfValuesFiltered["destID"][0].stringByAppendingString(" AIRPORT TO HOTEL HILTON")
//                hotelStnDeptLbl.text = "HOTEL HILTON TO ".stringByAppendingString(arrOfValuesFiltered["destID"][0]).stringByAppendingString(" AIRPORT")
//                hotelDateLbl.text = dateLbl.text
//                var timeStr: String = arrOfValuesFiltered["arvTime"][0]
//                var strr: String = timeStr.componentsSeparatedByString(":")[0]
//                var value: Int = CInt(strr)!
//                hotelTimeLbl.text = "\(value + 1)".stringByAppendingString(":").stringByAppendingString(timeStr.componentsSeparatedByString(":")[1])
//                hotelDateDeptLbl.text = format.stringFromDate(NSDate(timeInterval: 60 * 60 * 24 * 1, sinceDate: date))
//                if arrOfVal.count > 1 {
//                    if (arrLbl.text == "ORD") {
//                        view1.hidden = true
//                        view2.hidden = false
//                        lblHtl.text = "No Information Available!"
//                    }
//                    else {
//                        hotelInfoLbl.text = arrOfVal["hotelInfo"][indexPath.row]
//                        addr = arrOfVal["hotelInfo"][indexPath.row]
//                        hotelTimeDeptLbl.text = arrOfVal["cabPickUpTime"][indexPath.row]
//                    }
//                }
//                else {
//                    hotelInfoLbl.text = arrOfVal["hotelInfo"][0]
//                    addr = arrOfVal["hotelInfo"][0]
//                    hotelTimeDeptLbl.text = arrOfVal["cabPickUpTime"][0]
//                }
//                terminalLbl.text = arrOfVal["te"][0]
//                boeingLbl.text = arrOfVal["flightType"][0]
//                vfNoLbl.text = arrOfValuesFiltered["vfNo"][0].stringByAppendingString(" /")
//            }
//        }
//        img.image = UIImage(named: "ico-pln_grn@2x.png")
//        imgLbl.text = "ON TIME"
//        imgLbl.textColor = UIColor(red: 73.0 / 255.0, green: 205.0 / 255.0, blue: 9.0 / 255.0, alpha: 1.0)
//        if self.i.isEqual("1") && indexPath.row == 0 {
//            img.image = UIImage(named: "ico-pln_orn@2x.png")
//            imgLbl.text = "DELAYED"
//            imgLbl.textColor = UIColor.redColor()
//        }
//        return cell
//    }
//
//    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
//    }
//
//    @IBAction func btnAction(sender: AnyObject) {
//        //   [self.scrollView setContentOffset:CGPointMake(self.scrollView.contentOffset.x, 0)
//        //  animated:YES];
//    }
//    /* fetching of values from database */
//
//    func fetchValues(strDate: String) {
//        objDatabaseManager = DatabaseManager.sharedInstance()
//        arrOfVal = [AnyObject]()
//        var arrOfColumnName: [AnyObject] = [AnyObject]()
//        arrOfColumnName = [AnyObject](objects: "hotelInfo", "cabInfo", "flightType", "te", "cabPickUpTime", nil)
//        objDatabaseManager.checkAndStoreSqliteDatabase("flightDtlDB")
//        arrOfVal = objDatabaseManager.Select(arrOfColumnName, table: "crewDetails", where: "\("where date =")\("'")\(strDate)\("'")")
//    }
}
