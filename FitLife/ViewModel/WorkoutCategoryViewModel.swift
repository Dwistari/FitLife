//
//  WorkoutCategoryViewModel.swift
//  FitLife
//
//  Created by Dwistari on 14/05/25.
//

import Foundation

class WorkoutCategoryViewModel {
    
    func loadWorkoutCategories() -> [CategorySeed] {
        guard let url = Bundle.main.url(forResource: "workout_categories", withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let categories = try? JSONDecoder().decode([CategorySeed].self, from: data) else {
            print("❌ Failed to load workout categories.")
            return []
        }
        return categories
    }
}


