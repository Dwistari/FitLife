//
//  CoreDataManager.swift
//  FitLife
//
//  Created by Dwistari on 23/03/25.
//

import CoreData
import SwiftUI

class CoreDataManager {
    static let shared = CoreDataManager()

    let persistentContainer: NSPersistentContainer

    private init() {
        persistentContainer = NSPersistentContainer(name: "FitLifeModel")
        let description = persistentContainer.persistentStoreDescriptions.first
        description?.shouldMigrateStoreAutomatically = true
        description?.shouldInferMappingModelAutomatically = true

        persistentContainer.loadPersistentStores { storeDescription, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
    }

    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    func loadData(date: Date, completion: @escaping([WorkoutSession]) -> Void) {
        let calendar = Calendar.current
        let startDate = calendar.startOfDay(for: date)
        let endDate = calendar.date(byAdding: .day, value: 1, to: startDate)!
        
        let predicate = NSPredicate(format: "date >= %@ AND date < %@", startDate as NSDate, endDate as NSDate)
        let fetchRequest = WorkoutSession.fetchRequest()
        fetchRequest.predicate = predicate
        
        do {
            let workout = try context.fetch(fetchRequest)
            completion(workout)
        } catch {
            print("Failed to fetch Person: \(error)")
        }
    }

    func save() {
        do {
            try context.save()
        } catch {
            print("Failed to save data: \(error)")
        }
    }
    
    func saveMyWorkout(category: WorkoutCategory?, sets: String, reps: String, weight: String, completion: @escaping (Bool) -> Void) {
        let newWorkout = WorkoutSession(context: context)
        newWorkout.id = UUID()
        newWorkout.date = Date()
        newWorkout.name = category?.name
        newWorkout.sets = Int16(sets) ?? 0
        newWorkout.reps = Int16(reps) ?? 0
        newWorkout.weight = Double(weight) ?? 0
        do {
            try context.save()
            trackLog(category: category, sets: sets, reps: reps, weight: weight)
            completion(true)
        } catch {
            completion(false)
        }
    }
    
    func preloadWorkoutCategories() -> [WorkoutCategory] {
        let fetchRequest = WorkoutCategory.fetchRequest()
        do {
            let count = try context.count(for: fetchRequest)
            if count == 0 {
                let categoryNames = ["Chest", "Back", "Legs", "Cardio", "Arms", "Shoulders"]
                var categories: [WorkoutCategory] = []
                for name in categoryNames {
                    let category = WorkoutCategory(context: context)
                    category.id = UUID()
                    category.name = name
                    categories.append(category)
                }
                
                try context.save()
                print("✅ Preloaded workout categories.")
                return categories
            } else {
                print("ℹ️ Workout categories already exist.")
               
                // Return existing data
                let existing = try context.fetch(fetchRequest)
                return existing
            }
        } catch {
            print("❌ Failed to preload: \(error)")
        }
        return []
    }
    
    func resetWorkoutCategories() {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = WorkoutCategory.fetchRequest()
           let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

           do {
               try context.execute(deleteRequest)
               try context.save()
               print("✅ All WorkoutCategory items deleted")
           } catch {
               print("❌ Failed to delete all categories: \(error)")
           }
    }
    
    
    func trackLog(category: WorkoutCategory?, sets: String, reps: String, weight: String) {
        guard let categoryName = category?.name else { return }
        
        let fetchRequest: NSFetchRequest<TrackerLog> = TrackerLog.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "name == %@", categoryName)
        
        do {
            let existingLogs = try context.fetch(fetchRequest)

            let log: TrackerLog
            if let existing = existingLogs.first {
                // 🔁 Update existing
                log = existing
                print("🔁 Updating existing log")
            } else {
                // ➕ Create new
                log = TrackerLog(context: context)
                log.date = Date()
                log.name = categoryName
                print("➕ Creating new log")
            }

            log.sets = Int16(sets) ?? 0
            log.reps = Int16(reps) ?? 0
            log.weight = Double(weight) ?? 0

            try context.save()
            print("✅ Successfully saved tracker log")
        } catch {
            print("❌ Failed to save tracker: \(error)")
        }
    }
    
    func fetchAllTrackerLogs() -> [TrackerLog] {
        let fetchRequest: NSFetchRequest<TrackerLog> = TrackerLog.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "date", ascending: false)]

        do {
            let logs = try context.fetch(fetchRequest)
            return logs
        } catch {
            print("❌ Failed to fetch tracker logs: \(error)")
            return []
        }
    }
    
    
    func delete(playlistID: NSManagedObjectID) {
        do {
            let playlist = try context.existingObject(with: playlistID)
            context.delete(playlist)
            save()
            print("Playlist deleted successfully.")
        } catch {
            print("Failed to delete playlist: \(error.localizedDescription)")
        }
    }
    
    
}
