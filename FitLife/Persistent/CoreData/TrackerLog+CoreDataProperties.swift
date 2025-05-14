//
//  TrackerLog+CoreDataProperties.swift
//  FitLife
//
//  Created by Dwistari on 13/05/25.
//
//

import Foundation
import CoreData


extension TrackerLog {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TrackerLog> {
        return NSFetchRequest<TrackerLog>(entityName: "TrackerLog")
    }

    @NSManaged public var date: Date?
    @NSManaged public var name: String?
    @NSManaged public var reps: Int16
    @NSManaged public var sets: Int16
    @NSManaged public var weight: Double

}

extension TrackerLog : Identifiable {

}
