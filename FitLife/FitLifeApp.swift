//
//  FitLifeApp.swift
//  FitLife
//
//  Created by Dwistari on 23/03/25.
//

import SwiftUI

@main
struct FitLifeApp: App {
    let coreDataManager = CoreDataManager.shared

    var body: some Scene {
        WindowGroup {
            BaseView()
                .environment(\.managedObjectContext, coreDataManager.persistentContainer.viewContext)
        }
    }
}
