//
//  ScheduleView.swift
//  FitLife
//
//  Created by Dwistari on 07/04/25.
//

import SwiftUI

// MARK: - Main View
struct ScheduleView: View {
    @State private var completedWorkouts: Set<String> = []

    // Mock schedule data
    let schedule: [String: [String: [String]]] = [
        "Week 1": [
            "Day 1": ["Chest"],
            "Day 2": ["Legs"],
            "Day 3": ["Back"],
            "Day 4": ["Legs"],
            "Day 5": [],
            "Day 6": ["Arms"],
            "Day 7": ["Rest"]
        ],
        "Week 2": [
            "Day 1": ["Chest"],
            "Day 2": ["Back"],
            "Day 3": ["Legs"],
            "Day 4": ["Shoulders"],
            "Day 5": [],
            "Day 6": ["Cardio"],
            "Day 7": ["Rest"]
        ],
        "Week 3": [
            "Day 1": ["Chest"],
            "Day 2": ["Legs"],
            "Day 3": ["Back"],
            "Day 4": ["Cardio"],
            "Day 5": [],
            "Day 6": ["Arms"],
            "Day 7": ["Rest"]
        ],
        "Week 4": [
            "Day 1": ["Back"],
            "Day 2": ["Chest"],
            "Day 3": ["Legs"],
            "Day 4": ["Shoulders"],
            "Day 5": [],
            "Day 6": ["Cardio"],
            "Day 7": ["Rest"]
        ]
    ]

    var body: some View {
        NavigationView {
            List {
                ForEach(schedule.keys.sorted(), id: \.self) { week in
                    Section(header: Text(week).font(.title3).bold()) {
                        let days = schedule[week]!
                        ForEach(days.keys.sorted(), id: \.self) { day in
                            VStack(alignment: .leading, spacing: 8) {
                                Text(day)
                                    .font(.headline)

                                let workouts = days[day] ?? []
                                if workouts.isEmpty {
                                    Text("No workout planned")
                                        .foregroundColor(.gray)
                                        .italic()
                                } else {
                                    ForEach(workouts, id: \.self) { workout in
                                        HStack {
                                            Button(action: {
                                                toggleCompletion(for: "\(week)-\(day)-\(workout)")
                                            }) {
                                                Image(systemName: completedWorkouts.contains("\(week)-\(day)-\(workout)") ? "checkmark.square.fill" : "square")
                                                    .foregroundColor(.blue)
                                            }

                                            Text(workout)
                                        }
                                    }
                                }
                            }
                            .padding(.vertical, 5)
                        }
                    }
                }
            }
            .navigationTitle("📅 Monthly Schedule")
        }
    }

    // MARK: - Helper
    private func toggleCompletion(for id: String) {
        if completedWorkouts.contains(id) {
            completedWorkouts.remove(id)
        } else {
            completedWorkouts.insert(id)
        }
    }
}

#Preview {
    ScheduleView()
}
