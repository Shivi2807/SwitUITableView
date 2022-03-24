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
                    HStack
                    {
                        Image(video.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 70)
                            .cornerRadius(4.0)
                            .padding(.vertical, 4)
                        
                        VStack(alignment: .leading, spacing: 5)
                        {
                            Text(video.title)
                                .fontWeight(.semibold)
                                .lineLimit(2)// in case of a lot of text the label will be divided into 2 lines, if it still cannot be accomodated in 2 lines it will then truncate (...)
                                .minimumScaleFactor(0.5) //in case of a lot of text, the font will reduce itself to 0.5 of its original size
                            
                            Text(video.uploadDate)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
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
