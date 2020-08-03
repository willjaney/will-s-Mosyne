//
//  ProfileView.swift
//  Future
//
//  Created by Will Janey on 4/16/20.
//  Copyright © 2020 Will Janey. All rights reserved.
//

import SwiftUI
import Firebase



//ProContentView

struct ProfileView : View {
    
    // @Binding var show : Bool
    //should this sat getNotes22⁉️
    @ObservedObject var Notes = getNotes()
    
    @State var show = false
    @State var isDragging = false
    @State var nextView = false
    @State var sliderRight = false
    
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
            
            NameCard(show: $show, viewState: $viewState, isDragging: $isDragging, FirstName: $FirstName, LastName: $LastName, LineName: $LineName)
                
                
                
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
                        
                       // self.SaveData22()
                        
                    }
            )
                //.blendMode(.hardLight)
                .onTapGesture {
                    self.show.toggle()
            }
            
            
            
            TinderBottomView(sliderRight: self.$sliderRight)
            .offset(y: 350)
            
            TinderTopView(show: self.$show)
                .offset(y: -350)

            
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


//Cominted out becout getNote is called not getNotes22⤵️
//class getNotes22 : ObservableObject{
class getNotes : ObservableObject{
    
    @Published var data = [Note]()
    @Published var noData = false
    
    init() {
        
        let db1 = Firestore.firestore()
        //2️⃣
        db1.collection("lilrock").order(by: "date", descending: false).addSnapshotListener { (snap, err) in
            
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
                   
                    let FirstName = i.document.get("First Name") as! String
                    let LastName = i.document.get("Last Name") as! String
                    let LineName = i.document.get("Line Name") as! String
                    
                    let University = i.document.get("University") as! String
                    let Chapter = i.document.get("Chapter") as! String
                    let YearCrossed = i.document.get("YearCrossed") as! String
                    let LineNumber = i.document.get("Line Number") as! String
                    
                    
                    let Position  = i.document.get("Position") as! String
                    let Major  = i.document.get("Major") as! String
                    let Minor  = i.document.get("Minor") as! String
                    let GradDate = i.document.get("GradDate") as! String

                    let date = i.document.get("date") as! Timestamp
                    
                    let format = DateFormatter()
                    
                    format.dateFormat = "dd-MM-YY hh:mm a"
                    
                    let dateString = format.string(from: date.dateValue())
                    
                    self.data.append(Note(id: id, date: dateString, firstName: FirstName, lastName: LastName, lineName: LineName, university: University, chapter: Chapter, yearCrossed: YearCrossed, lineNumber: LineNumber, position: Position, major: Major, minor: Minor, gradDate: GradDate))
                }
                
                if i.type == .modified{
                    
                    // when data is changed...💡
                    
                    let id = i.document.documentID
                    //4️⃣ notice that this might not be working🤷🏽‍♂️
                    let FirstName = i.document.get("First Name") as! String
                    
                    for i in 0..<self.data.count{
                        
                        if self.data[i].id == id{
                            
                            //self.data[i].note = notes
                            self.data[i].firstName = FirstName
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

struct Note : Identifiable {
    
    var id : String
    //var note : String
    var date : String
    
    var firstName: String
    var lastName: String
    var lineName: String
    
    
    var university: String
    var chapter: String
    var yearCrossed: String
    var lineNumber: String
    
    var position: String
   // var careerStatus: String
   // var careerField: String
    var major: String
    var minor: String
    //var age: String
    var gradDate: String
   //I will add this once I figure out the strings first ⤵️
    //var image: UIImage
    
    
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView().environmentObject(getNotes())
    }
}

struct NameCard: View {
    
    @Binding var show : Bool
    @Binding var viewState : CGSize
    @Binding var isDragging : Bool
    //    @Binding var opacity : Bool
    
    //    @State var FirstName = ""
    //    @State var LastName = ""
    //    @State var LineName = ""
    @State var docID = ""
    
    @Binding var FirstName : String
    @Binding var LastName : String
    @Binding var LineName : String
    //    @Binding var docID : String
    
    
    
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
                    
                    
                    TextField("First Name", text: $FirstName)
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
                    
                    TextField("Last Name", text: $LastName)
                        
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
                    
                    TextField("Line Name", text: $LineName)
                        
                        .keyboardType(.default)
                        .font(.subheadline)
                        //                    .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        .padding(.leading)
                        .frame(height: 44)
                }
                
            }
            .frame(height: 180)
            .frame(maxWidth: .infinity)
            .rotation3DEffect(Angle(degrees: Double (self.viewState.height / 10)), axis: (x: 0, y: 10.0, z: 0))
            .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8))
            .background(BlurView(style: .systemMaterial))
                //.background(Color(#colorLiteral(red: 0.8388318419, green: 0.8425335884, blue: 0.8903892636, alpha: 1)).opacity(isDragging ? 0.1 : 0))
                //.offset(x: viewState.width/25, y: viewState.height/25)
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(color: Color.black.opacity(0.15), radius: 20, x: 0, y: 20)
                .padding(.horizontal)
                .offset(y: 0)
            
            
        }
    }
    
    
}

struct schoolCard: View {
    
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
    // @Binding var data : [Note]
    // @Binding var viewStateSchool : CGSize
    
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
                    
                    TextField("What year did you cross?", text: $YearCrossed)
                        
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
                    
                    TextField("What's your line number?", text: $LineNumber)
                        
                        .keyboardType(.default)
                        .font(.subheadline)
                        //                    .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        .padding(.leading)
                        .frame(height: 44)
                }
                
            }
            .frame(height: 240)
            .frame(maxWidth: .infinity)
            .rotation3DEffect(Angle(degrees: Double (self.viewStateSchool.height / 10)), axis: (x: 0, y: 10.0, z: 0))
            .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8))
            .background(BlurView(style: .systemMaterial))
                //.background(Color(#colorLiteral(red: 0.8388318419, green: 0.8425335884, blue: 0.8903892636, alpha: 1)).opacity(isDragging ? 0.1 : 0))
                //.offset(x: viewState.width/25, y: viewState.height/25)
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(color: Color.black.opacity(0.15), radius: 20, x: 0, y: 20)
                .padding(.horizontal)
                .offset(y: 0)
            
            //.frame(height: show ? 50 : 100)
            //    .frame(maxWidth: .infinity)
            //                .rotation3DEffect(Angle(degrees: Double (self.viewStateSchool.height / 10)), axis: (x: 0, y: 10.0, z: 0))
            //                .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8))
            //               // .background(BlurView(style: .systemMaterial))
            //
            //                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            //                .shadow(color: Color.black.opacity(0.15), radius: 20, x: 0, y: 20)
            //                .padding(.horizontal)
            //                //.offset(y: 0)
            //                .padding()
            
            
        }
    }
}

struct CredentialCard: View {
    
    @Binding var show : Bool
    @Binding var viewStateCredential : CGSize
    @Binding var isDragging : Bool
    //    @Binding var opacity : Bool
    
    //    @State var FirstName = ""
    //    @State var LastName = ""
    //    @State var LineName = ""
    @State var docID = ""
    
    @Binding var Position : String
    @Binding var Major : String
    @Binding var Minor : String
    @Binding var GradDate : String
    //    @Binding var docID : String
    
    
    
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
                //.background(Color(#colorLiteral(red: 0.8388318419, green: 0.8425335884, blue: 0.8903892636, alpha: 1)).opacity(isDragging ? 0.1 : 0))
                //.offset(x: viewState.width/25, y: viewState.height/25)
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(color: Color.black.opacity(0.15), radius: 20, x: 0, y: 20)
                .padding(.horizontal)
                .offset(y: 0)
            
            
        }
    }
}

struct ChapterCard: View {
    var body: some View {
        VStack {
            Spacer()
        }
        .frame(width: 400, height: 700)
        
    }
}

