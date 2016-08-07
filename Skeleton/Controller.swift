import UIKit

class Controller : UIViewController {
    
    static let counter = InstanceCounter(name:"Controller",max:1)
    
    init() {
        Controller.counter.increment()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        Controller.counter.increment()
        super.init(coder: aDecoder)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        Controller.counter.increment()
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override func loadView() {
        super.loadView()
        addViews()
        addEventHandlers()
    }

    override func didRotateFromInterfaceOrientation(fromInterfaceOrientation: UIInterfaceOrientation) {
        removeViews()
        addViews()
    }

    func addViews()          {}
    func addEventHandlers()  {}

    func removeViews() {
        for subview in view.subviews {
            subview.removeFromSuperview()
        }
    }

    func presentViewController(viewControllerToPresent: UIViewController) {
        presentViewController(viewControllerToPresent, animated:animated(), completion:{})
    }
    
    func dismissViewController() {
        OnTap.remove(view)
        dismissViewControllerAnimated(animated(), completion: {})
    }
    
    func animated() -> Bool {
        return Config.animated()
    }
    
    func removeViews(views:[UIView?]) {
        for view in views {
            view?.removeFromSuperview()
        }
    }
    
    deinit {
        Controller.counter.decrement()
    }
    
}