import Foundation
import CoreData

extension Node {

    @NSManaged var name: String?
    @NSManaged var about: String?
    @NSManaged var files: NSSet?
    @NSManaged var tags: NSSet?
    @NSManaged var sources: NSSet?

}
