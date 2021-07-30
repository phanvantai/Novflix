//
//  Trailer.swift
//  Novflix
//
//  Created by Tai Phan Van on 30/07/2021.
//

import Foundation

struct Trailer: Identifiable, Hashable {
    var id: String = UUID().uuidString
    
    var name: String
    var videoURL: URL
    var thumbnailImageURL: URL
    
    
}
