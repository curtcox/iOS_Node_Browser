import Foundation
import CoreData

extension File {

    @NSManaged var name: String?
    @NSManaged var sources: NSSet?
    @NSManaged var tags: NSSet?

}
