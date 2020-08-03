//
//  ContentViewish.swift
//  Future
//
//  Created by Will Janey on 4/20/20.
//  Copyright © 2020 Will Janey. All rights reserved.
//

//import SwiftUI
//
//struct ContentViewish: View {
//    @EnvironmentObject var session: SessionStore
//    
//    func getUser() {
//        session.listen()
//    }
//   
//    
//    var body: some View {
//        Group {
//            if (session.session != nil) {
//                Text("Welcome Back user!")
//                Button(action: session.signOut) {
//                     Text("Sign Out")
//                   }
//            } else {
//                AuthView()
//            }
//        }.onAppear(perform: getUser)
//    }
//}
//
//struct ContentViewish_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentViewish().environmentObject(SessionStore())
//    }
//}
