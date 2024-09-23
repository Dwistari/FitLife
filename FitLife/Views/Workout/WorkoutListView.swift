//
//  WorkoutList.swift
//  FitLife
//
//  Created by Dwistari on 23/09/24.
//

import SwiftUI

struct WorkoutListView: View {
    var body: some View {
        List{
            WorkoutItem(name: "Brench Press", imageName: "")
            WorkoutItem(name: "Shouder Press", imageName: "")
            WorkoutItem(name: "Chestfly", imageName: "")
        }
        .listStyle(PlainListStyle())
        .background(Color.clear)
        .listRowInsets(EdgeInsets())
    }
}

#Preview {
    WorkoutListView()
}
