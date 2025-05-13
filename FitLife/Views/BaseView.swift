//
//  BaseView.swift
//  FitLife
//
//  Created by Dwistari on 27/04/25.
//

import SwiftUI

struct BaseView: View {
    var body: some View {
        VStack {
            TabView {
                HomeView()
                    .tabItem {
                        Label("Home", systemImage: "person")
                    }
                HomeView()
                    .tabItem {
                        Label("Schedule", systemImage: "person")
                    }
                TrackerLogView()
                    .tabItem {
                        Label("Tracker", systemImage: "person")
                    }
            }
        }
        
        
    }
}

#Preview {
    BaseView()
}
