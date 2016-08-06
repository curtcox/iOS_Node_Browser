import UIKit

class OnTap : NSObject {
    
    var call: (() -> Void)
    var view: UIView
    static let log = Log(name: "OnTap")
    static var handlers = [OnTap]()
    
    init(view:UIView, call: (() -> Void)) {
        self.view = view
        self.call = call
        super.init()
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(OnTap.performTheCall)))
    }
    
    static func of(view:UIView,call: (() -> Void)) {
        handlers.append(OnTap(view:view,call:call))
        logCount()
    }
    
    func performTheCall() {
        logTheTap()
        call()
    }
    
    func logTheTap() {
        let named = view as? Named
        if named != nil {
            info("tapped " + named!.getName())
        } else {
            info("tapped " + view.description)
        }
    }
    
    static func remove(view:UIView) {
        remove0(view)
        logCount()
    }
    
    private static func remove0(view:UIView) {
        handlers = handlers.filter({ $0 !== handlerFor(view) })
        for subview in view.subviews {
            remove0(subview)
        }
    }
    
    static func handlerFor(view:UIView) -> OnTap? {
        return handlers.filter({ $0.view == view}).first
    }
    
    static func logCount() {
        log.info("Handlers " + String(handlers.count))
    }
    
    func info(message: String) {
        OnTap.log.info(message)
    }
}