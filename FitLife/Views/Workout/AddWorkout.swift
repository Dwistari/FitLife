//
//  AddWorkout.swift
//  FitLife
//
//  Created by Dwistari on 23/09/24.
//

import SwiftUI

struct AddWorkout: View {
    @State private var textInput: String = ""
    @State private var message: String = ""
    @State private var showBottomSheet = false

    var body: some View {
        ZStack {
            VStack {
                Text("Add your workout")
                GreyTextField(imageName: "ic_barbel", placeholder: "Choose workout", text: $textInput)
                    .padding(.horizontal)
                    .onTapGesture {
                        withAnimation {
                            showBottomSheet.toggle()
                        }
                    }
                GreyTextField(imageName: "ic_reps", placeholder: "Weight", text: $textInput)
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                GreyTextField(imageName: "ic_reps", placeholder: "Repetitions", text: $textInput)
                    .padding(.horizontal)
                Button(action: {
                    message = "You entered: \(textInput)"
                }) {
                    Text("Save")
                        .padding()
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(36)
                        .padding(.leading, 8)
                        .padding()
                }
                .padding(.vertical, 8)
            }
            .padding()
            .navigationTitle("Add your workout")
            .navigationBarTitleDisplayMode(.inline)

            // Bottom Sheet
            if showBottomSheet {
                BottomSheetView(isPresented: $showBottomSheet)
                    .background(Color.black.opacity(0.4).edgesIgnoringSafeArea(.all))
                    .animation(.easeInOut, value: showBottomSheet)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
    }
}


#Preview {
    AddWorkout()
}
