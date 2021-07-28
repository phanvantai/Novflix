//
//  GlobalHelpers.swift
//  Novflix
//
//  Created by Tai Phan Van on 28/07/2021.
//

import Foundation

let exampleMovie1 = Movie(id: UUID().uuidString, name: "DARK", thumbnailURL: URL(string: "https://picsum.photos/200/300")!)
let exampleMovie2 = Movie(id: UUID().uuidString, name: "Travelers", thumbnailURL: URL(string: "https://picsum.photos/200/300/")!)
let exampleMovie3 = Movie(id: UUID().uuidString, name: "Comunity", thumbnailURL: URL(string: "https://picsum.photos/200/301")!)
let exampleMovie4 = Movie(id: UUID().uuidString, name: "Alone", thumbnailURL: URL(string: "https://picsum.photos/200/302")!)
let exampleMovie5 = Movie(id: UUID().uuidString, name: "Hannibal", thumbnailURL: URL(string: "https://picsum.photos/200/303")!)
let exampleMovie6 = Movie(id: UUID().uuidString, name: "Breaking Bad", thumbnailURL: URL(string: "https://picsum.photos/200/304")!)

let exampleMovies: [Movie] = [exampleMovie1, exampleMovie2, exampleMovie3, exampleMovie4, exampleMovie5, exampleMovie6]
