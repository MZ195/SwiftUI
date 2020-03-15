//
//  CoursesList.swift
//  FIrstBoy
//
//  Created by Mazen .A on 14/03/2020.
//  Copyright © 2020 Mazen .A. All rights reserved.
//

import SwiftUI

struct CoursesList: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                CourseView()
                GeometryReader { coordinates in
                    CourseView()
                }
                .frame(height: 280)
                .frame(maxWidth: .infinity)
            }
            .frame(maxWidth: .infinity)
        }
    }
}

struct CoursesList_Previews: PreviewProvider {
    static var previews: some View {
        CoursesList()
    }
}

struct CourseView: View {
    
    @State var showCourseContent = false
    
    var body: some View {
        ZStack(alignment: .top) {
            
            VStack(alignment: .leading, spacing: 30) {
                Text("Take your SwiftUI app to the App Store with advanced techniques like API data, packages and CMS.")
                
                Text("About this course")
                    .font(.title).bold()
                
                Text("This course is unlike any other. We care about design and want to make sure that you get better at it in the process. It was written for designers and developers who are passionate about collaborating and building real apps for iOS and macOS. While it's not one codebase for all apps, you learn once and can apply the techniques and controls to all platforms with incredible quality, consistency and performance. It's beginner-friendly, but it's also packed with design tricks and efficient workflows for building great user interfaces and interactions.")
                
                Text("Minimal coding experience required, such as in HTML and CSS. Please note that Xcode 11 and Catalina are essentials. Once you get everything installed, it’ll get a lot friendlier! I added a bunch of troubleshoots at the end of this page to help you navigate the issues you might encounter.")
            }
            .padding(30)
            .frame(maxWidth: showCourseContent ? .infinity : screen.width - 60, maxHeight: showCourseContent ? .infinity : 280, alignment: .top)
            .offset(y: showCourseContent ? screen.height/2 : 0)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 20)
            .opacity(showCourseContent ? 1 : 0 )
            
            VStack {
                HStack {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("SwiftUI Advanced")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.white)
                        
                        Text("20 Sections")
                            .foregroundColor(Color.white.opacity(0.7))
                    }
                    Spacer()
                    ZStack {
                        Image(uiImage: #imageLiteral(resourceName: "Logo1"))
                            .opacity(showCourseContent ? 0 : 1)
                        
                        VStack {
                            Image(systemName: "xmark")
                                .foregroundColor(.white)
                        }
                        .frame(width: 36, height: 36)
                        .background(Color.black)
                        .clipShape(Circle())
                        .opacity(showCourseContent ? 1 : 0)
                    }
                }
                Spacer()
                Image(uiImage: #imageLiteral(resourceName: "Card2"))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    .frame(height: 140, alignment: .top)
                
            }
            .padding(showCourseContent ? 30 : 20)
            .padding(.top, showCourseContent ? 30 : 0)
            .background(Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)))
            .frame(maxWidth: showCourseContent ? .infinity : screen.width - 60, maxHeight: showCourseContent ? (screen.height/2) : 280)
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)).opacity(0.3), radius: 20, x: 0, y: 20)
            .onTapGesture {
                self.showCourseContent.toggle()
            }
        }
        .animation(.spring(response: 0.5, dampingFraction: 0.8, blendDuration: 0))
        .edgesIgnoringSafeArea(.all)
    }
}
