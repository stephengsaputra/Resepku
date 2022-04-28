//
//  DataSeeder.swift
//  NanoChallenge01
//
//  Created by Stephen Giovanni Saputra on 26/04/22.
//

import Foundation
import UIKit

class DataSeeder {
    
    func generateRecipes() -> [Recipe] {
        
        return [
            Recipe(
                title: "test1",
                image: UIImage(named: "1") ?? UIImage(),
                ingredients:
                    " - 1 buah telur \n - 200 gram mie telur \n - 100 gram sawi hijau \n - 100 gram daging ayam\n - Gula dan garam secukupnya",
                directions: " "
            )
        ]
    }
}
