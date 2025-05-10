//
//  TrackerLog+CoreDataProperties.swift
//  FitLife
//
//  Created by Dwistari on 10/05/25.
//
//

import Foundation
import CoreData


extension TrackerLog {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TrackerLog> {
        return NSFetchRequest<TrackerLog>(entityName: "TrackerLog")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?

}

extension TrackerLog : Identifiable {

}
