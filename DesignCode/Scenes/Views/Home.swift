//
//  Home.swift
//  DesignCode
//
//  Created by Yermek Sabyrzhan on 05.04.2022.
//

import SwiftUI

struct Home: View {
    @Binding var showProfile: Bool
    @State var showUpdate = false

    var gradientColor_A = Color(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1))
    var gradientColor_B = Color(#colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1))
    var ringShadow = Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1))

    var body: some View {
        VStack {
            HStack {
                Text("Watching")
                    .font(.system(size: 28, weight: .bold))
                Spacer()

                AvatarView(showProfile: $showProfile)

                Button(action: {
                    self.showUpdate.toggle()
                }) {
                    Image(systemName: "bell")
                        .renderingMode(.original)
                        .font(.system(size: 16, weight: .medium))
                        .frame(width: 36, height: 36)
                        .background(Color.white)
                        .clipShape(Circle())
                        .shadow(
                            color: .black.opacity(0.1),
                            radius: 1,
                            x: 0, y: 1)
                        .shadow(
                            color: .black.opacity(0.2),
                            radius: 10,
                            x: 0, y: 10)
                }
                .sheet(isPresented: $showUpdate) {
                    UpdateList()
                }

            }
            .padding(.horizontal)
            .padding(.leading, 14)
            .padding(.top, 30)

            HStack(spacing: 12.0) {
                RingView(
                    gradientColor_A: gradientColor_A,
                    gradientColor_B: gradientColor_B,
                    ringShadow: ringShadow,
                    width: 44,
                    height: 44,
                    percent: 68,
                show: .constant(true))

                VStack(alignment: .leading, spacing: 4) {
                    Text("6 minutes left")
                        .font(.subheadline)
                        .fontWeight(.bold)
                    Text("wathched 10 minutes todat")
                        .font(.caption)
                }
            }
            .padding(8)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
            .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)

            ScrollView(
                .horizontal,
                showsIndicators: false) {

                HStack(spacing: 30) {
                    ForEach(sectionData) { item in
                        GeometryReader { geometry in
                            SectionView(section: item)
                                .rotation3DEffect(
                                    Angle(
                                        degrees: geometry.frame(
                                            in: .global
                                        ).minX / 20
                                    ),
                                    axis: (
                                        x: 0, y: 10, z: 0
                                    )
                                )
                        }
                        .frame(width: 275, height: 275)
                    }
                }
                .padding(30)
                .padding(.bottom, 30)
            }

            Spacer()
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home(showProfile: .constant(false))
    }
}

struct SectionView: View {
    var section: Section

    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Text(section.title)
                    .font(.system(
                        size: 24,
                        weight: .bold))
                    .frame(
                        width: 160,
                        alignment: .leading)
                    .foregroundColor(.white)
                Spacer()
                Image(section.logo)
            }

            Text(section.text.uppercased())
                .frame(
                    maxWidth: .infinity,
                    alignment: .leading)

            section.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 210)
        }
        .padding(.top, 20)
        .padding(.horizontal, 20)
        .frame(width: 275, height: 275)
        .background(section.color)
        .cornerRadius(30)
        .shadow(
            color: section.color.opacity(0.3),
            radius: 20, x: 0, y: 20)
    }
}

struct Section: Identifiable {
    var id = UUID()
    var title: String
    var text: String
    var logo: String
    var image: Image
    var color: Color
}

let sectionData = [
    Section(
        title: "Prototype design for SwiftUI",
        text: "18 Sections",
        logo: "Logo1",
        image: Image("Card1"),
        color: Color("card1")
    ),
    Section(
        title: "Build a SwiftUI app",
        text: "20 Sections",
        logo: "Logo1",
        image: Image("Card2"),
        color: Color("card2")
    ),
    Section(
        title: "SwiftUI Advance",
        text: "20 Sections",
        logo: "Logo1",
        image: Image("Card3"),
        color: Color("card3")
    )
]
