//
//  MediaView.swift
//  ChallengeM5L17
//
//  Created by Carlos Banza on 07/07/2021.
//

import SwiftUI
import AVKit

struct MediaView: View {
    @EnvironmentObject var module:ContentModule
    
    var lesson:Module!
    
    var body: some View {
        
        VStack(alignment: .leading){
            if lesson.id != nil{
                Text(lesson.title!)
                
                VideoPlayer(player: AVPlayer(url: URL(string: lesson.url!)!))
                    .cornerRadius(10)
            }else{
                Text("Video indisponible!! Ressayer plus tard")
            }
        }.navigationBarTitle("Video Player")
        .padding()
    }
}

struct MediaView_Previews: PreviewProvider {
    static var previews: some View {
        MediaView(lesson: Module())
            .environmentObject(ContentModule())
    }
}
