//
//  leftSwipeView.swift
//  socialmedia
//
//  Created by Daniel Maliro on 7/15/23.
//

import SwiftUI

struct leftSwipeView: View {
    @State private var selectedTab: LeftSwipe = .originals
    
    var body: some View {
        TabView(selection: $selectedTab) {
            OriginalsView()
                .tabItem {
                    Label("Originals", systemImage: "heart")
                }
                .tag(LeftSwipe.originals)
            
            DailyView()
                .tabItem {
                    Label("Daily", systemImage: "sun.max")
                }
                .tag(LeftSwipe.daily)
            
            GenresView()
                .tabItem {
                    Label("Genres", systemImage: "text.book.closed")
                }
                .tag(LeftSwipe.genres)
        }
        .accentColor(.primary)
    }
}

struct leftSwipeView_Previews: PreviewProvider {
    static var previews: some View {
        leftSwipeView()
    }
}
