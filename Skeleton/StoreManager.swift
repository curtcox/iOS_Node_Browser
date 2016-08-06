import CoreData

class StoreManager {
    
    static let log = Log(name: "StoreManager")
    var context: NSManagedObjectContext
    static let singleton = StoreManager()
    
    init() {
        let model = StoreManager.createModel()
        let coordinator = StoreManager.createCoordinator(model)
        context = StoreManager.createContext(coordinator)
    }
    
    static func instance() -> StoreManager {
        return singleton
    }
    
    static func directoryURL() -> NSURL {
        let urls = fileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        return urls[urls.count-1]
    }
    
    static func dbURL() -> NSURL {
        return directoryURL().URLByAppendingPathComponent("SingleViewCoreData.sqlite")
    }
    
    static func modelURL() -> NSURL {
        return NSBundle.mainBundle().URLForResource("Skeleton", withExtension: "momd")!
    }
    
    static func createModel() -> NSManagedObjectModel {
        return NSManagedObjectModel(contentsOfURL: modelURL())!
    }
    
    static func createCoordinator(model:NSManagedObjectModel) -> NSPersistentStoreCoordinator {
        if let coordinator = tryCreateCoordinator1(model) {
            return coordinator
        }
        deleteDatabaseDir()
        createDatabaseDir()
        return tryCreateCoordinator2(model)!
    }
    
    static func fileManager() -> NSFileManager {
        return NSFileManager.defaultManager()
    }
    
    static func deleteDatabaseDir() {
        do {
            try fileManager().removeItemAtURL(directoryURL())
            log.info("Database dir deleted")
        } catch {
            log.error(error)
        }
    }
    
    static func createDatabaseDir() {
        do {
            try fileManager().createDirectoryAtURL(directoryURL(), withIntermediateDirectories: true, attributes: [:])
            log.info("Database dir created")
        } catch {
            log.error(error)
        }
    }
    
    static func tryCreateCoordinator1(model:NSManagedObjectModel) -> NSPersistentStoreCoordinator? {
        do {
            let coordinator = NSPersistentStoreCoordinator(managedObjectModel:model)
            try coordinator.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: dbURL(), options: nil)
            return coordinator
        } catch {
            log.error(error)
        }
        
        return nil
    }
    
    static func tryCreateCoordinator2(model:NSManagedObjectModel) -> NSPersistentStoreCoordinator? {
        do {
            let coordinator = NSPersistentStoreCoordinator(managedObjectModel:model)
            try coordinator.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: dbURL(), options: nil)
            return coordinator
        } catch {
            abortWithError(error)
        }
        
        return nil
    }
    
    static func createContext(coordinator:NSPersistentStoreCoordinator) -> NSManagedObjectContext {
        let context = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
        context.persistentStoreCoordinator = coordinator
        return context
    }
    
    func saveContext () {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                StoreManager.abortWithError(error)
            }
        }
    }
    
    static func abortWithError(error: ErrorType) {
        log.error(error)
        let nserror = error as NSError
        NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
        abort()
    }
    
}