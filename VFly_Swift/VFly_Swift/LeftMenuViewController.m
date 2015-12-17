//
//  MenuViewController.m
//  SlideMenu
//
//   
//

#import "LeftMenuViewController.h"
#import "SlideNavigationContorllerAnimatorFade.h"
#import "SlideNavigationContorllerAnimatorSlide.h"
#import "SlideNavigationContorllerAnimatorScale.h"
#import "SlideNavigationContorllerAnimatorScaleAndFade.h"
#import "SlideNavigationContorllerAnimatorSlideAndFade.h"

@implementation LeftMenuViewController

#pragma mark - UIViewController Methods -

- (id)initWithCoder:(NSCoder *)aDecoder
{
	self.slideOutAnimationEnabled = YES;
	
	return [super initWithCoder:aDecoder];
}

- (void)viewDidLoad
{
	[super viewDidLoad];
	
//	self.tableView.separatorColor = [UIColor lightGrayColor];
	
//	UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"leftMenu.jpg"]];
//	self.tableView.backgroundView = imageView;
    self.tableView.backgroundColor = [UIColor colorWithRed:35.0/255 green:35.0/255 blue:35.0/255 alpha:1.0];
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];

}

-(void)viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];
  [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
}
#pragma mark - UITableView Delegate & Datasrouce -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return 5;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
	UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 20)];
	view.backgroundColor = [UIColor clearColor];
	return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
	return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"leftMenuCell"];
	
    UILabel* dashboardLabel = (UILabel*)[cell viewWithTag:1];
    UIImageView * iconImageView = (UIImageView *)[cell viewWithTag:2];


	switch (indexPath.row)
	{
		case 0:

			dashboardLabel.text = @"Dashboard";
            iconImageView.image = [UIImage imageNamed:@"ico_home@2x"];
			break;
			
		case 1:
            dashboardLabel.text = @"Settings";
            iconImageView.image = [UIImage imageNamed:@"ico-settings@2x"];
			break;
			
		case 2:
            dashboardLabel.text = @"Profile";
            iconImageView.image = [UIImage imageNamed:@"icn-usr@2x.png"];
			break;
			
		case 3:
			dashboardLabel.text = @"Logout";
            iconImageView.image = [UIImage imageNamed:@"ico_logout@2x"];
			break;
        case 4:
            dashboardLabel.text = @"Notifications";
            iconImageView.image = [UIImage imageNamed:@"ico-notification-active@2x"];
            break;
	}
	
    UIView *bgColorView = [[UIView alloc] init];
   // bgColorView.backgroundColor = [UIColor colorWithRed:255.0/256.0 green:239.0/256.0 blue:49.0/256.0 alpha:1];
    bgColorView.backgroundColor = [UIColor blackColor];
    bgColorView.layer.cornerRadius = 7;
    bgColorView.layer.masksToBounds = YES;
    [cell setSelectedBackgroundView:bgColorView];
	
	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main"
															 bundle: nil];
	
	UIViewController *vc ;
	
	switch (indexPath.row)
	{
		case 0:
			vc = [mainStoryboard instantiateViewControllerWithIdentifier: @"home"];
			break;
			
		case 1:
			vc = [mainStoryboard instantiateViewControllerWithIdentifier: @"home"];
			break;
			
		case 2:
			vc = [mainStoryboard instantiateViewControllerWithIdentifier: @"home"];
			break;
			
		case 3:
			[self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
			[[SlideNavigationController sharedInstance] popToRootViewControllerAnimated:YES];
			return;
			break;
        case 4:
            vc = [mainStoryboard instantiateViewControllerWithIdentifier: @"notif"];

//            UIAlertView *alert1 = [[UIAlertView alloc]initWithTitle:@"V FLY" message:@"You have few Notifications" delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil, nil];
//            [alert1 show];
            
            break;
	}
	
	[[SlideNavigationController sharedInstance] popToRootAndSwitchToViewController:vc
															 withSlideOutAnimation:self.slideOutAnimationEnabled
																	 andCompletion:nil];
}

@end
