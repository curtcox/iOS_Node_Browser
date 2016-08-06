
import UIKit

class Windows {
    
    static func visibleViewController() -> UIViewController {
        let app = UIApplication.sharedApplication()
        let window = app.keyWindow!
        return window.visibleViewController!
    }
    
}