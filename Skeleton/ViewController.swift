 import UIKit
 import MapKit
 
 class ViewController: Controller {
    
    let tap = Buttons.tap()
    let log = Log(name: "ViewController")
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = Colors.black()
        addViews()
        addEventHandlers()
    }
    
    override func addViews() {
        addSubviewAt(tap, frame: centerMiddle(tap))
    }
    
    override func addEventHandlers() {
        OnTap.of(tap, call:{ self.onTap() })
    }
    
    func onTap() {
        Alerts.showAlert("tapped")
    }
    
    static func show(url:NSURL) {
        Alerts.showAlert(String(url))
    }
    
 }
 
 
