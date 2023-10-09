//
//  Advertisements.swift
//  Avito_Test(MVVM)
//
//  Created by Dzhami on 07.10.2023.
//

import Foundation

struct AdvertisementResponse: Codable {
    let advertisements: [Advertisement]
}

struct Advertisement: Codable {
    let id : String
    let title : String
    let price : String
    let location: String
    let imageUrl: String
    let createdAt: String

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case price
        case location
        case imageUrl = "image_url"
        case createdAt = "created_date"
    }
}
