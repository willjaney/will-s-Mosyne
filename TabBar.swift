//
//  TabBar.swift
//  greekdomSocialApp
//
//  Created by Will Janey on 3/27/20.
//  Copyright © 2020 Will Janey. All rights reserved.
//

import SwiftUI

struct TabBar: View {
    
    var body: some View {
        TabView {
            Home().tabItem {
                Image(systemName: "play.circle.fill")
                Text("Home")
            }
            // CourseList().tabItem
            NotesFB().tabItem  {
                Image(systemName: "rectangle.stack.fill")
                Text("Courses")
            }
            
            ContentView().tabItem  {
                Image(systemName: "rectangle.stack.person.crop")
                Text("Profile")
            }
            
            //    ProfileView().tabItem  {
            //                           Image(systemName: "rectangle.stack.fill")
            //                           Text("Will Move")
            //                       }
            
            KappaEventCV().tabItem  {
                Image(systemName: "person")
                Text("Events")
            }
            
            TinderView().tabItem  {
                Image(systemName: "person.3")
                Text("Work")
            }
            
            
            
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TabBar().previewDevice("iPhone 8")
            TabBar().previewDevice("iPhone 11 Pro Max")
        }
    }
}

// let contentView = ProfileView()
//  let contentView = CreatePost()
// let contentView = NotesFB()
//let contentView = PostStore()

//   let contentView = Home()
// let contentView = CourseList()
