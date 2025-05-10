//
//  ContentView.swift
//  FitLife
//
//  Created by Dwistari on 23/03/25.
//

import SwiftUI
import CoreData

struct HomeView: View {
    @State private var workouts: [WorkoutSession] = []
    @State private var showAddWorkout = false
    @State private var date = Date.now
    @State private var showDatePicker = false
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    Text("Selected Date: \(date.formatted(date: .abbreviated, time: .omitted))")
                        .onTapGesture {
                            showDatePicker.toggle()
                        }
                    if showDatePicker {
                        DatePicker(
                            "Select Date",
                            selection: $date,
                            displayedComponents: .date
                        )
                        .labelsHidden()
                        .datePickerStyle(.graphical)
                        .onChange(of: date) { newDate in
                            loadView()
                            showDatePicker = false
                        }
                        .padding()
                    }
                }
                .padding(.top)
                if workouts.isEmpty {
                    Spacer()
                    Text("No workouts yet.")
                        .font(.title2)
                        .foregroundColor(.gray)
                    Spacer()
                } else {
                    List {
                        ForEach(workouts, id: \.id) { workout in
                            NavigationLink(destination: AddWorkoutView(workout: workout)) {
                                VStack(alignment: .leading) {
                                    Text(workout.name ?? "")
                                        .font(.headline)
                                    Text("\(workout.sets) Sets x \(workout.reps) Reps - \(workout.weight, specifier: "%.1f") kg")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                            }
                        }
                    }
                    .listStyle(PlainListStyle())
                }
            }
            
            .navigationTitle("My Workouts")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { showAddWorkout = true }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showAddWorkout) {
                AddWorkoutView()
            }
            .onChange(of: showAddWorkout) { newValue in
                loadView()
            }
            
            .onAppear{
                loadView()
            }
        }
    }
    
    private func loadView() {
        CoreDataManager.shared.loadData(date: date) { data in
            workouts = data
        }
    }
}

#Preview {
    HomeView()
}
