//
//  GreyTextField.swift
//  FitLife
//
//  Created by Dwistari on 23/09/24.
//

import SwiftUI


struct GreyTextField: View {
    var imageName: String
    var placeholder: String
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
                .padding(8)
                .foregroundColor(.gray)
            TextField(placeholder, text: $text)
                .padding(8)
        }
        .frame(height: 50)
        .padding(.horizontal)
        .background(Color(.systemGray6))
        .cornerRadius(16)
    }
}

struct GreyTextField_Previews: PreviewProvider {
    @State static var text: String = "Sample text" // Sample text for preview
    
    static var previews: some View {
        GreyTextField(imageName: "person.fill", placeholder: "Enter your name", text: $text)
            .padding() // Optional: add padding around the preview
            .previewLayout(.sizeThatFits) // Optional: adjust preview layout
    }
}
