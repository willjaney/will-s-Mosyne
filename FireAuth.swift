//
//  FireAuth.swift
//  Future
//
//  Created by Will Janey on 4/19/20.
//  Copyright © 2020 Will Janey. All rights reserved.
//

import SwiftUI
import FirebaseAuth
import Combine

//class SessionStore: ObservableObject {
//    var didChange = PassthroughSubject <SessionStore, Never>()
//    @Published var session: User? { didSet {self.didChange.send(self) }}
//    var handle: AuthStateDidChangeListenerHandle?
//    
//    func listen() {
//        handle = Auth.auth().addStateDidChangeListener({ (auth, user) in
//            if let user = user {
//                self.session = User(uid: user.uid, email: user.email)
//            } else {
//                self.session = nil
//            }
//        })
//    }
//    
//    func signUp(email: String, password: String, handler: @escaping AuthDataResultCallback) {
//        Auth.auth().createUser(withEmail: email, password: password, completion: handler)
//    }
//    
//    func signIn(email: String, password: String, handler: @escaping AuthDataResultCallback) {
//        Auth.auth().signIn(withEmail: email, password: password, completion: handler)
//    }
//    
//    func signOut() {
//        do{
//            try Auth.auth().signOut()
//            self.session = nil
//        }catch{
//            print("error signing out")
//        }
//    }
//     
//    func unbind() {
//        if let handle = handle {
//            Auth.auth().removeStateDidChangeListener(handle)
//        }
//    }
//    deinit {
//        unbind()
//    }
//}
//
//struct User {
//    var uid: String
//    var email: String?
//    
//    init(uid: String, email: String?){
//        self.uid = uid
//        self.email = email
//    }
//}
class FireAuth: ObservableObject{

    @State var EMAIL = ""
    @State var PASSWORD = ""

    //    var body: some View {
    //
    //
    //
    //    }
    func save(){
        guard let user = Auth.auth().currentUser else {
            return self.signin(auth: Auth.auth())
        }
        user.reload { (error) in
            switch user.isEmailVerified {

            case true:
                print("user email is verified")

            case false:
                user.sendEmailVerification{ (error) in

                    guard let error = error else{
                        return print ("user email verication sent")
                    }
                    self.handleError(error: error)
                }
                print ("verify it now")
            }

            }

            // print("Logged in user: \(user.email)")




        }

        func handleError(error: Error) {
            let errorAuthStatus = AuthErrorCode.init(rawValue: error._code)!
            switch errorAuthStatus {
            case .wrongPassword:
                print("wrongPassword")

            case .invalidEmail:
                print("invalidEmail")

            case .operationNotAllowed:
                print("operationNotAllowed")

            case .userDisabled:
                print("userDisabled")

            case .userNotFound:
                print("userNotFound")

                self.register(auth: Auth.auth())

            case .tooManyRequests:
                print("tooManyRequests")


            default: fatalError("error not supported here")
            }
        }

        func signin(auth: Auth) {

            auth.signIn(withEmail: EMAIL, password: PASSWORD){ (result, error) in

                guard error == nil else {
                    return self.handleError(error: error!)
                }

                guard let user = result?.user else {
                    fatalError("Not user do not know what went wrong")
                }
                print ("Signed in user: \(user.email)")
            }
        }



        func register(auth: Auth) {
            auth.createUser(withEmail: EMAIL, password: PASSWORD) {
                (result, error) in
                guard error == nil else {
                    return self.handleError(error: error!)
                }
                guard let user = result?.user else {
                    fatalError("Do not know why this would happen")
                }

                print("register user \(user.email)")
            }
        }
}

//    struct FireAuth_Previews: PreviewProvider {
//        static var previews: some View {
//            FireAuth().environmentObject(FireAuth())
//        }
//}
