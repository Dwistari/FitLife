//
//  BottomSheetView.swift
//  FitLife
//
//  Created by Dwistari on 23/09/24.
//

import SwiftUI

struct BottomSheetView: View {
    @Binding var isPresented: Bool

    var body: some View {
        VStack {
            Text("Choose your workout options here")
                .font(.headline)
                .padding()

            Button("Close") {
                withAnimation {
                    isPresented = false // Dismiss the bottom sheet
                }
            }
            .padding()
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(16)
        .shadow(radius: 10)
        .padding()
        .transition(.move(edge: .bottom)) // Slide in/out transition
    }
}
