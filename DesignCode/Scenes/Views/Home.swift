//
//  Home.swift
//  DesignCode
//
//  Created by Yermek Sabyrzhan on 05.04.2022.
//

import SwiftUI

struct Home: View {
    @Binding var showProfile: Bool

    var body: some View {
        VStack {
            HStack {
                Text("Watching")
                    .font(.system(size: 28, weight: .bold))
                Spacer()
                ZStack {
                    AvatarView(showProfile: $showProfile)
                }
            }
            .padding(.horizontal)
            .padding(.top, 30)

            Spacer()
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home(showProfile: .constant(false))
    }
}
