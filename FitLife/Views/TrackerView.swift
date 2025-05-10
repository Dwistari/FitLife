//
//  TrackerView.swift
//  FitLife
//
//  Created by Dwistari on 08/05/25.
//

import SwiftUI

//struct TrackerView: View {
//    @State private var logs: [TrackerLog] = [
//        TrackerLog(date: Date().addingTimeInterval(-86400), workoutName: "Bench Press", reps: 10, weight: 40),
//        TrackerLog(date: Date(), workoutName: "Bench Press", reps: 8, weight: 42.5),
//        TrackerLog(date: Date().addingTimeInterval(-172800), workoutName: "Deadlift", reps: 5, weight: 70)
//    ]
//    
//    var latestLogs: [TrackerLog] {
//        Dictionary(grouping: logs, by: { $0.workoutName })
//            .compactMap { (_, logs) in
//                logs.sorted(by: { $0.date > $1.date }).first
//            }
//            .sorted(by: { $0.date > $1.date }) // Optional: sort by most recent
//    }
//    
//    var body: some View {
//        NavigationView {
//            List(latestLogs) { log in
//                VStack(alignment: .leading) {
//                    Text(log.workoutName)
//                        .font(.headline)
//                    HStack {
//                        Text("Last weight: \(log.weight, specifier: "%.1f") kg")
//                        Spacer()
//                        Text("Reps: \(log.reps)")
//                    }
//                    .font(.subheadline)
//                    .foregroundColor(.gray)
//                }
//                .padding(.vertical, 4)
//            }
//            .navigationTitle("Workout Tracker")
//        }
//    }
//}
//
//struct WorkoutTrackerView_Previews: PreviewProvider {
//    static var previews: some View {
//        TrackerView()
//    }
//}
