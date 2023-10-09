//
//  API.swift
//  Avito_Test(MVVM)
//
//  Created by Dzhami on 08.10.2023.
//

import Foundation

struct API {
    static let baseURLString = "https://www.avito.st/s/interns-ios/main-page.json"
}

extension API {
   static func getURLFor(id: String) -> String {
        return "https://www.avito.st/s/interns-ios/details//\(id).json"
    }
}
