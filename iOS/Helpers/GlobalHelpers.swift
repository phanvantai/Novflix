//
//  GlobalHelpers.swift
//  Novflix
//
//  Created by Tai Phan Van on 28/07/2021.
//

import Foundation
import SwiftUI

let exampleVideoURL = URL(string: "https://www.radiantmediaplayer.com/media/big-buck-bunny-360p.mp4")!
let videoBackup = URL(string: "https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4")!

let exampleImageURL = URL(string: "https://picsum.photos/300/104")!
let exampleImageURL2 = URL(string: "https://picsum.photos/300/105")!
let exampleImageURL3 = URL(string: "https://picsum.photos/300/106")!
let exampleImageURL4 = URL(string: "https://picsum.photos/300/107")!
let exampleImageURL5 = URL(string: "https://picsum.photos/300/108")!

var randomExampleImageURL: URL {
    return [exampleImageURL, exampleImageURL2, exampleImageURL3, exampleImageURL4, exampleImageURL5].randomElement() ?? exampleImageURL5
}

let exampleTrailer1 = Trailer(name: "Season 3 Trailer", videoURL: exampleVideoURL, thumbnailImageURL: randomExampleImageURL)
let exampleTrailer2 = Trailer(name: "Beginnins and Endings", videoURL: exampleVideoURL, thumbnailImageURL: randomExampleImageURL)
let exampleTrailer3 = Trailer(name: "The Mysterious", videoURL: exampleVideoURL, thumbnailImageURL: randomExampleImageURL)
let exampleTrailer4 = Trailer(name: "The Hero's Journey", videoURL: exampleVideoURL, thumbnailImageURL: randomExampleImageURL)
let exampleTrailer5 = Trailer(name: "Previous", videoURL: exampleVideoURL, thumbnailImageURL: randomExampleImageURL)

let exampleTrailers = [exampleTrailer1, exampleTrailer2, exampleTrailer3, exampleTrailer4, exampleTrailer5]

let exampleEpisode1 = Episode(name: "Beginnings and Endings", season: 1, episodeNumber: 1, thumbnailImageURLString: "https://picsum.photos/300/102", desciption: "Six months after the disapearances, the police form a task force. In 2052, Jonas learns that most of Winden perished in an apocalyptic event.", length: 53, videoURL: exampleVideoURL)

let exampleEpisode2 = Episode(name: "Dark Matter", season: 1, episodeNumber: 2, thumbnailImageURLString: "https://picsum.photos/300/103", desciption: "Clausen and Charllotte interview Regina. The Stranger takes Hannah to 1987, where Claudia has an unnerving encounter and Egon visits an old nemesis", length: 54, videoURL: exampleVideoURL)

let exampleEpisode3 = Episode(name: "Ghosts", season: 1, episodeNumber: 3, thumbnailImageURLString: "https://picsum.photos/300/104", desciption: "In 1954, a missing Helge returns, but he'll only speak to Noah. In 1987, Claudia brings the time machine to Tannhaus, and Egon questions Ulrich again.", length: 56, videoURL: exampleVideoURL)

let exampleEpisode4 = Episode(name: "Beginnings and Endings", season: 2, episodeNumber: 1, thumbnailImageURLString: "https://picsum.photos/300/105", desciption: "Six months after the disapearances, the police form a task force. In 2052, Jonas learns that most of Winden perished in an apocalyptic event.", length: 53, videoURL: exampleVideoURL)

let exampleEpisode5 = Episode(name: "Dark Matter", season: 2, episodeNumber: 2, thumbnailImageURLString: "https://picsum.photos/300/106", desciption: "Clausen and Charllotte interview Regina. The Stranger takes Hannah to 1987, where Claudia has an unnerving encounter and Egon visits an old nemesis", length: 54, videoURL: exampleVideoURL)

let exampleEpisode6 = Episode(name: "Ghosts", season: 2, episodeNumber: 3, thumbnailImageURLString: "https://picsum.photos/300/107", desciption: "In 1954, a missing Helge returns, but he'll only speak to Noah. In 1987, Claudia brings the time machine to Tannhaus, and Egon questions Ulrich again.", length: 56, videoURL: exampleVideoURL)

var allExampleEpisodes = [exampleEpisode1, exampleEpisode2, exampleEpisode3, exampleEpisode4, exampleEpisode5, exampleEpisode6,]

let exampleMovie1 = Movie(id: UUID().uuidString,
                          name: "DARK",
                          thumbnailURL: URL(string: "https://picsum.photos/200/300")!,
                          categories: ["Sci-fi TV", "Horror", "Exciting", "Suspenseful"],
                          defaultEpisodeInfo: exampleEpisodeInfo1,
                          creators: "Baran bo Odan, Jantje Friese",
                          cast: "Louis Hofmann, Oliver Masucci, Jordis Triebel",
                          moreLikeThisMovies: [], trailers: exampleTrailers, year: 2020,
                          rating: "TV-MA",
                          numberOfSeasons: 1, previewImageName: "ozarkPreview", previewVideoURL: exampleVideoURL)
let exampleMovie2 = Movie(id: UUID().uuidString,
                          name: "Travelers",
                          thumbnailURL: URL(string: "https://picsum.photos/200/300/")!,
                          categories: ["Sci-fi TV", "Horror", "Exciting", "Suspenseful"],
                          defaultEpisodeInfo: exampleEpisodeInfo1,
                          creators: "Baran bo Odan, Jantje Friese",
                          cast: "Louis Hofmann, Oliver Masucci, Jordis Triebel",
                          moreLikeThisMovies: [],
                          episodes: allExampleEpisodes,
                          trailers: exampleTrailers, year: 2020,
                          rating: "TV-MA",
                          numberOfSeasons: 2,
                          /*promotionHeadline: "Best Rated Show",*/ previewImageName: "arrestedDevPreview", previewVideoURL: exampleVideoURL)
let exampleMovie3 = Movie(id: UUID().uuidString,
                          name: "Comunity",
                          thumbnailURL: URL(string: "https://picsum.photos/200/301")!,
                          categories: ["Sci-fi TV", "Horror", "Exciting", "Suspenseful"],
                          defaultEpisodeInfo: exampleEpisodeInfo1,
                          creators: "Baran bo Odan, Jantje Friese",
                          cast: "Louis Hofmann, Oliver Masucci, Jordis Triebel",
                          moreLikeThisMovies: [], trailers: exampleTrailers, year: 2020,
                          rating: "TV-MA",
                          numberOfSeasons: 3, previewImageName: "darkPreview", previewVideoURL: exampleVideoURL)
let exampleMovie4 =  Movie(id: UUID().uuidString,
                           name: "Alone",
                           thumbnailURL: URL(string: "https://picsum.photos/200/302")!,
                           categories: ["Sci-fi TV", "Horror", "Exciting", "Suspenseful"],
                           defaultEpisodeInfo: exampleEpisodeInfo1,
                           creators: "Baran bo Odan, Jantje Friese",
                           cast: "Louis Hofmann, Oliver Masucci, Jordis Triebel",
                           moreLikeThisMovies: [], trailers: exampleTrailers, year: 2020,
                           rating: "TV-MA",
                           numberOfSeasons: 4,
                           /*promotionHeadline: "New episodes coming soon",*/ previewImageName: "dirtyJohnPreview", previewVideoURL: exampleVideoURL)
let exampleMovie5 = Movie(id: UUID().uuidString,
                          name: "Hannibal",
                          thumbnailURL: URL(string: "https://picsum.photos/200/303")!,
                          categories: ["Sci-fi TV", "Horror", "Exciting", "Suspenseful"],
                          defaultEpisodeInfo: exampleEpisodeInfo1,
                          creators: "Baran bo Odan, Jantje Friese",
                          cast: "Louis Hofmann, Oliver Masucci, Jordis Triebel",
                          moreLikeThisMovies: [], trailers: exampleTrailers, year: 2020,
                          rating: "TV-MA",
                          numberOfSeasons: 5, previewImageName: "whiteLinesPreview", previewVideoURL: exampleVideoURL)
let exampleMovie6 = Movie(id: UUID().uuidString,
                          name: "Breaking Bad",
                          thumbnailURL: URL(string: "https://picsum.photos/200/304")!,
                          categories: ["Sci-fi TV", "Horror", "Exciting", "Suspenseful"],
                          defaultEpisodeInfo: exampleEpisodeInfo1,
                          creators: "Baran bo Odan, Jantje Friese",
                          cast: "Louis Hofmann, Oliver Masucci, Jordis Triebel",
                          moreLikeThisMovies: exampleMovies, trailers: exampleTrailers, year: 2020,
                          rating: "TV-MA",
                          numberOfSeasons: 6,
                          accentColor: Color.blue,
                          /*promotionHeadline: "Watch Season 6 Now",*/ previewImageName: "travelersPreview", previewVideoURL: exampleVideoURL)

var exampleMovies: [Movie] {
    return [exampleMovie1, exampleMovie2, exampleMovie3, exampleMovie4, exampleMovie5, exampleMovie5]//.shuffled()
}

let exampleEpisodeInfo1 = CurrentEpisodeInfo(episodeName: "Beginning and Endings", description: "Six months after the disapearances, the police form a task force. In 2052, Jonas learns that most of Winden perished in an apocalyptic event.", season: 2, episode: 1)

extension LinearGradient {
    static let blackOpacityGradient = LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.0), Color.black.opacity(0.9)]), startPoint: .top, endPoint: .bottom)
}
