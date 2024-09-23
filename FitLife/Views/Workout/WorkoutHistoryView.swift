//
//  WorkoutHistory.swift
//  FitLife
//
//  Created by Dwistari on 23/09/24.
//

import SwiftUI

struct WorkoutHistoryView: View {
    var body: some View {
        NavigationView {
               VStack {
                   NavigationLink(destination: AddWorkout()) {
                       Text("Add workout")
                           .padding()
                           .background(Color.blue)
                           .foregroundColor(.white)
                           .cornerRadius(8)
                   }
               }
               .navigationTitle("Workout Tracker")
               .navigationBarTitleDisplayMode(.inline)
           }
    }
}

#Preview {
    WorkoutHistoryView()
}
