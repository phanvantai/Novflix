//
//  TrailerPlayerView.swift
//  Novflix
//
//  Created by Tai Phan Van on 01/08/2021.
//

import SwiftUI
import VideoPlayer

struct TrailerPlayerView: View {
    
    var videoURL: URL?
    
    @Binding var playingVideo: Bool
    
    var body: some View {
        if videoURL != nil {
            VideoPlayer(url: videoURL!, play: $playingVideo)
        } else {
            Text("Couldn't load video")
        }
    }
}

struct TrailerPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        TrailerPlayerView(videoURL: exampleVideoURL, playingVideo: .constant(true))
    }
}
