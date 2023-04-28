//
//  ProductModel.swift
//  Api Demo
//
//  Created by Rishi on 28/04/23.
//

import Foundation


struct ProductModel: Codable {
    let Id: Int?
    let Name: String?
    let ShortDescription, FullDescription: String?
    let ProductPictures: [ProductPicture]?
}

// MARK: - ProductPicture
struct ProductPicture: Codable {
    let PictureUrl: String?
}
