//
//  LoginView.swift
//  FIrstBoy
//
//  Created by Mazen .A on 31/03/2020.
//  Copyright © 2020 Mazen .A. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    
    @State var show = false
    @State var viewState = CGSize.zero
    @State var isDragging = false
    
    var body: some View {
        ZStack(alignment: .top) {
            
            
            Color(.black)
                .edgesIgnoringSafeArea(.all)
            
            Color("background2")
                .edgesIgnoringSafeArea(.bottom)
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            
            VStack {
                GeometryReader { geometry in
                    Text("Learn Design & Code.\nFrom scratch")
                        .font(.system(size: geometry.size.width/10, weight: .bold))
                        .foregroundColor(.white)
                        .offset(x: self.viewState.width/15, y: self.viewState.height/15)
                }
                .frame(maxWidth: 375, maxHeight: 100)
                .padding(.horizontal, 16)
                
                Text("80 hourse of courses for SwiftUI, React and Design tools.")
                    .frame(width: 250)
                    .font(.subheadline)
                    .offset(x: self.viewState.width/15, y: self.viewState.height/15)
                
                Spacer()
            }
            .multilineTextAlignment(.center)
            .padding(.top, 100)
            .frame(height: 477)
            .frame(maxWidth: .infinity)
            .background(
                ZStack {
                    Image(uiImage: #imageLiteral(resourceName: "Blob"))
                        .offset(x: -150, y: -200)
                        .rotationEffect(Angle(degrees: show ? 360+90 : 90))
                        .blendMode(.plusDarker)
                        .animation(Animation.linear(duration: 102).repeatForever(autoreverses: false))
                        .onAppear {self.show = true}
                    
                    Image(uiImage: #imageLiteral(resourceName: "Blob"))
                        .offset(x: -200, y: -250)
                        .rotationEffect(Angle(degrees: show ? 360 : 0), anchor: .leading)
                        .animation(Animation.linear(duration: 100).repeatForever(autoreverses: false))
                        .blendMode(.overlay)
                }
            )
                .background(
                    Image(uiImage: #imageLiteral(resourceName: "Card3")).offset(x: self.viewState.width/25, y: self.viewState.height/25),
                    alignment: .bottom)
                .background(Color(#colorLiteral(red: 0.4117647059, green: 0.4705882353, blue: 0.9725490196, alpha: 1)))
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .scaleEffect(isDragging ? 0.9 : 1)
                .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8))
                .rotation3DEffect(Angle(degrees: 5), axis: (x: self.viewState.width, y: self.viewState.height, z: 0))
                .gesture(
                    DragGesture()
                        .onChanged {value in
                            self.viewState = value.translation
                            self.isDragging = true
                    }
                        
                    .onEnded { value in
                        self.viewState = .zero
                        self.isDragging = false
                    }
            )
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
