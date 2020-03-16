//
//  CoursesList.swift
//  FIrstBoy
//
//  Created by Mazen .A on 14/03/2020.
//  Copyright © 2020 Mazen .A. All rights reserved.
//

import SwiftUI

struct CoursesList: View {
    
    @State var courses = courseData
    @State var active = false
    @State var activeIndex = -1
    @State var activeView = CGSize.zero
    
    var body: some View {
        ZStack {
            
            Color.black.opacity(Double(activeView.height/500))
                .animation(.linear)
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack(spacing: 30) {
                    Text("Courses")
                        .font(.largeTitle).bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 30)
                        .padding(.top, 30)
                        .blur(radius: active ? 20 : 0)
                    
                    ForEach(courses.indices, id: \.self) { index in
                        GeometryReader { coordinates in
                            CourseView(
                                showCourseContent: self.$courses[index].showContent,
                                active: self.$active,
                                activeIndex: self.$activeIndex,
                                activeView: self.$activeView,
                                course: self.courses[index], index: index
                            )
                                .offset(y: self.courses[index].showContent ? -coordinates.frame(in: .global).minY : 0)
                                .opacity(self.activeIndex != index && self.active ? 0 : 1)
                                .scaleEffect(self.activeIndex != index && self.active ? 0.5 : 1)
                                .offset(x: self.activeIndex != index && self.active ? screen.width : 0)
                        }
                        .frame(height: 280)
                        .frame(maxWidth: self.courses[index].showContent ? .infinity : screen.width - 60)
                        .zIndex(self.courses[index].showContent ? 1 : 0)
                    }
                }
                .frame(maxWidth: .infinity)
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
            }
            .statusBar(hidden: active ? true : false)
            .animation(.linear)
        }
    }
}

struct CoursesList_Previews: PreviewProvider {
    static var previews: some View {
        CoursesList()
    }
}

struct CourseView: View {
    
    @Binding var showCourseContent: Bool
    @Binding var active: Bool
    @Binding var activeIndex: Int
    @Binding var activeView: CGSize
    
    var course: Course
    var index: Int
    
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
                        Text(course.title)
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.white)
                        
                        Text(course.subtitle)
                            .foregroundColor(Color.white.opacity(0.7))
                    }
                    Spacer()
                    ZStack {
                        Image(uiImage: course.logo)
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
                Image(uiImage: course.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    .frame(height: 140, alignment: .top)
                
            }
            .padding(showCourseContent ? 30 : 20)
            .padding(.top, showCourseContent ? 30 : 0)
            .background(Color(course.color))
            .frame(maxWidth: showCourseContent ? .infinity : screen.width - 60, maxHeight: showCourseContent ? (screen.height/2) : 280)
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: Color(course.color).opacity(0.3), radius: 20, x: 0, y: 20)
            .gesture( showCourseContent ?
                DragGesture()
                    .onChanged { value in
                        guard value.translation.height < 300 else {return}
                        guard value.translation.height > 0 else {return}
                        self.activeView = value.translation
                }
                .onEnded { value in
                    if self.activeView.height > 50{
                        self.showCourseContent = false
                        self.active = false
                        self.activeIndex = -1
                    }
                    self.activeView = .zero
                }
                : nil
            )
                .onTapGesture {
                    self.showCourseContent.toggle()
                    self.active.toggle()
                    
                    if self.showCourseContent {
                        self.activeIndex = self.index
                    } else {
                        self.activeIndex = -1
                    }
            }
//            if showCourseContent {
//                CourseDetails(showCourseContent: $showCourseContent, active: $active, activeIndex: $activeIndex, course: course)
//                    .background(Color.white)
//                    .animation(nil)
//            }
        }
        .frame(height: showCourseContent ? screen.height : 280)
        .scaleEffect(1 - self.activeView.height / 1000)
        .rotation3DEffect(Angle(degrees: Double(self.activeView.height/10)), axis: (x: 0, y: 10.0, z: 0))
        .animation(.spring(response: 0.5, dampingFraction: 0.8, blendDuration: 0))
        .edgesIgnoringSafeArea(.all)
        
    }
}

struct Course: Identifiable {
    var id = UUID()
    var title: String
    var subtitle: String
    var image: UIImage
    var logo: UIImage
    var color: UIColor
    var showContent: Bool
}

var courseData = [
    Course(title: "Prototype Designs in SwiftUI", subtitle: "18 Sections", image: #imageLiteral(resourceName: "Background1"), logo: #imageLiteral(resourceName: "Logo1"), color: #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1), showContent: false),
    Course(title: "SwiftUI Advanced", subtitle: "20 Sections", image: #imageLiteral(resourceName: "Card2"), logo: #imageLiteral(resourceName: "Logo1"), color: #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1), showContent: false),
    Course(title: "UI Design for Developers", subtitle: "20 Sections", image: #imageLiteral(resourceName: "Card4"), logo: #imageLiteral(resourceName: "Logo3"), color: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1), showContent: false)
]
