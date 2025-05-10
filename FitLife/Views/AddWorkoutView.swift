//
//  SwiftUIView.swift
//  FitLife
//
//  Created by Dwistari on 23/03/25.
//

import SwiftUI

struct AddWorkoutView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) private var context
    @State private var name: String = ""
    @State private var sets: String = ""
    @State private var reps: String = ""
    @State private var weight: String = ""
    @State private var workout: WorkoutSession?
    @State private var isDropdownVisible = false
    @State private var selectedWorkout = ""
    
    let workouts = CoreDataManager.shared.preloadWorkoutCategories()
    
    init(workout: WorkoutSession? = nil) {
        _name = State(initialValue: workout?.name ?? "")
        _sets = State(initialValue: workout.map { String($0.sets) } ?? "")
        _reps = State(initialValue: workout.map { String($0.reps) } ?? "")
        _weight = State(initialValue: workout.map { String($0.weight) } ?? "")
        _workout = State(initialValue: workout.map { $0 })
    }
    
    var isEdited: Bool {
        workout != nil
    }
    
    var isEnableBtn: Bool {
        !name.isEmpty && !weight.isEmpty  && !sets.isEmpty  && !reps.isEmpty
    }
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    Text("Workout name")
                        .frame(alignment: .leading)
                    TextField("Enter workout name", text: $name)
                        .frame(height: 50)
                        .padding(.horizontal)
                        .background(Color(.systemGray6))
                        .cornerRadius(16)
                        .onTapGesture {
                            withAnimation {
                                isDropdownVisible.toggle()
                            }
                        }
                    // Dropdown filter
                    if isDropdownVisible {
                        VStack(spacing: 0) {
                            List(workouts, id: \.id) { workout in
                                Text(workout.name ?? "")
                                    .onTapGesture {
                                        name = workout.name ?? ""
                                        withAnimation {
                                            isDropdownVisible = false
                                        }
                                    }
                            }
                            .onAppear {
                                print("workouts--", workouts.count)
                                
                                print("masuukkk")
//                                CoreDataManager.shared.resetWorkoutCategories()
                            }
                            .frame(maxHeight: 200)
                        }
                        .background(Color.white)
                        .cornerRadius(8)
                        .shadow(radius: 4)
                    }
                }
                .padding()
                Text("Details workout")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 16)
                GreyTextField(imageName: "ic_reps", placeholder: "Sets", input: $sets)
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                
                GreyTextField(imageName: "ic_reps", placeholder: "Repetitions", input: $reps)
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                
                GreyTextField(imageName: "ic_reps", placeholder: "Weight", input: $weight)
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                
                Button(action: {
                    if workout != nil {
                        workout?.name = name
                        workout?.sets = Int16(sets) ?? 0
                        workout?.reps = Int16(reps) ?? 0
                        workout?.weight = Double(weight) ?? 0
                    } else {
                        CoreDataManager.shared.saveMyWorkout(name: name, sets: sets, reps: reps, weight: weight ) { result in
                            if result {
                                print("✅ Workout saved!")
                                presentationMode.wrappedValue.dismiss()
                            } else {
                                print("❌ Failed to save workout.")
                            }
                        }
                    }
                    
                }) {
                    Text("Save")
                        .padding()
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .background(isEnableBtn ? Color.blue : Color.gray)
                        .cornerRadius(36)
                        .padding(.horizontal)
                }
                .disabled(!isEnableBtn)
                if isEdited {
                    Button(action: {
                        if let objectID = workout?.objectID {
                            CoreDataManager.shared.delete(playlistID: objectID)
                            presentationMode.wrappedValue.dismiss()
                        }
                    }) {
                        Text("Delete")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(36)
                            .padding()
                    }
                }
                Spacer()
            }
            .navigationTitle(!isEdited ? "Add Workout" : "Workout Details")
        }
    }
    
    
    func saveWorkoutLog() {
        
    }
}


