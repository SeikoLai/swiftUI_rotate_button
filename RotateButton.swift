//
//  RotateButton.swift
//  RotateButton
//
//  Created by Sam on 2022/7/18.
//

import SwiftUI

struct RotateButton: View {
    @State var isActivity: Bool = false
    @State var isFinished: Bool = true
    @Namespace var animation
    
    @State private var animationAmount = 1.0
    @State private var backgroundColor: Color = Color.orange.opacity(1)
    @State private var duration: Double = 2.0
    var foreverAnimation: Animation {
        Animation.linear(duration: duration)
            .repeatCount(1, autoreverses: false)
    }
    
    var rotateButton: some View {
        Button(action: {
            withAnimation(foreverAnimation, {
                isActivity.toggle()
            })
            withAnimation(.default, {
                DispatchQueue.main.asyncAfter(deadline: .now() + duration, execute: {
                    backgroundColor = Color.green.opacity(1)
                    DispatchQueue.main.asyncAfter(deadline: .now() + duration, execute: {
                        backgroundColor = Color.orange.opacity(1)
                        isActivity.toggle()
                    })
                })
            })
        }, label: {
            Image(systemName: "arrow.triangle.2.circlepath")
                .resizable()
                .renderingMode(.template)
                .aspectRatio(contentMode: .fill)
                .frame(width: 30.0, height: 30.0, alignment: .center)
                .foregroundColor(.white)
                .padding(15.0)
                .background(backgroundColor.clipShape(Circle()))
                .rotationEffect(Angle(degrees: isActivity ? 360.0 : 0.0))
        }
        ).onAppear(perform: {
            backgroundColor = Color.orange.opacity(1)
        })
    }
    
    var body: some View {
        rotateButton
    }
}

struct RotateButton_Previews: PreviewProvider {
    static var previews: some View {
        RotateButton()
    }
}

