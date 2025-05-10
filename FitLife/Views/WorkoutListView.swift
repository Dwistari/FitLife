//
//  WorkoutListView.swift
//  FitLife
//
//  Created by Dwistari on 08/05/25.
//

import SwiftUI


struct WorkoutListView: View {
    @State private var searchText = ""
    @State private var isDropdownVisible = false
    @State private var selectedWorkout = ""

    let workouts =  CoreDataManager.shared.preloadWorkoutCategories()
    
    // Filtered list
    var filteredWorkouts: [WorkoutCategory] {
        if searchText.isEmpty {
            return workouts
        } else {
            return workouts.filter { ($0.name ?? "").localizedCaseInsensitiveContains(searchText) }
        }
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Input field
            TextField("Select Workout", text: $selectedWorkout)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .onTapGesture {
                    withAnimation {
                        isDropdownVisible.toggle()
                    }
                }
            
            // Dropdown filter
            if isDropdownVisible {
                VStack(spacing: 0) {
                    TextField("Search...", text: $searchText)
                        .padding()
                        .background(Color(.systemGray5))
                    
                    List(filteredWorkouts) { workout in
                        Text(workout.name ?? "")
                            .onTapGesture {
                                selectedWorkout = workout.name ?? ""
                                searchText = ""
                                withAnimation {
                                    isDropdownVisible = false
                                }
                            }
                    }
                    .frame(maxHeight: 200) // Limit height of dropdown
                }
                .background(Color.white)
                .cornerRadius(8)
                .shadow(radius: 4)
            }
        }
        .padding()
    }
}

struct WorkoutListView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutListView()
    }
}
