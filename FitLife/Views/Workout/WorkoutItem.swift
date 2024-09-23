//
//  WorkoutItem.swift
//  FitLife
//
//  Created by Dwistari on 23/09/24.
//

import SwiftUI

struct WorkoutItem: View {
    var name: String
    var imageName: String

    var body: some View {
        HStack {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
                .foregroundColor(.gray)
            Text(name)
                .padding(8)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 60)
        .padding(.horizontal)
        .background(Color(.systemGray6))
        .cornerRadius(16)
    }
}

#Preview {
    WorkoutItem(name: "brenchpress", imageName: "ic_barbel")
}
