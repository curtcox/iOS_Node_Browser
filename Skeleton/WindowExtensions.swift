import UIKit

public extension UIWindow {
    
    public var visibleViewController: UIViewController? {
        return UIWindow.getVisibleViewControllerFrom(self.rootViewController)
    }
    
    public static func getVisibleViewControllerFrom(viewController: UIViewController?) -> UIViewController? {
        if let navigationController = viewController as? UINavigationController {
            return UIWindow.getVisibleViewControllerFrom(navigationController.visibleViewController)
        } else if let tabBarController = viewController as? UITabBarController {
            return UIWindow.getVisibleViewControllerFrom(tabBarController.selectedViewController)
        } else {
            if let pvc = viewController?.presentedViewController {
                return UIWindow.getVisibleViewControllerFrom(pvc)
            } else {
                return viewController
            }
        }
    }
}