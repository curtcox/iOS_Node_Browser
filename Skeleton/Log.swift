import Foundation

class Log {
    
    var name: String
    
    init(name:String) {
        self.name = name
    }
    
    func info(items: Any...) {
        NSLog(message(items))
    }
    
    func error(items: Any...) {
        NSLog(message(items))
    }
    
    func message(items: Any...) -> String {
        var string = memory() + " " + name + " "
        for item in items {
            string.appendContentsOf(String(item))
        }
        return string
    }
    
    func memory() -> String {
        return String(Memory.resident_size())
    }
}