import Foundation

class InstanceCounter {
    
    var count = 0
    var max  : Int
    var name : String
    var log  : Log
    
    init(name:String,max:Int) {
        self.name = name
        self.max  = max
        self.log  = Log(name:name)
    }
    
    func increment() {
        count = count + 1
        log.info("init \(count) instances")
        if count > max {
            log.info("😡😡😡😡😡😡😡😡 max of \(max) exceeded 😡😡😡😡😡😡")
        }
    }
    
    func decrement() {
        count = count - 1
        log.info("deinit \(count) instances")
    }
    
}