//
//  CreatePost.swift
//  Future
//
//  Created by Will Janey on 5/7/20.
//  Copyright © 2020 Will Janey. All rights reserved.
//

import SwiftUI
import Firebase



//ProContentView

struct CreatePost : View {
    
    // @Binding var show : Bool
    //should this sat getNotes22⁉️
   // @ObservedObject var Notes = getNotes()
    @ObservedObject var data = getData()
    
    
    @State var show = false
    @State var isDragging = false
    @State var nextView = false
    @State var showCard = false
    @State var bottomState = CGSize.zero
    @State var showFull = false
    @State var selection = 1
    
    @State var FirstName = ""
    @State var LastName = ""
    @State var LineName = ""
    @State var docID = ""
    @State var viewState = CGSize.zero
    
    @State var University = ""
    @State var Chapter = ""
    @State var YearCrossed = ""
    @State var LineNumber = ""
    
    @State var viewStateSchool = CGSize.zero
    
    @State var Position = ""
    @State var Major = ""
    @State var Minor = ""
    @State var GradDate = ""
    
    @State var viewStateCredential = CGSize.zero
    
    
    
    @State var x : [CGFloat] = [0,0,0,0,0,0,0]
    @State var degree : [Double] = [0,0,0,0,0,0,0]
    //@Binding var show : Bool
    
    var body : some View{
        
        ZStack() {
            Color.black.edgesIgnoringSafeArea(.all)
            
            Color("background2")
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .edgesIgnoringSafeArea(.bottom)
            
            
            CredentialCard(show: $show, viewStateCredential: $viewStateCredential, isDragging: $isDragging, Position: $Position, Major: $Major, Minor: $Minor, GradDate: $GradDate)
                
                //toggle rotation animation
                .scaleEffect(self.isDragging ? 0.9 : 1)
                //toggle rotation animation
                
                .hueRotation(Angle(degrees: Double (self.viewStateCredential.height)))
                //  .scaleEffect(1 - self.viewState.height / 1000)
                .offset(y : -50)
                //  ♿️
                .offset( x: self.viewStateCredential.width, y: self.viewStateCredential.height)
                .gesture(
                    DragGesture().onChanged{ value in
                        //toggles animation
                        //guard is cleaer than if
                        guard value.translation.height < 100 else { return }
                        guard value.translation.height > -100 else { return }
                        
                        guard value.translation.width > -100 else { return }
                        
                        self.viewStateCredential = value.translation
                        self.isDragging = true
                        
                        
                    }
                    .onEnded{ value in
                        
                        guard value.translation.height < 2000 else { return }
                        guard value.translation.height > -2000 else { return }
                        
                        self.viewStateCredential = .zero
                        self.isDragging = false
                        
                        
                        
                        guard value.translation.width >  200 else { return }
                        self.viewStateCredential = .init(width: 500, height: 0)
                        self.isDragging = false
                        
                        self.SaveData22()
                        
                        
                        
                        
                    }
            )
                //.blendMode(.hardLight)
                .onTapGesture {
                    self.show.toggle()
            }
            
            schoolCard(show: $show, viewStateSchool: $viewStateSchool, isDragging: $isDragging, University: $University, Chapter: $Chapter, YearCrossed: $YearCrossed, LineNumber: $LineNumber) //data: self.$Notes.data)
                
                //toggle rotation animation
                .scaleEffect(self.isDragging ? 0.9 : 1)
                //toggle rotation animation
                
                .hueRotation(Angle(degrees: Double (self.viewStateSchool.height)))
                //  .scaleEffect(1 - self.viewState.height / 1000)
                .offset(y : -30)
                //  ♿️
                .offset( x: self.viewStateSchool.width, y: self.viewStateSchool.height)
                .gesture(
                    DragGesture().onChanged{ value in
                        //toggles animation
                        //guard is cleaer than if
                        guard value.translation.height < 100 else { return }
                        guard value.translation.height > -100 else { return }
                        
                        guard value.translation.width > -100 else { return }
                        
                        self.viewStateSchool = value.translation
                        self.isDragging = true
                        
                        
                    }
                    .onEnded{ value in
                        
                        guard value.translation.height < 2000 else { return }
                        guard value.translation.height > -2000 else { return }
                        
                        self.viewStateSchool = .zero
                        self.isDragging = false
                        
                        
                        
                        guard value.translation.width >  200 else { return }
                        self.viewStateSchool = .init(width: 500, height: 0)
                        self.isDragging = false
                        
                        //  self.SaveData22()
                        
                        
                        
                        
                    }
            )
                //.blendMode(.hardLight)
                .onTapGesture {
                    self.show.toggle()
            }
            
            //🉐🉐🉐
            
            NameCard2(show: $show, showCard: $showCard, viewState: $viewState, isDragging: $isDragging, FirstName: $FirstName, LastName: $LastName, LineName: $LineName, selection: $selection, data: self.$data.datas)
                
                //toggle rotation animation
                .scaleEffect(self.isDragging ? 0.9 : 1)
                //toggle rotation animation
                
                .hueRotation(Angle(degrees: Double (self.viewState.height)))
                
                .offset(x: self.viewState.width, y: self.viewState.height)
                
                .gesture(
                    DragGesture().onChanged{ value in
                        //toggles animation
                        //guard is cleaer than if
                        guard value.translation.height < 100 else { return }
                        guard value.translation.height > -100 else { return }
                        
                        guard value.translation.width > -100 else { return }
                        
                        self.viewState = value.translation
                        self.isDragging = true
                        
                        
                    }
                    .onEnded{ value in
                        
                        guard value.translation.height < 2000 else { return }
                        guard value.translation.height > -2000 else { return }
                        
                        self.viewState = .zero
                        self.isDragging = false
                        
                        
                        
                        guard value.translation.width >  200 else { return }
                        self.viewState = .init(width: 500, height: 0)
                        self.isDragging = false
                        
                        // self.SaveData22()
                        
                    }
            )
                //.blendMode(.hardLight)
                .onTapGesture {
                    self.show.toggle()
                    // self.showCard.toggle()
            }
            
            
            
            BottomCardView2(showRing: $showCard, selection: $selection)
                .offset(y: showCard ? screen.height/2 - 50 : screen.height)
                .offset(y: bottomState.height)
                .blur(radius: show ? 20 : 0)
                .animation(.spring(response: 0.5, dampingFraction: 0.7, blendDuration: 0))
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            self.bottomState = value.translation
                            if self.showFull {
                                self.bottomState.height += -300
                            }
                            if self.bottomState.height < -300 {
                                self.bottomState.height = -300
                            }
                    }
                    .onEnded { value in
                        if self.bottomState.height > 50 {
                            self.showCard = false
                        }
                        if (self.bottomState.height < -100 && !self.showFull) || (self.bottomState.height < -250 && self.showFull) {
                            self.bottomState.height = -300
                            self.showFull = true
                        } else {
                            self.bottomState = .zero
                            self.showFull = false
                        }
                    }
            )
            
        }
        .edgesIgnoringSafeArea(.bottom)
    }
    func SaveData22(){
        
        let db22 = Firestore.firestore()
        
        if self.docID != ""{
            // I dont think this is running ⤵️
            db22.collection("lilrock").document(self.docID).updateData(["First Name":self.FirstName, "Last Name":self.LastName, "Line Name":self.LineName, "University":self.University, "Chapter":self.Chapter, "YearCrossed":self.YearCrossed, "Line Number":self.LineNumber, "Position":self.Position, "Major":self.Major, "Minor":self.Minor, "GradDate":self.GradDate]) { (err) in
                
                if err != nil{
                    
                    print((err?.localizedDescription)!)
                    return
                }
            }
        }
            
        else{
            // this is the one that actually sets the data, however the uper is what Im trying to ccess which is updating the data 🙋🏽‍♂️
            db22.collection("lilrock").document().setData(["First Name":self.FirstName, "Last Name":self.LastName,"Line Name":self.LineName, "University":self.University, "Chapter":self.Chapter, "YearCrossed":self.YearCrossed, "Line Number":self.LineNumber, "date":Date(), "Position":self.Position, "Major":self.Major, "Minor":self.Minor, "GradDate":self.GradDate]) { (err) in
                
                if err != nil{
                    
                    print((err?.localizedDescription)!)
                    return
                }
            }
        }
    }
}

struct NameCard2: View {
    
    @Binding var show : Bool
    @Binding var showCard : Bool
    @Binding var viewState : CGSize
    @Binding var isDragging : Bool
    
    @State var docID = ""
    
    @Binding var FirstName : String
    @Binding var LastName : String
    @Binding var LineName : String
    
    @Binding var selection: Int
    @State var txt = ""
    @Binding var data : [dataType]
    
    
    var body: some View {
        ZStack {
            
            VStack() {
                GeometryReader { geometry in
                    Text("Greekdom thanks you for joining!")
                        .font(.system(size: geometry.size.width/10, weight: .bold))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                    
                }
                .frame(maxWidth: 375, maxHeight: 100)
                .padding(.horizontal, 16)
                .offset(x: viewState.width/15, y: viewState.height/15)
                
                
                Text("Tell us more about you!")
                    .font(.subheadline)
                    .foregroundColor(.white)
                    
                    .frame(width: 250)
                    .offset(x: viewState.width/20, y: viewState.height/20)
                
                
                
                Spacer()
                
            }
                
            .padding(.top, 100)
            .frame(width: 400, height: 700)
            .frame(maxWidth: .infinity)
            .shadow(radius: 30)
            .background(
                
                ZStack {
                    Image(uiImage: #imageLiteral(resourceName: "Blob"))
                        .offset(x: -150, y: -200)
                        .rotationEffect(Angle(degrees: show ? 360+90 : 90))
                        .blendMode(.plusDarker)
                        //                    .animation(Animation.linear(duration: 120).repeatForever(autoreverses: false))
                        .animation(nil)
                        .onAppear { self.show = true }
                    
                    Image(uiImage: #imageLiteral(resourceName: "Blob"))
                        .offset(x: -200, y: -250)
                        .rotationEffect(Angle(degrees: show ? 360 : 0), anchor: .leading)
                        .blendMode(.overlay)
                        //                    .animation(Animation.linear(duration: 120).repeatForever(autoreverses: false))
                        .animation(nil)
                }
            )
                .background(
                    Image(uiImage: #imageLiteral(resourceName: "Card3"))
                        .offset(x: viewState.width/25, y: viewState.height/25)
                    , alignment: .bottom
            )
                .background(Color(#colorLiteral(red: 0.4117647059, green: 0.4705882353, blue: 0.9725490196, alpha: 1)))
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                
                
                .rotation3DEffect(Angle(degrees: Double (self.viewState.height / 20)), axis: (x: 0, y: 10.0, z: 0))
                .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8))
            
            //🥴🥴🥴🥴🥴🥴🥴🥴🥴🥴🥴🥴🥴🥴
//            VStack(spacing: 0){
//
//                HStack{
//
//                    TextField("Committee", text: self.$txt)
//
//                    if self.txt != ""{
//
//                        Button(action: {
//
//                            self.txt = ""
//
//                        }) {
//
//                            Text("Cancel")
//                        }
//                        .foregroundColor(.black)
//
//                    }
//
//                }.padding()
//
//                if self.txt != ""{
//
//                    if  self.data.filter({$0.chapter.lowercased().contains(self.txt.lowercased())}).count == 0{
//
//                        Text("No Results Found").foregroundColor(Color.black.opacity(0.5)).padding()
//                    }
//                    else{
//
//                        List(self.data.filter{$0.chapter.lowercased().contains(self.txt.lowercased())}){i in
//
//                            Text(i.chapter)
//
//                                .font(.system(size: 10))
//                                .font(.caption)
//
//                        }.frame(height: UIScreen.main.bounds.height / 5)
//                    }
//
//                }
//
//                Divider().padding(.leading, 80)
//
//
//
//            }
//            .frame(height: 90)
//            .frame(maxWidth: .infinity)
//            .background(BlurView(style: .systemMaterial))
//            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
//            .shadow(color: Color.black.opacity(0.15), radius: 20, x: 0, y: 20)
//            .padding(.horizontal)
//            .offset(y: 0)
            
            
            //🥱🥱🥱🥱🥱🥱🥱🥱🥱
            
            VStack {
                HStack {
                                 Image(systemName: "lock.fill")
                                     .foregroundColor(Color(#colorLiteral(red: 0.6549019608, green: 0.7137254902, blue: 0.862745098, alpha: 1)))
                                     .frame(width: 44, height: 44)
                                     .background(Color.white)
                                     .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                                     .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0, y: 5)
                                     .padding(.leading)
                                 
                                 TextField("Which Committee?", text: $FirstName)
                                     
                                     .keyboardType(.default)
                                     .font(.subheadline)
                                     .padding(.leading)
                                     .frame(height: 44)
                }
            }.frame(height: 90)
            .frame(maxWidth: .infinity)
            .background(BlurView(style: .systemMaterial))
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: Color.black.opacity(0.15), radius: 20, x: 0, y: 20)
            .padding(.horizontal)
            .offset(y: 0)
            
            VStack {
                    HStack {
                            Image(systemName: "lock.fill")
                                .foregroundColor(Color(#colorLiteral(red: 0.6549019608, green: 0.7137254902, blue: 0.862745098, alpha: 1)))
                                .frame(width: 44, height: 44)
                                .background(Color.white)
                                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                                .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0, y: 5)
                                .padding(.leading)
                            
                            TextField("Event Description", text: $FirstName)
                                
                                .keyboardType(.default)
                                .font(.subheadline)
                                .padding(.leading)
                                .frame(height: 44)
                                .multilineTextAlignment(.leading)
                           }
                       }.frame(height: 270)
                       .frame(maxWidth: .infinity)
                       .background(BlurView(style: .systemMaterial))
                       .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                       .shadow(color: Color.black.opacity(0.15), radius: 20, x: 0, y: 20)
                       .padding(.horizontal)
                       .offset(y: 200)
            
           
            
            VStack {
                Text("Add date here \(selection)")
            } .frame(height: 90)
                .frame(maxWidth: .infinity)
                .background(BlurView(style: .systemMaterial))
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(color: Color.black.opacity(0.15), radius: 20, x: 0, y: 20)
                .padding(.horizontal)
                .offset(y: -100)
                
                .onTapGesture {
                    self.show.toggle()
                    self.showCard.toggle()
            }
            
            VStack {
                          Text("Which committee \(selection)")
                      } .frame(height: 90)
                          .frame(maxWidth: .infinity)
                          .background(BlurView(style: .systemMaterial))
                          .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                          .shadow(color: Color.black.opacity(0.15), radius: 20, x: 0, y: 20)
                          .padding(.horizontal)
                          .offset(y: -200)
                          
                          .onTapGesture {
                              self.show.toggle()
                              self.showCard.toggle()
                      }
            
        }
    }
    
    
}

struct schoolCard2: View {
    
    @Binding var show : Bool
    @Binding var viewStateSchool : CGSize
    @Binding var isDragging : Bool
    
    @State var docID = ""
    //why is the below neccessary⁉️⤵️
    @Binding var University : String
    @Binding var Chapter : String
    @Binding var YearCrossed : String
    @Binding var LineNumber : String
    
    //    @Binding var docID : String
    
    @State var txt = ""
    
    var body: some View {
        ZStack {
            
            VStack() {
                GeometryReader { geometry in
                    Text("Greekdom thanks you for joining!")
                        .font(.system(size: geometry.size.width/10, weight: .bold))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                    
                }
                .frame(maxWidth: 375, maxHeight: 100)
                .padding(.horizontal, 16)
                .offset(x: viewStateSchool.width/15, y: viewStateSchool.height/15)
                
                
                Text("Tell us more about you!")
                    .font(.subheadline)
                    .foregroundColor(.white)
                    
                    .frame(width: 250)
                    .offset(x: viewStateSchool.width/20, y: viewStateSchool.height/20)
                
                
                
                Spacer()
                
            }
                
            .padding(.top, 100)
            .frame(width: 400, height: 700)
            .frame(maxWidth: .infinity)
            .shadow(radius: 30)
            .background(
                ZStack {
                    Image(uiImage: #imageLiteral(resourceName: "Blob"))
                        .offset(x: -150, y: -200)
                        .rotationEffect(Angle(degrees: show ? 360+90 : 90))
                        .blendMode(.plusDarker)
                        //                    .animation(Animation.linear(duration: 120).repeatForever(autoreverses: false))
                        .animation(nil)
                        .onAppear { self.show = true }
                    
                    Image(uiImage: #imageLiteral(resourceName: "Blob"))
                        .offset(x: -200, y: -250)
                        .rotationEffect(Angle(degrees: show ? 360 : 0), anchor: .leading)
                        .blendMode(.overlay)
                        //                    .animation(Animation.linear(duration: 120).repeatForever(autoreverses: false))
                        .animation(nil)
                }
            )
                .background(
                    Image(uiImage: #imageLiteral(resourceName: "Card6"))
                        .offset(x: viewStateSchool.width/25, y: viewStateSchool.height/25)
                    , alignment: .bottom
            )
                .background(Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)))
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                
                
                .rotation3DEffect(Angle(degrees: Double (self.viewStateSchool.height / 20)), axis: (x: 0, y: 10.0, z: 0))
                .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8))
            //toggle rotation animation
            // .rotation3DEffect(Angle(degrees: 5), axis: (x: self.viewState.width, y: self.viewState.height, z: 0))
            
            
            
            VStack(alignment: .leading)  {
                HStack {
                    Image(systemName: "person.crop.circle.fill")
                        .foregroundColor(Color(#colorLiteral(red: 0.6549019608, green: 0.7137254902, blue: 0.862745098, alpha: 1)))
                        .frame(width: 44, height: 44)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                        .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0, y: 5)
                        .padding(.leading)
                    
                    
                    TextField("University", text: $University)
                        .keyboardType(.default)
                        .font(.subheadline)
                        
                        //                    .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.leading)
                        .frame(height: 44)
                    
                }
                
                Divider().padding(.leading, 80)
                
                HStack {
                    Image(systemName: "lock.fill")
                        .foregroundColor(Color(#colorLiteral(red: 0.6549019608, green: 0.7137254902, blue: 0.862745098, alpha: 1)))
                        .frame(width: 44, height: 44)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                        .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0, y: 5)
                        .padding(.leading)
                    
                    TextField("What's your chapter?", text: $Chapter)
                        
                        .keyboardType(.default)
                        .font(.subheadline)
                        .padding(.leading)
                        .frame(height: 44)
                }
                
                Divider().padding(.leading, 80)
                
                HStack {
                    Image(systemName: "lock.fill")
                        .foregroundColor(Color(#colorLiteral(red: 0.6549019608, green: 0.7137254902, blue: 0.862745098, alpha: 1)))
                        .frame(width: 44, height: 44)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                        .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0, y: 5)
                        .padding(.leading)
                    
                    TextField("What year did you cross?", text: $YearCrossed)
                        
                        .keyboardType(.default)
                        .font(.subheadline)
                        .padding(.leading)
                        .frame(height: 44)
                }
                
                Divider().padding(.leading, 80)
                
                HStack {
                    
                    Image(systemName: "lock.fill")
                        .foregroundColor(Color(#colorLiteral(red: 0.6549019608, green: 0.7137254902, blue: 0.862745098, alpha: 1)))
                        .frame(width: 44, height: 44)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                        .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0, y: 5)
                        .padding(.leading)
                    
                    TextField("What's your line number?", text: $LineNumber)
                        
                        .keyboardType(.default)
                        .font(.subheadline)
                        .padding(.leading)
                        .frame(height: 44)
                }
                
            }
            .frame(height: 240)
            .frame(maxWidth: .infinity)
            .rotation3DEffect(Angle(degrees: Double (self.viewStateSchool.height / 10)), axis: (x: 0, y: 10.0, z: 0))
            .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8))
            .background(BlurView(style: .systemMaterial))
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: Color.black.opacity(0.15), radius: 20, x: 0, y: 20)
            .padding(.horizontal)
            .offset(y: 0)
        
            
        }
    }
}

struct CredentialCard2: View {
    
    @Binding var show : Bool
    @Binding var viewStateCredential : CGSize
    @Binding var isDragging : Bool
    
    @State var docID = ""
    
    @Binding var Position : String
    @Binding var Major : String
    @Binding var Minor : String
    @Binding var GradDate : String
    
    
    var body: some View {
        ZStack {
            
            VStack() {
                GeometryReader { geometry in
                    Text("Greekdom thanks you for joining!")
                        .font(.system(size: geometry.size.width/10, weight: .bold))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                    
                }
                .frame(maxWidth: 375, maxHeight: 100)
                .padding(.horizontal, 16)
                .offset(x: viewStateCredential.width/15, y: viewStateCredential.height/15)
                
                
                Text("Tell us more about you!")
                    .font(.subheadline)
                    .foregroundColor(.white)
                    
                    .frame(width: 250)
                    .offset(x: viewStateCredential.width/20, y: viewStateCredential.height/20)
                
                
                
                Spacer()
                
            }
                
            .padding(.top, 100)
            .frame(width: 400, height: 700)
            .frame(maxWidth: .infinity)
            .shadow(radius: 30)
            .background(
                ZStack {
                    Image(uiImage: #imageLiteral(resourceName: "Blob"))
                        .offset(x: -150, y: -200)
                        .rotationEffect(Angle(degrees: show ? 360+90 : 90))
                        .blendMode(.plusDarker)
                        //                    .animation(Animation.linear(duration: 120).repeatForever(autoreverses: false))
                        .animation(nil)
                        .onAppear { self.show = true }
                    
                    Image(uiImage: #imageLiteral(resourceName: "Blob"))
                        .offset(x: -200, y: -250)
                        .rotationEffect(Angle(degrees: show ? 360 : 0), anchor: .leading)
                        .blendMode(.overlay)
                        //                    .animation(Animation.linear(duration: 120).repeatForever(autoreverses: false))
                        .animation(nil)
                }
            )
                .background(
                    Image(uiImage: #imageLiteral(resourceName: "Card3"))
                        .offset(x: viewStateCredential.width/25, y: viewStateCredential.height/25)
                    , alignment: .bottom
            )
                .background(Color(#colorLiteral(red: 0.7406701446, green: 0, blue: 0, alpha: 1)))
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                
                
                .rotation3DEffect(Angle(degrees: Double (self.viewStateCredential.height / 20)), axis: (x: 0, y: 10.0, z: 0))
                .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8))
            //toggle rotation animation
            // .rotation3DEffect(Angle(degrees: 5), axis: (x: self.viewState.width, y: self.viewState.height, z: 0))
            
            VStack(alignment: .leading)  {
                HStack {
                    Image(systemName: "person.crop.circle.fill")
                        .foregroundColor(Color(#colorLiteral(red: 0.6549019608, green: 0.7137254902, blue: 0.862745098, alpha: 1)))
                        .frame(width: 44, height: 44)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                        .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0, y: 5)
                        .padding(.leading)
                    
                    
                    TextField("What's your chapter position?", text: $Position)
                        .keyboardType(.default)
                        .font(.subheadline)
                        
                        //                    .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.leading)
                        .frame(height: 44)
                    
                }
                
                Divider().padding(.leading, 80)
                
                HStack {
                    Image(systemName: "lock.fill")
                        .foregroundColor(Color(#colorLiteral(red: 0.6549019608, green: 0.7137254902, blue: 0.862745098, alpha: 1)))
                        .frame(width: 44, height: 44)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                        .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0, y: 5)
                        .padding(.leading)
                    
                    TextField("What's your major?", text: $Major)
                        
                        .keyboardType(.default)
                        .font(.subheadline)
                        //                    .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        .padding(.leading)
                        .frame(height: 44)
                }
                
                Divider().padding(.leading, 80)
                
                HStack {
                    Image(systemName: "lock.fill")
                        .foregroundColor(Color(#colorLiteral(red: 0.6549019608, green: 0.7137254902, blue: 0.862745098, alpha: 1)))
                        .frame(width: 44, height: 44)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                        .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0, y: 5)
                        .padding(.leading)
                    
                    TextField("What's your minor?", text: $Minor)
                        
                        .keyboardType(.default)
                        .font(.subheadline)
                        //                    .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        .padding(.leading)
                        .frame(height: 44)
                }
                
                Divider().padding(.leading, 80)
                
                HStack {
                    Image(systemName: "lock.fill")
                        .foregroundColor(Color(#colorLiteral(red: 0.6549019608, green: 0.7137254902, blue: 0.862745098, alpha: 1)))
                        .frame(width: 44, height: 44)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                        .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0, y: 5)
                        .padding(.leading)
                    
                    TextField("What's your Graduation date", text: $GradDate)
                        
                        .keyboardType(.default)
                        .font(.subheadline)
                        //                    .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        .padding(.leading)
                        .frame(height: 44)
                }
                
            }
            .frame(height: 240)
            .frame(maxWidth: .infinity)
            .rotation3DEffect(Angle(degrees: Double (self.viewStateCredential.height / 10)), axis: (x: 0, y: 10.0, z: 0))
            .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8))
            .background(BlurView(style: .systemMaterial))
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: Color.black.opacity(0.15), radius: 20, x: 0, y: 20)
            .padding(.horizontal)
            .offset(y: 0)
        
            
        }
    }
}

struct ChapterCard2: View {
    var body: some View {
        VStack {
            Spacer()
        }
        .frame(width: 400, height: 700)
        
    }
}


struct CreatePost_Previews: PreviewProvider {
    static var previews: some View {
        CreatePost()
    }
}

struct BottomCardView2: View {
    @Binding var showRing: Bool
    @ObservedObject var Notes = getNotes()
    @Binding var selection: Int
    
    var body: some View {
        VStack(spacing: 20) {
            Rectangle()
                .frame(width: 40, height: 5)
                .cornerRadius(3)
                .opacity(0.1)
            
            // Text(Notes.data.fi)
            
            VStack(alignment: .leading) {
                
                Picker(selection: $selection, label: Text( "")){
                    Text("Yabba Dabba DO").tag(1)
                    Text("Yabba Dabba DOn't").tag(2)
                    
                }.padding()
                
            }.padding()
            
            
            Spacer()
        }
        .frame(maxWidth: 600)
        .padding(.top, 8)
        .padding(.horizontal, 20)
        .background(BlurView(style: .systemThinMaterial))
        .cornerRadius(30)
        .shadow(radius: 30)
        
    }
}



struct CustomSearchBar : View {
    
    @State var txt = ""
    @Binding var data : [dataType]
    
    var body : some View{
        
        VStack(spacing: 0){
            
            HStack{
                
                TextField("Committee", text: self.$txt)
                
                if self.txt != ""{
                    
                    Button(action: {
                        
                        self.txt = ""
                        
                    }) {
                        
                        Text("Cancel")
                    }
                    .foregroundColor(.black)
                    
                }
                
            }.padding()
            
            if self.txt != ""{
                
                if  self.data.filter({$0.chapter.lowercased().contains(self.txt.lowercased())}).count == 0{
                    
                    Text("No Results Found").foregroundColor(Color.black.opacity(0.5)).padding()
                }
                else{
                    
                    List(self.data.filter{$0.chapter.lowercased().contains(self.txt.lowercased())}){i in
                        
                        Text(i.chapter)
                            
                            .font(.system(size: 10))
                            .font(.caption)
                        
                    }.frame(height: UIScreen.main.bounds.height / 5)
                }
                
            }
            
            
        }
            
            //        }.background(Color.white)
            //        .padding()
            .frame(height: 90)
            .frame(maxWidth: .infinity)
            //                   .rotation3DEffect(Angle(degrees: Double (self.viewState.height / 10)), axis: (x: 0, y: 10.0, z: 0))
            //                   .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8))
            .background(BlurView(style: .systemMaterial))
            
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: Color.black.opacity(0.15), radius: 20, x: 0, y: 20)
            .padding(.horizontal)
            .offset(y: 0)
    }
}

class getData : ObservableObject{
    
    @Published var datas = [dataType]()
    
    init() {
        
        let db = Firestore.firestore()
        
        db.collection("lilcollege").getDocuments { (snap, err) in
            
            if err != nil{
                
                print((err?.localizedDescription)!)
                return
            }
            
            for i in snap!.documents{
                
                let id = i.documentID
                let chapter = i.get("chapter") as! String
                
                
                self.datas.append(dataType(id: id, chapter: chapter))
            }
        }
    }
}

struct dataType : Identifiable {
    
    var id : String
    var chapter : String
}
