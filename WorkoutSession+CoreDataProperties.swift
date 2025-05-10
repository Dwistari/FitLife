//
//  WorkoutSession+CoreDataProperties.swift
//  FitLife
//
//  Created by Dwistari on 10/05/25.
//
//

import Foundation
import CoreData


extension WorkoutSession {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WorkoutSession> {
        return NSFetchRequest<WorkoutSession>(entityName: "WorkoutSession")
    }

    @NSManaged public var date: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var reps: Int16
    @NSManaged public var sets: Int16
    @NSManaged public var weight: Double

}

extension WorkoutSession : Identifiable {

}
