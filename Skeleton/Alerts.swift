import UIKit

class Alerts {
    
    static func showAlert(message:String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.Default, handler:nil))
        viewController().presentViewController(alert, animated:animated(), completion: nil)
    }
    
    static func viewController() -> UIViewController {
        return Windows.visibleViewController()
    }
    
    static func animated() -> Bool {
        return Config.animated()
    }
    
}