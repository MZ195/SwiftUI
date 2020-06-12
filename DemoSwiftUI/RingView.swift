//
//  RingView.swift
//  FIrstBoy
//
//  Created by Mazen .A on 12/03/2020.
//  Copyright © 2020 Mazen .A. All rights reserved.
//

import SwiftUI

struct RingView: View {
    
    @Binding var showProgress: Bool
    
    var color1 = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
    var color2 = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
    var width:CGFloat = 88
    var height:CGFloat = 88
    var percent:CGFloat = 80
    var image:Image? = nil
    
    var body: some View {
        
        let ratio = width/44
        let progress = (100 - percent)/100
        
        return ZStack {
            Circle()
                .stroke(Color.black.opacity(0.1), style: StrokeStyle(lineWidth: (5 * ratio)))
                .frame(width: width, height: height)
            
            Circle()
                .trim(from: showProgress ? progress : 1, to: 1)
                .stroke(LinearGradient(gradient: Gradient(colors: [Color(color1), Color(color2)]), startPoint: .topTrailing, endPoint: .bottomLeading),
                        style: StrokeStyle(lineWidth: (5 * ratio), lineCap: .round, lineJoin: .round, miterLimit: .infinity, dash: [20, 0], dashPhase: 0))
                .rotationEffect(Angle(degrees: 90))
                .rotation3DEffect(Angle(degrees: 180), axis: (x: 1 , y: 0, z: 0))
                .frame(width: width, height: height)
                .shadow(color: Color(color2).opacity(0.1), radius: (3 * ratio), x: 0, y: (3 * ratio))
//                .animation(.easeInOut)
            
            Text("\(Int(percent))%")
                .font(.system(size: (14 * ratio)))
                .fontWeight(.bold)
                .onTapGesture {
                    self.showProgress.toggle()
            }
        }
    }
}

struct RingView_Previews: PreviewProvider {
    static var previews: some View {
        RingView(showProgress: .constant(true))
    }
}
