//
//  GlobalHelpers.swift
//  Novflix
//
//  Created by Tai Phan Van on 28/07/2021.
//

import Foundation
import SwiftUI

let exampleMovie1 = Movie(id: UUID().uuidString,
                          name: "DARK",
                          thumbnailURL: URL(string: "https://picsum.photos/200/300")!,
                          categories: ["Sci-fi TV", "Horror", "Exciting", "Suspenseful"],
                          defaultEpisodeInfo: exampleEpisodeInfo1,
                          creators: "Baran bo Odan, Jantje Friese",
                          cast: "Louis Hofmann, Oliver Masucci, Jordis Triebel",
                          moreLikeThisMovies: [], year: 2020,
                          rating: "TV-MA",
                          numberOfSeasons: 1)
let exampleMovie2 = Movie(id: UUID().uuidString,
                          name: "Travelers",
                          thumbnailURL: URL(string: "https://picsum.photos/200/300/")!,
                          categories: ["Sci-fi TV", "Horror", "Exciting", "Suspenseful"],
                          defaultEpisodeInfo: exampleEpisodeInfo1,
                          creators: "Baran bo Odan, Jantje Friese",
                          cast: "Louis Hofmann, Oliver Masucci, Jordis Triebel",
                          moreLikeThisMovies: [], year: 2020,
                          rating: "TV-MA",
                          numberOfSeasons: 2,
                          promotionHeadline: "Best Rated Show")
let exampleMovie3 = Movie(id: UUID().uuidString,
                          name: "Comunity",
                          thumbnailURL: URL(string: "https://picsum.photos/200/301")!,
                          categories: ["Sci-fi TV", "Horror", "Exciting", "Suspenseful"],
                          defaultEpisodeInfo: exampleEpisodeInfo1,
                          creators: "Baran bo Odan, Jantje Friese",
                          cast: "Louis Hofmann, Oliver Masucci, Jordis Triebel",
                          moreLikeThisMovies: [], year: 2020,
                          rating: "TV-MA",
                          numberOfSeasons: 3)
let exampleMovie4 =  Movie(id: UUID().uuidString,
                           name: "Alone",
                           thumbnailURL: URL(string: "https://picsum.photos/200/302")!,
                           categories: ["Sci-fi TV", "Horror", "Exciting", "Suspenseful"],
                           defaultEpisodeInfo: exampleEpisodeInfo1,
                           creators: "Baran bo Odan, Jantje Friese",
                           cast: "Louis Hofmann, Oliver Masucci, Jordis Triebel",
                           moreLikeThisMovies: [], year: 2020,
                           rating: "TV-MA",
                           numberOfSeasons: 4,
                           promotionHeadline: "New episodes coming soon")
let exampleMovie5 = Movie(id: UUID().uuidString,
                          name: "Hannibal",
                          thumbnailURL: URL(string: "https://picsum.photos/200/303")!,
                          categories: ["Sci-fi TV", "Horror", "Exciting", "Suspenseful"],
                          defaultEpisodeInfo: exampleEpisodeInfo1,
                          creators: "Baran bo Odan, Jantje Friese",
                          cast: "Louis Hofmann, Oliver Masucci, Jordis Triebel",
                          moreLikeThisMovies: [], year: 2020,
                          rating: "TV-MA",
                          numberOfSeasons: 5)
let exampleMovie6 = Movie(id: UUID().uuidString,
                          name: "Breaking Bad",
                          thumbnailURL: URL(string: "https://picsum.photos/200/304")!,
                          categories: ["Sci-fi TV", "Horror", "Exciting", "Suspenseful"],
                          defaultEpisodeInfo: exampleEpisodeInfo1,
                          creators: "Baran bo Odan, Jantje Friese",
                          cast: "Louis Hofmann, Oliver Masucci, Jordis Triebel",
                          moreLikeThisMovies: exampleMovies, year: 2020,
                          rating: "TV-MA",
                          numberOfSeasons: 6,
                          promotionHeadline: "Watch Season 6 Now")

var exampleMovies: [Movie] {
    return [exampleMovie1, exampleMovie2, exampleMovie3, exampleMovie4, exampleMovie5, exampleMovie5].shuffled()
}

let exampleEpisodeInfo1 = CurrentEpisodeInfo(espisodeName: "Beginning and Endings", description: "Six months after the disapearances, the police form a task force. In 2052, Jonas learns that most of Winden perished in an apocalyptic event.", season: 2, episode: 1)

extension LinearGradient {
    static let blackOpacityGradient = LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.0), Color.black.opacity(0.9)]), startPoint: .top, endPoint: .bottom)
}
