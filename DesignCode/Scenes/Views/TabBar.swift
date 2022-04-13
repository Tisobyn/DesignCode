//
//  TabBar.swift
//  DesignCode
//
//  Created by Yermek Sabyrzhan on 13.04.2022.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "play.circle.fill")
                    Text("Home")
                }
            ContentView()
                .tabItem {
                    Image(systemName: "rectangle.stack.fill")
                    Text("Certificates")
                }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TabBar().previewDevice("iPhone 8")
//            TabBar().previewDevice("iPhone 11 Pro Max")
        }
    }
}
