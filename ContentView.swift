//
//  ContentView.swift
//  RotateButton
//
//  Created by Sam on 2022/7/17.
//

import SwiftUI

struct ContentView: View {
    @State var isActivity: Bool = false
    @Namespace var animation
    
    @State private var animationAmount = 1.0
    
    var foreverAnimation: Animation {
        Animation.linear(duration: 2.0)
            .repeatCount(1, autoreverses: false)
    }
    
    var body: some View {
        Button(action: {
        
        }, label: {
            Image(systemName: "arrow.triangle.2.circlepath")
                .resizable()
                .renderingMode(.template)
                .aspectRatio(contentMode: .fill)
                .frame(width: 30.0, height: 30.0, alignment: .center)
                .foregroundColor(.white)
                .padding(15.0)
                .background(Color.green.opacity(1).clipShape(Circle()))
                .rotationEffect(Angle(degrees: isActivity ? 0.0 : 360.0))
                .onTapGesture {
                    withAnimation(foreverAnimation, { isActivity.toggle() })
                }
        }
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
