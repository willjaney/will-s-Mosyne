//
//  PostView.swift
//  Future
//
//  Created by Will Janey on 5/10/20.
//  Copyright © 2020 Will Janey. All rights reserved.
//



import SwiftUI
import Firebase

struct NotesFB: View {
    @State var showPost = false
    @State var show2 = false
    @State var activeView = CGSize.zero

    
    @ObservedObject var Notes = getPost()
    
    
    var body: some View {
        ZStack {
            
            Color.black.opacity(Double(self.activeView.height/500))
            .animation(.linear)
            .edgesIgnoringSafeArea(.all)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 30) {
                    
                  //  ForEach(self.Notes.data) { index in
                        GeometryReader { geometry in
                            FireNotesCV(showPost: self.$show2, activeView: self.$activeView)
                                .offset(y: self.show2 ? -geometry.frame(in: .global).minY : 0)
                        }
                        .frame(height: self.show2 ? screen.height : 280)
                        .frame(maxWidth: self.show2 ? .infinity : screen.width - 60)
                        //session 30 allow each card to have its own view⤵️ also shows how to hide the status bar
                        //     .zIndex()
                 //   }
                }
                .frame(width: screen.width)
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
            }
        }
    }
    
    //session 31 allow each card to have its own view⤵️ also shows how to hide the status bar passing index toggles the opacity of untapped cards to make transition smother when note is toggles therefore
    // session 30 and 31 will be completed once I'm able to get the the index of each firebase note
    
}

struct ContentView1_Previews: PreviewProvider {
    static var previews: some View {
        NotesFB()
    }
}



struct FireNotesCV : View {
    
    @State var pressAgain = false
    @GestureState var tap = false
    
    @ObservedObject var Notes = getPost()
    @State var show = false
    @State var txt = ""
    @State var docID = ""
    @State var remove = false
    
    @State var showEventDetails = false
    @State private var committee = 0
    @State var chPar = 25
    @State var eventDate = Date()
    
    @State var location = ""
    @State var headerText = ""
    @State var submit = false
    
    @State var colors = ["Fundraising", "History", "Leadership Training", "Nominating", "Special Events"]
    
    //  @State var showPost = false
    @Binding var showPost : Bool
    //  var course: PostInfo
    
    @Binding var activeView : CGSize
    
    var body : some View{
        
        ZStack(alignment: .top) {
            
            ForEach(self.Notes.data){i in
                
                
                VStack(alignment: .leading, spacing: 30){
                    
                    detailTop650()
                    detailMiddle650()
                    detailBottom650()
                    
                    PayButton(press: self.$pressAgain)
                        .offset(x: 100 , y: -100)
                    .gesture(
                        LongPressGesture().updating(self.$tap) { currentState, gestureState, transaction in
                                gestureState = currentState
                            }
                            .onEnded { value in
                                self.pressAgain.toggle()
                               // self.SaveVotingCard()
                            }
                    )
                    
                }
                   
                    
                    //       HStack(spacing: 5){
                    //
                    //            Image("map").renderingMode(.original)
                    //        Text("\(i.location)").foregroundColor(Color(.black))
                    //
                    //        }
                    //                    //Who
                    //                    Text("Committee \(i.committee)")
                    //                    .font(.title).bold()
                    //
                    //                    //what
                    //                    Text("\(i.header)")
                    //                        .font(.title).bold()
                    //
                    //
                    //                    Text("20 Sections \(i.note)")
                    //
                    //        Text("This course is unlike any other. We care about design and want to make sure that you get better at it in the process. It's beginner-friendly, but it's also packed with design tricks and efficient workflows for building great user interfaces and interactions.")
                    
                    
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
                    
                    Button(action: {
                                           
                                           self.txt = ""
                                           self.docID = ""
                                           self.show.toggle()
                                           
                                       }) {
                                           
                                           Image(systemName: "plus").resizable().frame(width: 18, height: 18)
                                           
                                       }.padding()
                                           .background(Color.black)
                                           
                                           .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                                           .padding()
                                           .opacity(1)
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
                //  ScrollView(.vertical, showsIndicators: false) {
                //Might need to remove😅🥴 the foreach here
                
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
                                            .offset(x: -30)
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
              
                    
                    //1️⃣
                .padding(showPost ? 30 : 20)
                .padding(.top, showPost ? 30 : 0)
                    //        .frame(width: show ? screen.width : screen.width - 60, height: show ? screen.height : 280)
                    .frame(maxWidth: showPost ? .infinity : screen.width - 60, maxHeight: showPost ? 400 : 280)
                    .background(Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)))
                    .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                    .shadow(color: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)).opacity(0.3), radius: 20, x: 0, y: 20)
                    
                    .gesture(
                        showPost ?
                            DragGesture().onChanged { value in
                                guard value.translation.height < 300 else { return }
                                guard value.translation.height > 0 else { return }
                                
                                self.activeView = value.translation
                            }
                            .onEnded { value in
                                if self.activeView.height > 50 {
                                    self.showPost = false
                                    //                                self.active = false
                                    //                                self.activeIndex = -1
                                }
                                self.activeView = .zero
                            }
                            : nil
                )
                    
                    .onTapGesture {
                        self.showPost.toggle()
                }
                
                
                //          }
            }
            
            //         }.edgesIgnoringSafeArea(.top)
            //            .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
            //  sgift + cmd + L
            
            
                
        }
         //2️⃣
        .frame(height: showPost ? screen.height : 280)
        .scaleEffect(1 - self.activeView.height / 1000)
        .rotation3DEffect(Angle(degrees: Double(self.activeView.height / 10)), axis: (x: 0, y: 10.0, z: 0))
        .hueRotation(Angle(degrees: Double(self.activeView.height)))
        .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
            
            
        .gesture(
            showPost ?
                DragGesture().onChanged { value in
                    guard value.translation.height < 300 else { return }
                    guard value.translation.height > 0 else { return }
                    
                    self.activeView = value.translation
                }
                .onEnded { value in
                    if self.activeView.height > 50 {
                        self.showPost = false
                        //                               self.active = false
                        //                               self.activeIndex = -1
                    }
                    self.activeView = .zero
                }
                : nil
        )
            .edgesIgnoringSafeArea(.all)
            
            .sheet(isPresented: self.$show) {
                
                EditView(colors: self.$colors, txt: self.$txt, docID: self.$docID, show: self.$show, showEventDetails: self.$showEventDetails, committee: self.$committee, chPar: self.$chPar, eventDate: self.$eventDate, location: self.$location, headerText: self.$headerText, submit: self.$submit)
        }
            
        .animation(.default)
    }
}

//EditView(txt: self.$txt, docID: self.$docID, show: self.$show, showEventDetails: self.$showEventDetails, committee: self.$committee, chPar: self.$chPar, eventDate: self.$eventDate, location: self.$location, headerText: self.$headerText, submit: self.$submit)

class Host : UIHostingController<NotesFB>{
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        
        return .lightContent
    }
}


class getPost : ObservableObject{
    
    @Published var data = [PostInfo]()
    @Published var noData = false
    
    init() {
        
        let db = Firestore.firestore()
        
        db.collection("freebandsssss").order(by: "date", descending: false).addSnapshotListener { (snap, err) in
            
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
                    
                    let id = i.document.documentID
                    
                    let notes = i.document.get("notes") as! String
                    
                    let date = i.document.get("date") as! Timestamp
                    
                    let headers = i.document.get("headers") as! String
                    
                    let locations = i.document.get("locations") as! String
                    
                    let committees = i.document.get("committee") as! Int
                    
                     let chPar = i.document.get("chPar") as! Int

                  //  let colors = i.document.get("colors") as! String
//
                    let format = DateFormatter()
                    
                    format.dateStyle = .short
                    
                    let dateString = format.string(from: date.dateValue())
                    
                     let eventdateString = format.string(from: date.dateValue())
                    
//                    self.data.append(PostInfo(id: id, note: notes, date: dateString, header: headers, location: locations, committee: committees))
                    
                    self.data.append(PostInfo(id: id, note: notes, date: dateString, header: headers, location: locations, committee: committees, chPar: chPar, EventDate: eventdateString))
                }
                
                if i.type == .modified{
                    
                    // when data is changed...
                    
                    let id = i.document.documentID
                    
                    let notes = i.document.get("notes") as! String
                    
                    for i in 0..<self.data.count{
                        
                        if self.data[i].id == id{
                            
                            self.data[i].note = notes
                        }
                    }
                }
                
                if i.type == .removed{
                    
                    // when data is removed...
                    
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

struct PostInfo : Identifiable {
    
    //committee name //ch participation number
    //Date //price
    
    var id : String
    var note : String
    var date : String
    
    var header : String
    var location : String
    //need string not int
    var committee : Int

    
    
    var chPar : Int
    // var colors : String
    var EventDate : String
    
    
    //    var id = UUID()
    //       var title: String✅ title
    //       var subtitle: String ✅ location
    //       var image: UIImage❓
    //       var logo: UIImage❓
    //       var color: UIColor❓
    //       var show: Bool
    
    
}





struct Indicator1 : UIViewRepresentable {
    
    func makeUIView(context: UIViewRepresentableContext<Indicator1>) -> UIActivityIndicatorView {
        
        let view = UIActivityIndicatorView(style: .medium)
        view.startAnimating()
        return view
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<Indicator1>) {
        
        
    }
}

struct EditView : View {
    
    
 @Binding var colors : [String]
    @Binding var txt : String
    @Binding var docID : String
    @Binding var show : Bool
    
    @ObservedObject var Notes = getNotes()
    @Binding var showEventDetails : Bool
    @Binding var committee : Int
    @Binding var chPar : Int
    @Binding var eventDate : Date
    
    @Binding var location : String
    @Binding var headerText : String
    @Binding var submit : Bool
    
    
    
    @State var tap = false
    @State var press = false
    
    var body : some View{
        
        //        ZStack(alignment: .bottomTrailing) {
        //
        //            MultiLineTF(txt: self.$txt)
        //                .padding()
        //                .background(Color.black.opacity(0.05))
        //
        //            Button(action: {
        //
        //                self.show.toggle()
        //                self.SaveData()
        //                //self.showEventDetails.toggle()
        //
        //
        //            }) {
        //
        //                Text("Save").padding(.vertical).padding(.horizontal,25).foregroundColor(.white)
        //
        //            }.background(Color.red)
        //                .clipShape(Capsule())
        //                .padding()
        //
        //        }.edgesIgnoringSafeArea(.bottom)
        
        ZStack(alignment: .topLeading) {
            
            HStack() {
                ForEach(self.Notes.data) { i in
                    
                    Image("willGrad")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 36, height: 36)
                        .clipShape(Circle())
                        .padding(.leading , 16)
                        .padding(.top, 16)
                    
                    
                    Text(i.firstName)
                        // Text("William Janey")
                        .font(.system(size: 14, weight: .bold))
                        .modifier(CustomFontModifier(size: 28))
                    
                    Text(i.lastName)
                        // Text("William Janey")
                        .font(.system(size: 14, weight: .bold))
                        .modifier(CustomFontModifier(size: 28))
                        .offset(x: -5)
                    
                    
                    
                }
            }
            
            HStack(spacing: 25) {
                HStack(spacing: 8) {
                    Button(action: {
                        
                        self.showEventDetails.toggle()
                        //self.SaveData()
                        
                        
                    }) {
                        Text("Details").padding(.vertical).padding(.horizontal,25).foregroundColor(.black)
                        
                    }.font(.system(size: 10, weight: .semibold, design: .rounded))
                        .frame(width: 100, height: 30)
                        
                        .background(
                            ZStack {
                                Color(press ? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0) : #colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1))
                                
                                RoundedRectangle(cornerRadius: 8, style: .continuous)
                                    .foregroundColor(Color(press ? #colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1) : #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                                    .blur(radius: 2)
                                    .offset(x: -4, y: -4)
                                
                                RoundedRectangle(cornerRadius: 8, style: .continuous)
                                    .fill(
                                        LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9019607843, green: 0.9294117647, blue: 0.9882352941, alpha: 1)), Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                                )
                                    .padding(1)
                                    .blur(radius: 1)
                            }
                    )
                        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                        .overlay(
                            HStack {
                                Image(systemName: "person.crop.circle")
                                    .font(.system(size: 12, weight: .light))
                                    .foregroundColor(Color.white.opacity(press ? 0 : 1))
                                    .frame(width: press ? 32 : 27, height: press ? 2 : 25)
                                    .background(Color(#colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)))
                                    .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                                    .shadow(color: Color(#colorLiteral(red: 1, green: 0, blue: 0.2012239099, alpha: 1)).opacity(0.3), radius: 5, x: 5, y: 5)
                                    .offset(x: press ? 35 : -5, y: press ? 8 : 0)
                                
                                Spacer()
                            }
                    )
                        .shadow(color: Color(press ? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0) : #colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1)), radius: 10, x: 10, y: 10)
                        .shadow(color: Color(press ? #colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1) : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), radius: 10, x: -10, y: -10)
                        .scaleEffect(tap ? 1.2 : 1)
                        .gesture(
                            LongPressGesture(minimumDuration: 0.5, maximumDistance: 10).onChanged { value in
                                self.tap = true
                                impact(style: .heavy)
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                    self.tap = false
                                }
                            }
                            .onEnded { value in
                                self.press.toggle()
                                haptic(type: .success)
                            }
                    )
                    
                }
                .offset(y: 75)
                .offset(x: 20)
                
            }
            
            ZStack(alignment: .bottomTrailing) {
                
                MultiLineTF(txt: self.$txt)
                    .padding()
                    // .background(Color.black.opacity(0.05))
                    .offset(y: 100)
                
                Button(action: {
                    
                    self.show.toggle()
                    self.SaveData()
                    
                    
                }) {
                    
                    Text("Save").padding(.vertical).padding(.horizontal,25).foregroundColor(.white)
                    
                }.background(Color.red)
                    .clipShape(Capsule())
                    .padding()
                
            }.edgesIgnoringSafeArea(.bottom)
        }
            
        .sheet(isPresented: self.$showEventDetails) {
            
            Settings(committee: self.$committee, chPar: self.$chPar, eventDate: self.$eventDate, location: self.$location, headerText: self.$headerText, submit: self.$submit, showEventDetails: self.$showEventDetails, docID: self.$docID)
        }
    }
    
    
    func SaveData(){
        
        let db1 = Firestore.firestore()
        
        if self.docID != ""{
            //5️⃣6️⃣
          //chPar event colo
            
             db1.collection("freebandsssss").document(self.docID).updateData(["notes":self.txt, "locations":self.location,"headers": self.headerText, "committee": self.committee, "chPar": self.chPar]) { (err) in
                
                if err != nil{
                    
                    print((err?.localizedDescription)!)
                    return
                }
            }
        }
            
        else{
            //7️⃣8️⃣
            
            db1.collection("freebandsssss").document().setData(["notes":self.txt,"locations":self.location,"headers": self.headerText, "committee": self.committee, "chPar": self.chPar, "EventDate":Date(), "date":Date()]) { (err) in
                
                if err != nil{
                    
                    print((err?.localizedDescription)!)
                    return
                }
            }
        }
    }
    func SaveVotingCard(){
        
        let db1v = Firestore.firestore()
        
        if self.docID != ""{
            //5️⃣6️⃣
          //chPar event colo
            
             db1v.collection("freebandsssssed").document(self.docID).updateData(["notes":self.txt, "locations":self.location,"headers": self.headerText, "committee": self.committee, "chPar": self.chPar]) { (err) in
                
                if err != nil{
                    
                    print((err?.localizedDescription)!)
                    return
                }
            }
        }
            
        else{
            //7️⃣8️⃣
            
            db1v.collection("freebandsssssed").document().setData(["notes":self.txt,"locations":self.location,"headers": self.headerText, "committee": self.committee, "chPar": self.chPar, "EventDate":Date(), "date":Date()]) { (err) in
                
                if err != nil{
                    
                    print((err?.localizedDescription)!)
                    return
                }
            }
        }
    }
    
    
}

struct MultiLineTF : UIViewRepresentable {
    
    
    func makeCoordinator() -> MultiLineTF.Coordinator {
        
        return MultiLineTF.Coordinator(parent1: self)
    }
    
    
    @Binding var txt : String
    
    func makeUIView(context: UIViewRepresentableContext<MultiLineTF>) -> UITextView{
        
        let view = UITextView()
        
        if self.txt != ""{
            
            view.text = self.txt
            view.textColor = .black
        }
        else{
            
            view.text = "Type Something"
            view.textColor = .gray
        }
        
        
        view.font = .systemFont(ofSize: 18)
        
        view.isEditable = true
        view.backgroundColor = .clear
        view.delegate = context.coordinator
        return view
    }
    
    func updateUIView(_ uiView: UITextView, context: UIViewRepresentableContext<MultiLineTF>) {
        
    }
    
    class Coordinator : NSObject,UITextViewDelegate{
        // creates two instances of the view to compare changes in order to toggle an action which is to record the user action 💡
        var parent : MultiLineTF
        
        init(parent1 : MultiLineTF) {
            
            parent = parent1
        }
        
        func textViewDidBeginEditing(_ textView: UITextView) {
            
            if self.parent.txt == ""{
                
                textView.text = ""
                textView.textColor = .black
            }
            
        }
        
        func textViewDidChange(_ textView: UITextView) {
            
            self.parent.txt = textView.text
        }
    }
}


struct Settings: View {
    
    //    @State var selection = 1 -- committ
    //    @State var number = 1 -- chapter part
    //    @State var date = Date()
    
    //    @State var location = ""
    //    @State var header = ""
    //    @State var submit = false
    
    // @ObservedObject var PostDetails = getPostDetails()
    
    var colors = ["Fundraising", "History", "Leadership Training", "Nominating", "Special Events"]
    @Binding var committee : Int
    @Binding var chPar : Int
    @Binding var eventDate : Date
    
    @Binding var location : String
    @Binding var headerText : String
    @Binding var submit : Bool
    
    @Binding var showEventDetails : Bool
    
    @Binding var docID : String
    
    
    
    //committee name //ch participation number
    //Date
    
    var body: some View {
        NavigationView{
            
            Form {
                
                
                Picker(selection: $committee, label: Text("Which Committee")) {
                    ForEach(0 ..< colors.count) {
                        Text(self.colors[$0])
                    }
                    
                }
                
                
                
                Stepper(value: self.$chPar, in: 25...100, step: 25) {
                    Text("\(self.chPar) % of chapter participation\(self.chPar > 1 ? "s" : "")")
                }
                
                DatePicker(selection: self.$eventDate, in: Date()...) {
                    Text("Date")
                }
             
                
                TextField("Location", text: self.$location)
                
                TextField("Header", text: self.$headerText)
                
                
                
                Button(action: {
                    self.submit.toggle()
                    //self.SaveDataed()
                    self.showEventDetails.toggle()
                    
                }) {
                    Text("Submit")
                }
                
            }
            .navigationBarTitle("Event Details")
            
        }
    }
    
    //    func SaveDataed(){
    //
    //        let db2 = Firestore.firestore()
    //
    //        if self.docID != ""{
    //            //5️⃣6️⃣
    //            db2.collection("othernotess").document(self.docID).updateData([ "locations":self.location,"headers": self.headerText, "committee": self.committee]) { (err) in
    //
    //                if err != nil{
    //
    //                    print((err?.localizedDescription)!)
    //                    return
    //                }
    //            }
    //        }
    //
    //        else{
    //            //7️⃣8️⃣
    //            db2.collection("othernotess").document().setData(["locations":self.location,"headers": self.headerText, "committee": self.committee, "date":Date()]) { (err) in
    //
    //                if err != nil{
    //
    //                    print((err?.localizedDescription)!)
    //                    return
    //                }
    //            }
    //        }
    //    }
}

//class getPostDetails : ObservableObject{
//
//    @Published var data = [PostDetails]()
//    @Published var noData = false
//
//    init() {
//
//        let db1 = Firestore.firestore()
//        //2️⃣
//        db1.collection("othernotess").order(by: "date", descending: false).addSnapshotListener { (snap, err) in
//
//            if err != nil{
//
//                print((err?.localizedDescription)!)
//                self.noData = true
//                return
//            }
//
//            if (snap?.documentChanges.isEmpty)!{
//
//                self.noData = true
//                return
//            }
//
//            for i in snap!.documentChanges{
//
//                if i.type == .added{
//
//                    // when data is added...💡
//
//                    let id = i.document.documentID
//                    //3️⃣
//                    let headers = i.document.get("headers") as! String
//
//                    let locations = i.document.get("locations") as! String
//
//                    let committees = i.document.get("committee") as! String
////                    let date = i.document.get("date") as! Timestamp
////
////                    let format = DateFormatter()
////
////                    format.dateFormat = "dd-MM-YY hh:mm a"
////
////                    let dateString = format.string(from: date.dateValue())
//
//                    self.data.append(PostDetails(id: id, header: headers, location: locations, committee: committees))
//                }
//
//                if i.type == .modified{
//
//                    // when data is changed...💡
//
//                    let id = i.document.documentID
//                    //4️⃣
//                    let headers = i.document.get("headers") as! String
//
//                    for i in 0..<self.data.count{
//
//                        if self.data[i].id == id{
//
//                            self.data[i].header = headers
//                        }
//                    }
//                }
//
//                if i.type == .removed{
//
//                    // when data is removed...💡
//
//                    let id = i.document.documentID
//
//                    for i in 0..<self.data.count{
//
//                        if self.data[i].id == id{
//
//                            self.data.remove(at: i)
//
//                            if self.data.isEmpty{
//
//                                self.noData = true
//                            }
//
//                            return
//                        }
//                    }
//                }
//            }
//        }
//    }
//}
//
//
//struct PostDetails : Identifiable {
//
//    var id : String
//
//    var header : String
//    var location : String
//
//    var committee : String
//
//}


func haptic(type: UINotificationFeedbackGenerator.FeedbackType) {
    UINotificationFeedbackGenerator().notificationOccurred(type)
}

func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
    UIImpactFeedbackGenerator(style: style).impactOccurred()
}
