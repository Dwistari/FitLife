//
//  GreyTextField.swift
//  FitLife
//
//  Created by Dwistari on 23/03/25.
//

import SwiftUI

struct GreyTextField: View {
    var imageName: String
    var placeholder: String
    @Binding var input: String

    
    var body: some View {
        if placeholder != "Weight" {
            Stepper(value: Binding(
                get: { Int(input) ?? 0 }, // Convert to Int, default to 0 if invalid
                set: { input = String($0) } // Convert back to String
            ), in: 0...1000) {
                HStack {
                    Image("ic_reps")
                    TextField(placeholder, text: $input)
                    .keyboardType(.numberPad)
                }
            }
            .frame(height: 50)
            .padding(.horizontal)
            .background(Color(.systemGray6))
            .cornerRadius(16)
        } else {
            HStack {
                Image("ic_reps")
                TextField(placeholder, text: $input)
                .keyboardType(.numberPad)
                .padding(8)
                Text("Kg").foregroundColor(.gray)
            }
            .frame(height: 50)
            .padding(.horizontal)
            .background(Color(.systemGray6))
            .cornerRadius(16)
        }
    }
}

struct GreyTextField_Previews: PreviewProvider {
    @State static var input: String = ""
    
    static var previews: some View {
        GreyTextField(imageName: "person.fill", placeholder: "Enter your name", input: $input)
            .padding() // Optional: add padding around the preview
            .previewLayout(.sizeThatFits) // Optional: adjust preview layout
    }
}
