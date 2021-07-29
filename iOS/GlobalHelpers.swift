//
//  GlobalHelpers.swift
//  Novflix
//
//  Created by Tai Phan Van on 28/07/2021.
//

import Foundation
import SwiftUI

let exampleMovie1 = Movie(id: UUID().uuidString, name: "DARK", thumbnailURL: URL(string: "https://picsum.photos/200/300")!, categories: ["Sci-fi TV", "Horror", "Exciting", "Suspenseful"])
let exampleMovie2 = Movie(id: UUID().uuidString, name: "Travelers", thumbnailURL: URL(string: "https://picsum.photos/200/300/")!, categories: ["Sci-fi TV", "Horror", "Exciting", "Suspenseful"])
let exampleMovie3 = Movie(id: UUID().uuidString, name: "Comunity", thumbnailURL: URL(string: "https://picsum.photos/200/301")!, categories: ["Sci-fi TV", "Horror", "Exciting", "Suspenseful"])
let exampleMovie4 =  Movie(id: UUID().uuidString, name: "Alone", thumbnailURL: URL(string: "https://picsum.photos/200/302")!, categories: ["Sci-fi TV", "Horror", "Exciting", "Suspenseful"])
let exampleMovie5 = Movie(id: UUID().uuidString, name: "Hannibal", thumbnailURL: URL(string: "https://picsum.photos/200/303")!, categories: ["Sci-fi TV", "Horror", "Exciting", "Suspenseful"])
let exampleMovie6 = Movie(id: UUID().uuidString, name: "Breaking Bad", thumbnailURL: URL(string: "https://picsum.photos/200/304")!, categories: ["Sci-fi TV", "Horror", "Exciting", "Suspenseful"])

let exampleMovies: [Movie] = [exampleMovie1, exampleMovie2, exampleMovie3, exampleMovie4, exampleMovie5, exampleMovie6]

extension LinearGradient {
    static let blackOpacityGradient = LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.0), Color.black.opacity(0.9)]), startPoint: .top, endPoint: .bottom)
}
