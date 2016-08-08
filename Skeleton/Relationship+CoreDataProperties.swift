import Foundation
import CoreData

extension Relationship {

    @NSManaged var forward: Node?
    @NSManaged var reverse: Node?
    @NSManaged var sources: NSSet?

}
