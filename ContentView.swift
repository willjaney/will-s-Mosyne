//
//  ContentView.swift
//  DesignCode
//
//  Created by Meng To on 12/16/19.
//  Copyright © 2019 Meng To. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var show = false
    @State var viewState = CGSize.zero
    @State var showCard = false
    @State var bottomState = CGSize.zero
    @State var showFull = false
    @State var isDragging = false
    
    var body: some View {
        ZStack {
            TitleView()
                .blur(radius: show ? 20 : 0)
                .offset(y: showCard ? -200 : 0)
                .opacity(showCard ? 0.4 : 1)
                .animation(.easeInOut(duration: 0.8))
            
            BackCardView()
                .frame(width: showCard ? 360 : 340, height: 220)
                .background(show ? Color("card3") : Color("card4"))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -400 : -40)
                .offset(x: viewState.width, y: viewState.height)
                .offset(y: showCard ? -180 : 0)
                .scaleEffect(0.9)
                .rotationEffect(Angle(degrees: show ? 0 : 10))
                .rotationEffect(Angle(degrees: showCard ? -10 : 0))
                .rotation3DEffect(Angle(degrees: showCard ? 0 : 10), axis: (x: 10, y: 0, z: 0))
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.7))
            
            BackCardView()
                .frame(width: showCard ? 380 : 340, height: 220)
                .background(show ? Color("card4") : Color("card1"))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -200 : -20)
                .offset(x: viewState.width, y: viewState.height)
                .offset(y: showCard ? -140 : 0)
                .scaleEffect(0.95)
                .rotationEffect(Angle(degrees: show ? 0 : 5))
                .rotationEffect(Angle(degrees: showCard ? -5 : 0))
                .rotation3DEffect(Angle(degrees: showCard ? 0 : 5), axis: (x: 10, y: 0, z: 0))
                .blendMode(.hardLight)
                .animation(Animation.easeInOut(duration: 0.5))
            
            CardView()
                //  .scaleEffect(isDragging ? 0.9 : 1)
                //toggle rotation animation
                
                .hueRotation(Angle(degrees: Double (viewState.height)))
                .frame(width: showCard ? 400 : 340, height: 220)
                .background(Color("card5"))
                .opacity(1.0)
                .clipShape(RoundedRectangle(cornerRadius: showCard ? 30 : 20, style: .continuous))
                .shadow(radius: showCard ? 30 : 20)
                .blendMode(.hardLight)
                .offset(x: viewState.width, y: viewState.height)
                .offset(y: showCard ? -100 : 0)
                .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0))
                .rotation3DEffect(Angle(degrees: Double (self.viewState.height / 15)), axis: (x: 0, y: 10.0, z: 0))
                .onTapGesture {
                    self.showCard.toggle()
            }
            .gesture(
                DragGesture()
                    
                    
                    
                    .onChanged { value in
                        
                        guard value.translation.height < 100 else { return }
                        guard value.translation.height > -100 else { return }
                        
                        guard value.translation.width < 100 else { return }
                        guard value.translation.width > -100 else { return }
                        
                        self.viewState = value.translation
                        self.show = true
                        self.isDragging = true
                }
                .onEnded { value in
                    
                    
                    
                    self.viewState = .zero
                    self.show = false
                    self.isDragging = false
                }
            )
            
            //            Text("\(self.bottomState.height)").offset(y: -300)
            
            ImageCardView()
                .offset(x: 75, y: 315)
                .offset(x: viewState.width, y: viewState.height)
                .offset(y: showCard ? -100 : 0)
                .rotation3DEffect(Angle(degrees: Double (self.viewState.height / 20)), axis: (x: 0, y: 10.0, z: 0))
                .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0))
                .onTapGesture {
                    self.showCard.toggle()
            }
            .gesture(
                DragGesture()
                    .onChanged { value in
                        self.viewState = value.translation
                        self.show = true
                }
                .onEnded { value in
                    self.viewState = .zero
                    self.show = false
                }
            )
            
            BottomCardView(showRing: $showCard)
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CardView: View {
    
    @ObservedObject var Notes = getNotes()
       
       @State var FirstName = ""
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    VStack(alignment: .leading) {
                       //🉐🉐🉐🉐🉐🉐🉐🉐🉐🉐🉐🉐🉐🉐🉐🉐🉐🉐
                        //need to add i stuff from Profile page
                        ForEach(self.Notes.data) { i in
                            Text(i.firstName)
                           // Text("Will Janey")
                                .font(.system(size: 20))
                                .font(.headline) .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                            
                            
                              Text(i.lineName)
                                .foregroundColor(.white)
                                .font(.system(size: 10))
                                .font(.caption)
                        }
                    }
                    .padding(.bottom)
                    
                    
                    
                    ForEach(self.Notes.data) { i in
                        Text(i.chapter)
                       // Text("Zeta Phi")
                            .font(.caption) .foregroundColor(.white)
                            .font(.system(size: 20))
                        
                        Text(i.yearCrossed)
                        //Text("Sum 16")
                            .font(.caption) .foregroundColor(.white)
                            .font(.system(size: 20))
                        
                        
                        Text(i.position)
                       // Text("General Member")
                        .font(.caption).foregroundColor(.white)
                            .font(.system(size: 20))
                        
                    }
                    
                    
                }
                .padding()
                .padding(.leading, 0)
                Spacer()
                
                
            }
            .background(BlurView(style: .systemThinMaterial))
            .cornerRadius(30)
            .shadow(radius: 30)
            .padding(.top, 50)
            .padding(.horizontal, 20)
            Spacer()
            Image("Card1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 110, alignment: .top)
            
        }
    }
}

struct ImageCardView: View {
    var body: some View {
        VStack {
            Image("William")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .foregroundColor(Color(#colorLiteral(red: 0.6549019608, green: 0.7137254902, blue: 0.862745098, alpha: 1)))
                .frame(width: 122, height: 122)
                .background(Color.black)
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0, y: 5)
            Spacer()
        }
    }
}

struct BackCardView: View {
    var body: some View {
        VStack {
            Spacer()
        }
    }
}

struct TitleView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Certificates")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding()
            Image("Background1")
            Spacer()
        }
    }
}

struct BottomCardView: View {
    @Binding var showRing: Bool
    @ObservedObject var Notes = getNotes()
    
    var body: some View {
        VStack(spacing: 20) {
            Rectangle()
                .frame(width: 40, height: 5)
                .cornerRadius(3)
                .opacity(0.1)
            
           // Text(Notes.data.fi)
            
            VStack(alignment: .leading) {
                ForEach(self.Notes.data) { i in
                Text(i.firstName)
               // Text("William Janey")
                .font(.system(size: 28, weight: .bold))
                .modifier(CustomFontModifier(size: 28))
                
                Text(i.lineName)
                //Text("Konscious")
                                                  
                  .font(.system(size: 14, weight: .bold))
                  .modifier(CustomFontModifier(size: 14))
               
               Text(i.position)
               //Text("General Member")
                   
                   .font(.system(size: 10))
                   .font(.caption)
                
                }
                
            }.padding(.leading, -150)
            
            VStack(alignment: .leading) {
                
                HStack(spacing: 15) {
                    ForEach(self.Notes.data) { i in
                
                Image(systemName: "person.crop.circle.fill")
                       
                Text("Intern")
                   .font(.subheadline)
                   .frame(height: 50)
                   .offset(x: -10)
               
               Divider()
                   .frame(height: 20)
                   .frame(width: 1)
                   .background(Color(#colorLiteral(red: 0.6549019608, green: 0.7137254902, blue: 0.862745098, alpha: 1)))
               
               Image(systemName: "person.crop.circle.fill")
               
               Text("Computer Engineering")
                   .font(.subheadline)
                   .frame(height: 50)
                   .offset(x: -10)
               
               Divider()
                   .frame(height: 20)
                   .frame(width: 1)
                   .background(Color(#colorLiteral(red: 0.6549019608, green: 0.7137254902, blue: 0.862745098, alpha: 1)))
               
               
               Image(systemName: "person.crop.circle.fill")
               
               Text(i.gradDate)
               //Text("Fall 20")
                   .font(.subheadline)
                   .frame(height: 50)
                   .offset(x: -10)
                    }
                    //Text(i.careerPosition)
                   
                    
                }
                .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
                // how do I SET THE FRAM TO FIT ALL DEVICES
                .frame(width: 400, height: 70)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0, y: 5)
                .padding(.leading, 12)
                .padding(.trailing, 12)
            }
            
            VStack(alignment: .leading) {
                //add the self.Notes. data here
                HStack(spacing: 15) {
                    Image(systemName: "person.crop.circle.fill")
                    
                    Text("24")
                        .font(.subheadline)
                        .frame(height: 50)
                        .offset(x: -10)
                    
                    Divider()
                        .frame(height: 20)
                        .frame(width: 1)
                        .background(Color(#colorLiteral(red: 0.6549019608, green: 0.7137254902, blue: 0.862745098, alpha: 1)))
                    
                    Image(systemName: "person.crop.circle.fill")
                    
                    Text("University of Florida")
                        .font(.subheadline)
                        .frame(height: 50)
                        .offset(x: -10)
                    
                    Divider()
                        .frame(height: 20)
                        .frame(width: 1)
                        .background(Color(#colorLiteral(red: 0.6549019608, green: 0.7137254902, blue: 0.862745098, alpha: 1)))
                    
                    
                    Image(systemName: "person.crop.circle.fill")
                    
                    Text("Marketing")
                        .font(.subheadline)
                        .frame(height: 50)
                        .offset(x: -10)
                    
                }
                .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
                .frame(width: 400, height: 70)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0, y: 5)
                .padding(.leading, 12)
                .padding(.trailing, 12)
            }
                
            HStack {
                HStack {
                    VStack (alignment: .leading){
                            HStack(spacing: 5) {
                                Image(systemName: "person.crop.circle.fill")
                                
                                
                                Text("Zeta Phi")
                                    .font(.subheadline)
                                    .frame(height: 30)
                            }.foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
                                .frame(width: 100, height: 30)
                                .background(Color.white)
                                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                                .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0, y: 5)
                          
                                
                                HStack {
                                    Image(systemName: "person.crop.circle.fill")
                                    
                                    Text("Sum' 16")
                                        .font(.subheadline)
                                        .frame(height: 50)
                                    // .offset(x: -10)
                                }.foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
                                    .frame(width: 100, height: 30)
                                    .background(Color.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                                    .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0, y: 5)
                        
                    }
                    
                    VStack (alignment: .leading){
                            HStack(spacing: 5) {
                                Image(systemName: "person.crop.circle.fill")
                                
                                
                                Text("Deuce")
                                    .font(.subheadline)
                                    .frame(height: 30)
                            }.foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
                                .frame(width: 100, height: 30)
                                .background(Color.white)
                                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                                .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0, y: 5)
                          
                                
                                HStack {
                                    Image(systemName: "person.crop.circle.fill")
                                    
                                    Text("Sum' 16")
                                        .font(.subheadline)
                                        .frame(height: 50)
                                    // .offset(x: -10)
                                }.foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
                                    .frame(width: 100, height: 30)
                                    .background(Color.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                                    .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0, y: 5)
                    
                    
                    
                        
                            }
                    
                }.foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
                .frame(width: 220, height: 100)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0, y: 5)
                         .offset(x: -40)
                .padding(.leading, 12)
                
               
                        
            
            
                        
        RingView(color1: #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1), color2: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1), width: 88, height: 88, percent: 60, show: $showRing)
        .animation(Animation.easeInOut.delay(0.3))
            
            }
                        
                   
        
               
            
            
            
            
            // Spacer(.bottom)
//            HStack(spacing: 20) {
//                RingView(color1: #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1), color2: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1), width: 88, height: 88, percent: 60, show: $showRing)
//                    .animation(Animation.easeInOut.delay(0.3))
//
//                VStack(alignment: .leading, spacing: 8) {
//                    Text("Approval Rating")
//                        .fontWeight(.bold)
//                    Text("It's fair! However, continue to strive for excellence. Your fraternity will thank you.")
//                        .font(.footnote)
//                        .foregroundColor(.gray)
//                        .lineSpacing(4)
//                }
//                .padding(20)
//                .background(Color("background3"))
//                .cornerRadius(20)
//                .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
//            }
            
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
