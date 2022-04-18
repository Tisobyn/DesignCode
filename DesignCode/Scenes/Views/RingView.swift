//
//  RingView.swift
//  DesignCode
//
//  Created by Yermek Sabyrzhan on 18.04.2022.
//

import SwiftUI

struct RingView: View {
    var gradientColor_A = Color(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1))
    var gradientColor_B = Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1))
    var ringShadow = Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1))

    var width: CGFloat = 300
    var height: CGFloat = 300
    var percent: CGFloat = 88

    var body: some View {
        let multiplier = width / 44
        let progress = 1 - percent / 100

        return ZStack {
            Circle()
                .stroke(
                    Color.black.opacity(0.1),
                    style: StrokeStyle(lineWidth: 5 * multiplier)
                )
                .frame(width: width, height: height)

            Circle()
                .trim(from: progress, to: 1)
                .stroke(
                    LinearGradient(
                        gradient: Gradient(colors: [gradientColor_A, gradientColor_B]),
                        startPoint: .topTrailing,
                        endPoint: .bottomLeading),
                    style: StrokeStyle(
                        lineWidth: 5 * multiplier,
                        lineCap: .round,
                        lineJoin: .round,
                        miterLimit: .infinity,
                        dash: [20, 0],
                        dashPhase: 0
                    )
                )
                .rotationEffect(Angle(degrees: 90))
                .rotation3DEffect(
                    Angle(degrees: 180),
                    axis: (x: 1, y: 0, z: 0)
                )
                .frame(width: width, height: height)
                .shadow(color: ringShadow.opacity(0.1), radius: 3 * multiplier, x: 0, y: 3 * multiplier)

            Text("\(Int(percent))%")
                .font(.system(size: 14 * multiplier))
                .fontWeight(.bold)
        }
    }
}

struct RingView_Previews: PreviewProvider {
    static var previews: some View {
        RingView()
    }
}
