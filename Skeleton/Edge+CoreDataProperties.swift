import Foundation
import CoreData

extension Edge {

    @NSManaged var relationship: NSManagedObject?
    @NSManaged var node1: Node?
    @NSManaged var node2: Node?
    @NSManaged var sources: NSSet?

}
