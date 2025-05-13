//
//  TrackerViewModel.swift
//  FitLife
//
//  Created by Dwistari on 13/05/25.
//

import Foundation
import CoreData

class TrackerViewModel: ObservableObject {
    @Published var trackerLogs: [TrackerLog] = []

    func fetchTrackerLogs() {
        let fetchRequest: NSFetchRequest<TrackerLog> = TrackerLog.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "date", ascending: false)]

        do {
            let context = CoreDataManager.shared.context
            trackerLogs = try context.fetch(fetchRequest)
        } catch {
            print("❌ Failed to fetch tracker logs: \(error)")
        }
    }
}
