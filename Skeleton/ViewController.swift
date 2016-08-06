 import UIKit
 import MapKit
 
 class ViewController: Controller {
    
    let tap = Buttons.tap()
    let log = Log(name: "ViewController")
    
    static var currentlyShowing:   ViewController?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = Colors.black()
        addViews()
        addEventHandlers()
        ViewController.currentlyShowing = self
    }
    
    func addViews() {
        addSubviewAt(tap, frame: centerMiddle(tap))
    }
    
    func addEventHandlers() {
        OnTap.of(tap, call:{ self.onTap() })
    }
    
    func onTap() {
        Alerts.showAlert("tapped")
    }
    
    static func showing() -> ViewController {
        return currentlyShowing!
    }
    
    static func show(url:NSURL) {
        Alerts.showAlert(String(url))
    }
    
    static func isCurrentlyShowing() -> Bool {
        return currentlyShowing == Windows.visibleViewController()
    }
    
 }
 
 
