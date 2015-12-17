////
////  MapViewController.h
////  unitedAirlines
////
////  Created by Minal on 31/03/15.
////  Copyright (c) 2015 Syntel. All rights reserved.
////
//import UIKit
//class MapViewController: UIViewController {
//    @IBAction func backbtn(sender: AnyObject) {
//        self.navigationController!.popViewControllerAnimated(true)
//    }
//    var address: String
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.addCutomButtonsToNavigationController(self.navigationController)
//        addLbl.text = self.address
//    }
//    /* generating map images w.r.t. address (not from db) */
//
//    override func viewWillAppear(animated: Bool) {
//        if (addLbl.text == "720 S Michigan Ave, Chicago, IL 60605, United States") {
//            mapVw.image = UIImage(named: "chic.png")
//        }
//        else {
//            if (addLbl.text == "600 S. Colorado Blvd., Denver, Colorado, 80246, USA") {
//                mapVw.image = UIImage(named: "den.png")
//            }
//            else {
//                if (addLbl.text == "711 WEST CENTURY BOULEVARD, LA") {
//                    mapVw.image = UIImage(named: "LV.png")
//                }
//                else {
//                    if (addLbl.text == "1048 Raymond Blvd, Newark, NJ 07102, United States") {
//                        mapVw.image = UIImage(named: "nrk.png")
//                    }
//                    else {
//                        if (addLbl.text == "8801 NW 112 StKansas City, MO, United States") {
//                            mapVw.image = UIImage(named: "kansas.png")
//                        }
//                        else {
//                            if (addLbl.text == " 7728 E. Virgin Court, Tulsa, Oklahoma, 74115, USA ") {
//                                mapVw.image = UIImage(named: "tulsa.png")
//                            }
//                            else {
//                                if (addLbl.text == "711 WEST CENTURY BOULEVARD, LA") {
//                                    mapVw.image = UIImage(named: "LV.png")
//                                }
//                                else {
//                                    if (addLbl.text == "5711 W Century Blvd Los Angeles, CA, United States") {
//                                        mapVw.image = UIImage(named: "LA.png")
//                                    }
//                                }
//                            }
//                        }
//                    }
//                }
//            }
//        }
//        if (addLbl.text == "Antonio Dovali Jaime 70, 01219 Ciudad de México, D.F., Mexico") {
//            mapVw.image = UIImage(named: "mex.png")
//        }
//    }
//
//    func slideNavigationControllerShouldDisplayLeftMenu() -> Bool {
//        return true
//    }
//
//    func slideNavigationControllerShouldDisplayRightMenu() -> Bool {
//        return false
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    /*
//    #pragma mark - Navigation
//    
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//        // Get the new view controller using [segue destinationViewController].
//        // Pass the selected object to the new view controller.
//    }
//    */
//    //to add custom navigation bar items
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
//        var welLabel: UILabel = UILabel(frame: CGRectMake(160, 9, 80, 20))
//        welLabel.backgroundColor = UIColor.clearColor()
//        welLabel.text = "WELCOME"
//        welLabel.textColor = UIColor.whiteColor()
//        welLabel.font = UIFont.systemFontOfSize(10.0)
//        welLabel.textAlignment = .Center
//        var nameLabel: UILabel = UILabel(frame: CGRectMake(160, 21, 85, 20))
//        nameLabel.backgroundColor = UIColor.clearColor()
//        nameLabel.text = "SJ A101"
//        nameLabel.textColor = UIColor.whiteColor()
//        nameLabel.font = UIFont.systemFontOfSize(10.0)
//        nameLabel.textAlignment = .Center
//        var image: UIImage = UIImage(named: "00_sep@2x.png")
//        var imageview: UIImageView = UIImageView(image: image)
//        imageview.frame = CGRectMake(232, 9, 2, 32)
//        var navimage: UIImage = UIImage(named: "Small_Logo.png")
//        var navimageview: UIImageView = UIImageView(image: navimage)
//        navimageview.frame = CGRectMake(0, 8, 80, 30)
//        alertButton.setImage(UIImage(named: "ico-bell_red@2x.png"), forState: .Normal)
//        alertButton.frame = CGRectMake(221, 0, 56, 48)
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
//}
////
////  MapViewController.m
////  unitedAirlines
////
////  Created by Minal on 31/03/15.
////  Copyright (c) 2015 Syntel. All rights reserved.
////