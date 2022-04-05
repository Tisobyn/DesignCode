//
//  HomeView.swift
//  DesignCode
//
//  Created by Yermek Sabyrzhan on 05.04.2022.
//

import SwiftUI

struct HomeView: View {
    @State var showProfile = false
    var color = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)

    var body: some View {
        ZStack {
            Color(color)
                .edgesIgnoringSafeArea(.all)

            VStack {
                HStack {
                    Text("Watching")
                        .font(.system(size: 28, weight: .bold))
                    Spacer()
                    Button(
                        action: {
                            self.showProfile.toggle()
                        }
                    ) {
                        Image("Avatar")
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 36, height: 46)
                            .clipShape(Circle())
                    }
                }
                .padding(.horizontal)
                .padding(.top, 30)

                Spacer()
            }
            .padding(.top, 44)
            .background(Color.white)
            .clipShape(
                RoundedRectangle(
                    cornerRadius: 30, style: .continuous)
            )
            .shadow(
                color: Color.black.opacity(0.2),
                radius: 20,
                x: 0, y: 20
            )
            .offset(y: showProfile ? -450 : 0)
            .rotation3DEffect(
                Angle(degrees: showProfile ? -10 : 0),
                axis: (
                    x: 10.0, y: 0, z: 0
                )
            )
            .scaleEffect(showProfile ? 0.9 : 1)
            .animation(
                .spring(
                    response: 0.5,
                    dampingFraction: 0.6,
                    blendDuration: 0)
            )
            .edgesIgnoringSafeArea(.all)



            MenuView()
                .offset(y: showProfile ? 0 : 600)
                .animation(
                    .spring(
                        response: 0.5,
                        dampingFraction: 0.6,
                        blendDuration: 0)
                )
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
