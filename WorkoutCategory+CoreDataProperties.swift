//
//  WorkoutCategory+CoreDataProperties.swift
//  FitLife
//
//  Created by Dwistari on 10/05/25.
//
//

import Foundation
import CoreData


extension WorkoutCategory {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WorkoutCategory> {
        return NSFetchRequest<WorkoutCategory>(entityName: "WorkoutCategory")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?

}

extension WorkoutCategory : Identifiable {

}
