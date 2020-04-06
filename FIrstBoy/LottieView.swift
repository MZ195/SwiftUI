//
//  LottieView.swift
//  FIrstBoy
//
//  Created by Mazen .A on 06/04/2020.
//  Copyright © 2020 Mazen .A. All rights reserved.
//

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    typealias UIViewType = UIView
    
    var fileName: String
    
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView(frame: .zero)
        
        let animationView = AnimationView()
        let animationFile = Animation.named("loading")
        
        animationView.animation = animationFile
        animationView.contentMode = .scaleAspectFit
        animationView.play()
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {
        
    }
}
