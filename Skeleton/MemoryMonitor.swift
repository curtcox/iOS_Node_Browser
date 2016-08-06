import Foundation

class MemoryMonitor {
    
    private static var memoryAvailable = true
    static let log = Log(name: "Memory")
    
    static func receivedMemoryWarning() {
        memoryAvailable = false
        info("applicationDidReceiveMemoryWarning")
        Alerts.showAlert("Memory warning")
    }
    
    static func info(items: Any...) {
        log.info(items)
    }
    
    static func memoryIsAvailable() -> Bool {
        return memoryAvailable
    }
}