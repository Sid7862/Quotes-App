//
//  TabView.swift
//  Quotes
//
//  Created by Dheeraj Kumar Sharma on 17/06/21.
//

import SwiftUI

struct CustomTabView: View {
    
    // MARK: PROPERTIES -
    
    @State private var selection = 0
    
    @Environment(\.colorScheme) var colorScheme
    
    // MARK: BODY -
    
    var body: some View {
        TabView(selection: $selection) {
            NavigationView {
                HomeView()
                .navigationBarTitle(Text("Quotes"))
                .navigationBarTitleDisplayMode(.inline)
            }
            .tabItem {
                if selection == 0 {
                    Image("home-selected")
                        .renderingMode(.template)
                } else {
                    Image("home")
                        .renderingMode(.template)
                }
                Text("")
            }
            .tag(0)
            
//            NavigationView {
//                ExploreView()
//                .navigationBarTitle(Text("Explore"))
//                .navigationBarTitleDisplayMode(.inline)
//            }
//            .tabItem {
//                if selection == 1 {
//                    Image(systemName: "house.fill")
//                } else {
//                    Image(systemName: "house")
//                }
//                Text("")
//            }
//            .tag(1)
        }
        .accentColor(colorScheme == .dark ? .white : .black)
    }
}

// MARK: PREVIEW -

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabView()
    }
}
