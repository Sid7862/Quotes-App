//
//  TabView.swift
//  Quotes
//
//  Created by Dheeraj Kumar Sharma on 17/06/21.
//

import SwiftUI

struct CustomTabView: View {
    
    // MARK: BODY -
    
    var body: some View {
        TabView {
            HomeView()
                .font(.system(size: 30, weight: .bold , design: .rounded))
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("")
                }
            ExploreView()
                .font(.system(size: 30, weight: .bold , design: .rounded))
                .tabItem {
                    Image(systemName: "magnifyingglass.circle")
                    Text("")
                }
        }
    }
}

// MARK: PREVIEW -

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabView()
    }
}
