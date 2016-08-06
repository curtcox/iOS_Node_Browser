import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var storeManager:    StoreManager?
    let log = Log(name: "AppDelegate")
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        if Config.unitTestMode() {
            return true
        }
        info("Version 1.0.0")
        info("didFinishLaunchingWithOptions")
        storeManager      = StoreManager.instance()
        
        return true
    }
    
    func application(app: UIApplication, openURL url: NSURL, options: [String : AnyObject]) -> Bool {
        if Config.unitTestMode() {
            return true
        }
        info("openURL",url)
        ViewController.show(url)
        return true
    }
    
    func applicationWillResignActive(application: UIApplication)       {info("applicationWillResignActive")}
    func applicationDidEnterBackground(application: UIApplication)     {info("applicationDidEnterBackground")}
    func applicationWillEnterForeground(application: UIApplication)    {info("applicationWillEnterForeground")}
    func applicationDidReceiveMemoryWarning(application: UIApplication){
        MemoryMonitor.receivedMemoryWarning()
    }
    
    func applicationDidBecomeActive(application: UIApplication) {
        if Config.unitTestMode() {
            return
        }
        info("applicationDidBecomeActive")
    }
    
    func applicationWillTerminate(application: UIApplication) {
        info("applicationWillTerminate")
        storeManager!.saveContext()
    }
    
    func info(items: Any...) {
        log.info(items)
    }
}

