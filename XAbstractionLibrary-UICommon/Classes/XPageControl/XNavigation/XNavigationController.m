//
//  XNavigationController.m
//  XAbstractionLibrary-UICommon
//
//  Created by lanbiao on 2018/7/30.
//

#import "XNavigationController.h"
#import <XAbstractionLibrary_Base/XAbstractionLibrary-Base-umbrella.h>

@interface XNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation XNavigationController

- (instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    if(self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]){
        self.navigationBarHidden = YES;
        self.delegate = self;
        CGFloat version = [[[UIDevice currentDevice] systemVersion] floatValue];
        if(version >= 7.0){
            self.edgesForExtendedLayout = UIRectEdgeNone;
            if(version <= 11.0){
                self.automaticallyAdjustsScrollViewInsets = NO;
            }else{
                //11.0以后的OS需要设置ScrollView的contentInsetAdjustmentBehavior
            }
        }
    }
    return self;
}

- (BOOL) shouldAutorotate{
    return NO;
}

- (UIInterfaceOrientationMask) supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskPortrait;
}

- (UIInterfaceOrientation) preferredInterfaceOrientationForPresentation{
    return UIInterfaceOrientationPortrait;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    [super pushViewController:viewController animated:animated];
}

- (UIViewController *) popViewControllerAnimated:(BOOL)animated{
    return [super popViewControllerAnimated:animated];
}

- (NSArray<UIViewController *> *)popToRootViewControllerAnimated:(BOOL)animated{
    return [super popToRootViewControllerAnimated:animated];
}

- (NSArray<UIViewController *> *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated{
    return [super popToViewController:viewController animated:animated];
}

#pragma mark --
#pragma mark UINavigationControllerDelegate
- (void)navigationController:(UINavigationController *)navigationController
      willShowViewController:(UIViewController *)viewController
                    animated:(BOOL)animated{
    
}

- (void)navigationController:(UINavigationController *)navigationController
       didShowViewController:(UIViewController *)viewController
                    animated:(BOOL)animated{
    if(self.currentNavigationDelegate &&
       [self.currentNavigationDelegate respondsToSelector:@selector(navigationControllerChange:)]){
        [self.currentNavigationDelegate navigationControllerChange:viewController];
    }
}

- (UIInterfaceOrientationMask)navigationControllerSupportedInterfaceOrientations:(UINavigationController *)navigationController{
    return UIInterfaceOrientationMaskPortrait;
}

- (UIInterfaceOrientation)navigationControllerPreferredInterfaceOrientationForPresentation:(UINavigationController *)navigationController{
    return UIInterfaceOrientationPortrait;
}

- (nullable id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                                   interactionControllerForAnimationController:(id <UIViewControllerAnimatedTransitioning>) animationController{
    return NULL;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *) toVC{
    return NULL;
}

#pragma mark --
#pragma mark --UIGestureRecognizerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    NSArray *controllers = [self viewControllers];
    if([controllers count] > 1)
        return YES;
    else
        return NO;
}

@end
