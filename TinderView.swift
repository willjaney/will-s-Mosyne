//
//  TinderView.swift
//  Future
//
//  Created by Will Janey on 7/1/20.
//  Copyright © 2020 Will Janey. All rights reserved.
//

import SwiftUI
import Firebase



//ProContentView

struct TinderView : View {
    
    // @Binding var show : Bool
    //should this sat getNotes22⁉️
    @ObservedObject var Notes = getPost()
    
    @State var show = false
    @State var isDragging = false
    @State var nextView = false
    
    @State var Voter = 1
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
    
    @State private var committee = 0
    @State var chPar = 25
    
    @State var x : [CGFloat] = [0,0,0,0,0,0,0]
    @State var degree : [Double] = [0,0,0,0,0,0,0]
    //@Binding var show : Bool
    
    @State var showPost = false
    
    var body : some View{
        
        ZStack() {
            Color.black.edgesIgnoringSafeArea(.all)
            
            Color("background2")
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .edgesIgnoringSafeArea(.bottom)
            
            //🚨🚨 One of these cards will take in an integer to tally how many yays and nays🚨🚨
            
            
            //🉐🉐🉐
            
            TinderCard(showPost: $showPost, viewState: $viewState, isDragging: $isDragging, committee: $committee, chPar: $chPar)
                
                
                
                //toggle rotation animation
                .scaleEffect(self.isDragging ? 0.9 : 1)
                //toggle rotation animation
                
                .hueRotation(Angle(degrees: Double (self.viewState.height)))
                //  .scaleEffect(1 - self.viewState.height / 1000)
                
                //  ♿️
                .offset(x: self.viewState.width, y: self.viewState.height)
                //  .blendMode(.hardLight)
                
                // .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0))
                //                 .animation(dismiss ? .easeOut : .spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0))
                
                
                //   ♿️
                // .rotation3DEffect(Angle(degrees: Double (self.viewState.height / 10)), axis: (x: 0, y: 10.0, z: 0))
                
                
                
                //                    .offset(x: self.x[i])
                //                    .rotationEffect(.init(degrees: self.degree[i]))
                
                
                //   🉐🉐🉐
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
                        
                        self.SaveVote()
                        
                    }
            )
                //.blendMode(.hardLight)
                .onTapGesture {
                    self.show.toggle()
            }
            
        }
        .edgesIgnoringSafeArea(.bottom)
    }
    func SaveVote(){
        
        let dbvote = Firestore.firestore()
        
        if self.docID != ""{
            // I dont think this is running ⤵️
            dbvote.collection("lilvoter").document(self.docID).updateData(["Voter":self.Voter]) { (err) in
                
                if err != nil{
                    
                    print((err?.localizedDescription)!)
                    return
                }
            }
        }
            
        else{
            // this is the one that actually sets the data, however the uper is what Im trying to ccess which is updating the data 🙋🏽‍♂️
            dbvote.collection("lilvoter").document().setData(["Voter":self.Voter]) { (err) in
                
                if err != nil{
                    
                    print((err?.localizedDescription)!)
                    return
                }
            }
        }
    }
}


//Cominted out becout getNote is called not getNotes22⤵️
//class getNotes22 : ObservableObject{
class getVotes : ObservableObject{
    
    @Published var data = [Vote]()
    @Published var noData = false
    
    init() {
        
        let dbvte = Firestore.firestore()
        //2️⃣
        dbvte.collection("lilvoter").order(by: "date", descending: false).addSnapshotListener { (snap, err) in
            
            if err != nil{
                
                print((err?.localizedDescription)!)
                self.noData = true
                return
            }
            
            if (snap?.documentChanges.isEmpty)!{
                
                self.noData = true
                return
            }
            
            
            for i in snap!.documentChanges{
                
                if i.type == .added{
                    
                    // when data is added...💡
                    
                    let id = i.document.documentID
                    //3️⃣
                    
                    let Voter = i.document.get("Voter") as! Int
                    
                    
                    self.data.append(Vote(id: id, voteCount: Voter))
                }
                
                if i.type == .modified{
                    
                    // when data is changed...💡
                    
                    let id = i.document.documentID
                    //4️⃣ notice that this might not be working🤷🏽‍♂️
                    let Voter = i.document.get("Voter") as! Int
                    
                    for i in 0..<self.data.count{
                        
                        if self.data[i].id == id{
                            
                            //self.data[i].note = notes
                            self.data[i].voteCount = Voter
                        }
                    }
                }
                
                if i.type == .removed{
                    
                    // when data is removed...💡
                    
                    let id = i.document.documentID
                    
                    for i in 0..<self.data.count{
                        
                        if self.data[i].id == id{
                            
                            self.data.remove(at: i)
                            
                            if self.data.isEmpty{
                                
                                self.noData = true
                            }
                            
                            return
                        }
                    }
                }
            }
        }
    }
}

struct Vote : Identifiable {
    var id : String
    var voteCount: Int
}

struct TinderView_Previews: PreviewProvider {
    static var previews: some View {
        TinderView().environmentObject(getPost())
    }
}

struct TinderCard : View {
    
    @ObservedObject var Notes = getPost()
    @State var show = false
    @State var txt = ""
    @State var docID = ""
    @State var remove = false
    
    
    
    @State var location = ""
    @State var headerText = ""
    @State var submit = false
    
    //  @State var showPost = false
    @Binding var showPost : Bool
    //  var course: PostInfo
    
    
    @Binding var viewState : CGSize
    @Binding var isDragging : Bool
    
    @Binding var committee : Int
    @Binding var chPar : Int
    
    var body : some View{
        
        ZStack(alignment: .top) {
            
            ForEach(self.Notes.data){i in
                
                VStack(alignment: .leading, spacing: 30){
                    
                    detailTop6501()
                    detailMiddle6501()
                    detailBottom6501()
                    
                }
                    
                    //                    HStack(spacing: 5){
                    //
                    //                        Image("map").renderingMode(.original)
                    //                        Text("\(i.location)").foregroundColor(Color(.black))
                    //
                    //                    }
                    //                    //Who
                    //                    Text("Committee \(i.committee)")
                    //                        .font(.title).bold()
                    //
                    //                    //what
                    //                    Text("\(i.header)")
                    //                        .font(.title).bold()
                    //
                    //
                    //                    Text("20 Sections \(i.note)")
                    //
                    //                    Text("This course is unlike any other. We care about design and want to make sure that you get better at it in the process. It's beginner-friendly, but it's also packed with design tricks and efficient workflows for building great user interfaces and interactions.")
                    
                    
                    .padding(30)
                    .frame(maxWidth: self.showPost ? .infinity : screen.width - 60, maxHeight: self.showPost ? .infinity : 280, alignment: .top)
                    .offset(y: self.showPost ? 385 : 0)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                    .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
                    .opacity(self.showPost ? 1 : 0)
            }
            
            //             VStack(spacing: 0){
            
            //                 HStack{
            //
            //                     Text("Notes").font(.title).foregroundColor(.white)
            //
            //                     Spacer()
            //
            //                     Button(action: {
            //
            //                         self.remove.toggle()
            //
            //                     }) {
            //
            //                         Image(systemName: self.remove ? "xmark.circle" : "trash").resizable().frame(width: 23, height: 23).foregroundColor(.white)
            //                     }
            //
            //                 }.padding()
            //                 .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
            //                 .background(Color.red)
            
            if self.Notes.data.isEmpty{
                
                if self.Notes.noData{
                    
                    Spacer()
                    
                    Text("No Notes !!!")
                    
                    Spacer()
                }
                else{
                    
                    Spacer()
                    
                    //Data is Loading ....
                    
                    Indicator1()
                    
                    Spacer()
                }
            }
                
            else{
                // need to change this to Post Store View
                // ScrollView(.vertical, showsIndicators: false) {
                // Might need to remove😅🥴 the foreach here
                
                VStack{
                    
                    ForEach(self.Notes.data){i in
                        
                        HStack(spacing: 15){
                            
                            Button(action: {
                                
                                self.docID = i.id
                                self.txt = i.note
                                
                                self.show.toggle()
                                
                            })
                            {
                                
                                ZStack {
                                    
                                    VStack(alignment: .leading, spacing: 8.0) {
                                        Text("\(i.date)")
                                            .font(.system(size: 24, weight: .bold))
                                            .foregroundColor(.white)
                                        Text("\(i.header)")
                                            .foregroundColor(Color.white.opacity(0.7))
                                    }
                                }
                                Spacer()
                                ZStack {
                                    Image(uiImage: #imageLiteral(resourceName: "Logo1"))
                                        .opacity(self.showPost ? 0 : 1)
                                    
                                    VStack {
                                        Image(systemName: "xmark")
                                            .font(.system(size: 16, weight: .medium))
                                            .foregroundColor(.white)
                                    }
                                    .frame(width: 36, height: 36)
                                    .background(Color.black)
                                    .clipShape(Circle())
                                    .onTapGesture {
                                        self.showPost = false
                                    }
                                    .opacity(self.showPost ? 1 : 0)
                                }
                                //                                         VStack(alignment: .leading, spacing: 12){
                                //
                                //                                             Text(i.date)
                                //
                                //                                             Text(i.note).lineLimit(1)
                                //
                                //                                             Divider()
                                //
                                //                                         }.padding(10)
                                //                                         .foregroundColor(.black)
                            }
                            
                            if self.remove{
                                
                                Button(action: {
                                    
                                    let db = Firestore.firestore()
                                    
                                    db.collection("notes").document(i.id).delete()
                                    
                                }) {
                                    
                                    Image(systemName: "minus.circle.fill")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .foregroundColor(.red)
                                }
                            }
                            
                        }.padding(.horizontal)
                        Spacer()
                        Image(uiImage: #imageLiteral(resourceName: "Card2"))
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: .infinity)
                            .frame(height: 140, alignment: .top)
                    }
                }
                .padding(.top, 100)
                .frame(width: 250, height: 400)
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
                    //toggle rotation animation
                    // .rotation3DEffect(Angle(degrees: 5), axis: (x: self.viewState.width, y: self.viewState.height, z: 0))
                    
                    .onTapGesture {
                        self.showPost.toggle()
                }
                
                
                //          }
            }
            
            //         }.edgesIgnoringSafeArea(.top)
            //            .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
            
            
        }
            
        .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
        .edgesIgnoringSafeArea(.all)
        .animation(.default)
    }
    
    
}

struct detailTop650 : View {
    @ObservedObject var Notes = getPost()
    var body : some View{
        
        ForEach(self.Notes.data) { i in
            VStack(alignment: .leading, spacing: 10){
                
                HStack{
                    
                    VStack(alignment: .leading){
                        
                        Text("\(i.header)").fontWeight(.heavy).font(.largeTitle)
                        
                        
                        
                    }
                    
                    Spacer()
                    
                    Text("$20").foregroundColor(Color("Krimson")).font(.largeTitle)
                }
                
            }.padding()
        }
    }
}


struct detailMiddle650 : View {
    @ObservedObject var Notes = getPost()
    var body : some View{
        
        ForEach(self.Notes.data) { i in
            VStack(alignment: .leading, spacing: 15){
                
                HStack(spacing: 5){
                    Image(systemName: "globe").renderingMode(.original)
                        .resizable()
                        .frame(width: 10.0, height: 10.0)
                    Spacer(minLength: 5)
                    
                    Text("\(i.date)").foregroundColor(.gray)
                }
                
                HStack(spacing: 5){
                    
                    Image("map").renderingMode(.original)
                    //                        .resizable()
                    //                        .frame(width: 10.0, height: 10.0)
                    //                    Spacer(minLength: 1)
                    Text("\(i.location)").foregroundColor(Color("Krimson"))
                    
                }
                
                HStack(spacing : 8){
                    
                    ForEach(0..<5){_ in
                        
                        Image(systemName: "star.fill").font(.body).foregroundColor(Color("oldGold"))
                    }
                }
                
            }.padding(.horizontal,15)
        }
    }
}

struct detailBottom650 : View {
    @ObservedObject var Notes = getPost()
    var body : some View{
        
        ForEach(self.Notes.data) { i in
            VStack(alignment: .leading, spacing: 10){
                
                Text("Description").fontWeight(.heavy)
                Text("\(i.note)").foregroundColor(.gray)
                
                //                HStack(spacing: 8){
                //
                //                    Button(action: {
                //
                //                    }) {
                //
                //                        Image("Save").renderingMode(.original)
                //                    }
                //
                //                    Button(action: {
                //
                //                    }) {
                //
                //                        HStack(spacing: 6){
                //
                //                            Text("Submit Your Resume")
                //                            Image("arrow").renderingMode(.original)
                //
                //                        }.foregroundColor(.white)
                //                            .padding()
                //
                //                    }.background(Color("Krimson"))
                //                        .cornerRadius(8)
                //
                //                }.padding(.top, 6)
                
            }.padding()
        }
    }
}


struct detailTop6501 : View {
    @ObservedObject var Notes = getPost()
    var body : some View{
        
        ForEach(self.Notes.data) { i in
            VStack(alignment: .leading, spacing: 10){
                
                HStack{
                    
                    VStack(alignment: .leading){
                        
                        Text("\(i.header)").fontWeight(.heavy).font(.largeTitle)
                        
                        
                        
                    }
                    
                    Spacer()
                    
                    Text("$20").foregroundColor(Color("Krimson")).font(.largeTitle)
                }
                
            }.padding()
        }
    }
}


struct detailMiddle6501 : View {
    @ObservedObject var Notes = getPost()
    var body : some View{
        
        ForEach(self.Notes.data) { i in
            VStack(alignment: .leading, spacing: 15){
                
                HStack(spacing: 5){
                    Image(systemName: "globe").renderingMode(.original)
                        .resizable()
                        .frame(width: 10.0, height: 10.0)
                    Spacer(minLength: 5)
                    
                    Text("\(i.date)").foregroundColor(.gray)
                }
                
                HStack(spacing: 5){
                    
                    Image("map").renderingMode(.original)
                    //                        .resizable()
                    //                        .frame(width: 10.0, height: 10.0)
                    //                    Spacer(minLength: 1)
                    Text("\(i.location)").foregroundColor(Color("Krimson"))
                    
                }
                
                HStack(spacing : 8){
                    
                    ForEach(0..<5){_ in
                        
                        Image(systemName: "star.fill").font(.body).foregroundColor(Color("oldGold"))
                    }
                }
                
            }.padding(.horizontal,15)
        }
    }
}

struct detailBottom6501 : View {
    @ObservedObject var Notes = getPost()
    var body : some View{
        
        ForEach(self.Notes.data) { i in
            VStack(alignment: .leading, spacing: 10){
                
                Text("Description").fontWeight(.heavy)
                Text("\(i.note)").foregroundColor(.gray)
                
                //                HStack(spacing: 8){
                //
                //                    Button(action: {
                //
                //                    }) {
                //
                //                        Image("Save").renderingMode(.original)
                //                    }
                //
                //                    Button(action: {
                //
                //                    }) {
                //
                //                        HStack(spacing: 6){
                //
                //                            Text("Submit Your Resume")
                //                            Image("arrow").renderingMode(.original)
                //
                //                        }.foregroundColor(.white)
                //                            .padding()
                //
                //                    }.background(Color("Krimson"))
                //                        .cornerRadius(8)
                //
                //                }.padding(.top, 6)
                
            }.padding()
        }
    }
}
