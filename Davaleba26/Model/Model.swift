//
//  catModel.swift
//  Davaleba26
//
//  Created by Lika Nozadze on 11/19/23.
//

import Foundation


struct CatResults: Decodable {
    let data: [catFact]
}

struct catFact: Decodable {
    let fact: String
}

