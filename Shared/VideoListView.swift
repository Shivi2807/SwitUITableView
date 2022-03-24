//
//  ContentView.swift
//  Shared
//
//  Created by Shivi Agarwal on 24/03/22.
//

import SwiftUI

struct VideoListView: View {
    let myVideos: [Video] = VideoList.topTen
    
    var body: some View {
        
        NavigationView
        {
            
            List(myVideos, id : \.id) // id: \.self is used in case of sysyem defined datatypes. for custom defined datatypes, id: \.id is used
            { video in
                NavigationLink(destination: VideoDetailView(video: video), label: {
                    VideoCell(video: video)
                })
                
            }.navigationTitle("Top 10 Videos")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
