//
//  TrackerLogView.swift
//  FitLife
//
//  Created by Dwistari on 08/05/25.
//

import SwiftUI

struct TrackerLogView: View {
    @StateObject var viewModel = TrackerViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.trackerLogs, id: \.self) { log in
                VStack(alignment: .leading) {
                    Text(log.name ?? "Unknown Category")
                        .font(.headline)
                    HStack {
                        Text("Sets: \(log.sets)")
                        Text("Reps: \(log.reps)")
                        Text("Weight: \(log.weight, specifier: "%.1f") kg")
                    }
                    .font(.subheadline)
                    if let date = log.date {
                        Text("Date: \(date.formatted(date: .abbreviated, time: .shortened))")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }
                .padding(.vertical, 4)
            }
            .navigationTitle("Tracker Logs")
        }
        .onAppear {
            viewModel.fetchTrackerLogs()
        }
    }
}

struct WorkoutTrackerView_Previews: PreviewProvider {
    static var previews: some View {
        TrackerLogView()
    }
}
