//
//  BlurView.swift
//  greekdomSocialApp
//
//  Created by Will Janey on 3/24/20.
//  Copyright © 2020 Will Janey. All rights reserved.
//

import SwiftUI



struct BlurView: UIViewRepresentable {
    typealias UIViewType = UIView
    var style: UIBlurEffect.Style
    
    func makeUIView(context: UIViewRepresentableContext<BlurView>) -> UIView {
        let view = UIView(frame: CGRect.zero)
        view.backgroundColor = .clear
        
        let blurEffect = UIBlurEffect(style: style)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        view.insertSubview(blurView, at: 0)
        
        NSLayoutConstraint.activate([
            blurView.widthAnchor.constraint(equalTo: view.widthAnchor),
            blurView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<BlurView>) {
        
    }
}

//struct EditView : View {
//    
//    @Binding var txt : String
//    @Binding var docID : String
//    @Binding var show : Bool
//    
//    @Binding var showEventDetails : Bool
//    @ObservedObject var Notes = getNotes()
//    
//    
//    @Binding var committee : Int
//    @Binding var chPar : Int
//    @Binding var eventDate : Date
//    
//    @Binding var location : String
//    @Binding var headerText : String
//    @Binding var submit : Bool
//    
//    
//    
//    @State var tap = false
//    @State var press = false
//    var body : some View{
//        
//        
//        ZStack(alignment: .topLeading) {
//            
//            HStack() {
//                ForEach(self.Notes.data) { i in
//                    
//                    Image("willGrad")
//                        .renderingMode(.original)
//                        .resizable()
//                        .frame(width: 36, height: 36)
//                        .clipShape(Circle())
//                        .padding(.leading , 16)
//                        .padding(.top, 16)
//                    
//                    
//                    Text(i.firstName)
//                        // Text("William Janey")
//                        .font(.system(size: 14, weight: .bold))
//                        .modifier(CustomFontModifier(size: 28))
//                    
//                    Text(i.lastName)
//                        // Text("William Janey")
//                        .font(.system(size: 14, weight: .bold))
//                        .modifier(CustomFontModifier(size: 28))
//                        .offset(x: -5)
//                    
//                    
//                    
//                }
//            }
//            
//            HStack(spacing: 25) {
//                HStack(spacing: 8) {
//                    Button(action: {
//                        
//                        self.showEventDetails.toggle()
//                        //self.SaveData()
//                        
//                        
//                    }) {
//                        Text("Details").padding(.vertical).padding(.horizontal,25).foregroundColor(.black)
//                        
//                    }.font(.system(size: 10, weight: .semibold, design: .rounded))
//                        .frame(width: 100, height: 30)
//                        
//                        .background(
//                            ZStack {
//                                Color(press ? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0) : #colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1))
//                                
//                                RoundedRectangle(cornerRadius: 8, style: .continuous)
//                                    .foregroundColor(Color(press ? #colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1) : #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
//                                    .blur(radius: 2)
//                                    .offset(x: -4, y: -4)
//                                
//                                RoundedRectangle(cornerRadius: 8, style: .continuous)
//                                    .fill(
//                                        LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9019607843, green: 0.9294117647, blue: 0.9882352941, alpha: 1)), Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
//                                )
//                                    .padding(1)
//                                    .blur(radius: 1)
//                            }
//                    )
//                        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
//                        .overlay(
//                            HStack {
//                                Image(systemName: "person.crop.circle")
//                                    .font(.system(size: 12, weight: .light))
//                                    .foregroundColor(Color.white.opacity(press ? 0 : 1))
//                                    .frame(width: press ? 32 : 27, height: press ? 2 : 25)
//                                    .background(Color(#colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)))
//                                    .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
//                                    .shadow(color: Color(#colorLiteral(red: 1, green: 0, blue: 0.2012239099, alpha: 1)).opacity(0.3), radius: 5, x: 5, y: 5)
//                                    .offset(x: press ? 35 : -5, y: press ? 8 : 0)
//                                
//                                Spacer()
//                            }
//                    )
//                        .shadow(color: Color(press ? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0) : #colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1)), radius: 10, x: 10, y: 10)
//                        .shadow(color: Color(press ? #colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1) : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), radius: 10, x: -10, y: -10)
//                        .scaleEffect(tap ? 1.2 : 1)
//                        .gesture(
//                            LongPressGesture(minimumDuration: 0.5, maximumDistance: 10).onChanged { value in
//                                self.tap = true
//                                impact(style: .heavy)
//                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
//                                    self.tap = false
//                                }
//                            }
//                            .onEnded { value in
//                                self.press.toggle()
//                                haptic(type: .success)
//                            }
//                    )
//                    
//                    
//                    
//                    
//                }
//                .offset(y: 75)
//                .offset(x: 20)
//                
//            }
//            
//            
//            
//            ZStack(alignment: .bottomTrailing) {
//                
//                
//                
//                MultiLineTF(txt: self.$txt)
//                    .padding()
//                    // .background(Color.black.opacity(0.05))
//                    .offset(y: 100)
//                
//                Button(action: {
//                    
//                    self.show.toggle()
//                    // self.SaveData()
//                    
//                    
//                }) {
//                    
//                    Text("Save").padding(.vertical).padding(.horizontal,25).foregroundColor(.white)
//                    
//                }.background(Color.red)
//                    .clipShape(Capsule())
//                    .padding()
//                
//            }.edgesIgnoringSafeArea(.bottom)
//        }
//        
//        .sheet(isPresented: self.$showEventDetails) {
//            
//            Settings(committee: self.$committee, chPar: self.$chPar, eventDate: self.$eventDate, location: self.$location, headerText: self.$headerText, submit: self.$submit, showEventDetails: self.$showEventDetails)
//        }
//        
//        
//    }
//    
//    
//    
//}
//   @State var chPar = 1
//   @State var committee = 1
//   @State var eventDate = Date()
//   @State var location = ""
//   @State var headerText = ""
//   @State var submit = false
//
//
//   @State var showEventDetails = false
//
//
//struct Settings: View {
//    
//    //    @State var selection = 1 -- committ
//    //    @State var number = 1 -- chapter part
//    //    @State var date = Date()
//    
//    //    @State var location = ""
//    //    @State var header = ""
//    //    @State var submit = false
//    
//    @Binding var committee : Int
//    @Binding var chPar : Int
//    @Binding var eventDate : Date
//    
//    @Binding var location : String
//    @Binding var headerText : String
//    @Binding var submit : Bool
//    
//    @Binding var showEventDetails : Bool
//    
//    
//    var body: some View {
//        NavigationView{
//            Form {
//                
//                Picker(selection: $committee, label: Text("Which Committee")){
//                    Text("Fundraising").tag(1)
//                    Text("Charity").tag(2)
//                    Text("Party").tag(3)
//                }
//                
//                Stepper(value: $chPar, in: 1...10) {
//                    Text("\(chPar) Chapter Participation\(chPar > 1 ? "s" : "")")
//                }
//                
//                DatePicker(selection: $eventDate) {
//                    Text("Date")
//                }
//                
//                TextField("Location", text: $location)
//                
//                TextField("Header", text: $headerText)
//                
//                Button(action: {
//                    self.submit.toggle()
//                }) {
//                    Text("Submit")
//                }
//                
//            }
//            .navigationBarTitle("Event Details")
//        }
//    }
//}
//
//func haptic(type: UINotificationFeedbackGenerator.FeedbackType) {
//    UINotificationFeedbackGenerator().notificationOccurred(type)
//}
//
//func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
//    UIImpactFeedbackGenerator(style: style).impactOccurred()
//}
//.sheet(isPresented: self.$showEventDetails) {
//           
//           Settings(committee: self.$committee, chPar: self.$chPar, eventDate: self.$eventDate, location: self.$location, headerText: self.$headerText, submit: self.$submit, showEventDetails: self.$showEventDetails)
//       }
