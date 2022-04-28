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
                image: UIImage(named: "9") ?? UIImage(),
                ingredients:
                    " - 1 buah telur \n - 200 gram mie telur \n - 100 gram sawi hijau \n - 100 gram daging ayam\n - Gula dan garam secukupnya",
                directions:
                    "1. Tumis irisan bawang merah, putih dan cabai hingga harum. \n2. Tambahkan kocokan telur lepas dan aduk rata di atas wajan.\n 3.Masukan mie, taoge, dan sawi yang telah direbus dan ditiriskan sebelumnya. Kembali aduk perlahan. \n4. Tambahkan gula, garam, merica dan kecap manis secukupnya. \n5. Setelah matang dan tercampur rata, angkat dan sajikan dengan pelengkap. "
            )
        ]
    }
}
