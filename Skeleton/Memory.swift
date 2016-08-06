import Foundation

class Memory {
    
    static func resident_size() -> Int {
        let name = mach_task_self_
        let flavor = task_flavor_t(TASK_BASIC_INFO)
        let basicInfo = task_basic_info()
        var size: mach_msg_type_number_t = mach_msg_type_number_t(sizeofValue(basicInfo))
        let pointerOfBasicInfo = UnsafeMutablePointer<task_basic_info>.alloc(1)
        
        let kerr: kern_return_t = task_info(name, flavor, UnsafeMutablePointer(pointerOfBasicInfo), &size)
        let info = pointerOfBasicInfo.move()
        pointerOfBasicInfo.dealloc(1)
        
        if kerr == KERN_SUCCESS {
            return Int(info.resident_size)
        } else {
            return 0
        }
    }
    
}