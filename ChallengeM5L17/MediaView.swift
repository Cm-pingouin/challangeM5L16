//
//  MediaView.swift
//  ChallengeM5L17
//
//  Created by Carlos Banza on 07/07/2021.
//

import SwiftUI
import AVKit

struct MediaView: View {
    
    //Declaraction variable
    @EnvironmentObject var module:ContentModule
    
    
    var body: some View {
        
        let url = module.videoLesson?.url
        
        VideoPlayer(player: AVPlayer(url: URL(string: url!)!))
        
    }
}
