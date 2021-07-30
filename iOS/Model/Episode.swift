//
//  Episode.swift
//  Novflix
//
//  Created by Tai Phan Van on 30/07/2021.
//

import Foundation

struct Episode: Identifiable {
    var id = UUID().uuidString
    
    var name: String
    var season: Int
    var episodeNumber: Int
    var thumbnailImageURLString: String
    var desciption: String
    var length: Int
    
    var videoURL: URL
    
    var thumbnailURL: URL {
        return URL(string: thumbnailImageURLString)!
    }
}
