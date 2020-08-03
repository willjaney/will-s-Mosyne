//
//  TApp.swift
//  greekdomSocialApp
//
//  Created by Will Janey on 3/4/20.
//  Copyright © 2020 Will Janey. All rights reserved.
//
//This page is Event Page
//Inspiration from Travel App page Kavsoft💡

import Foundation
import SwiftUI


//struct ContentView_Previews55: PreviewProvider {
//  
////    let attempt = ContentView55(booker: <#String#>)
//    static var previews: some View {
//         Changed to TabViewCV🚨
//        ContentView55()
//    }
//}

struct KappaEventCV : View {
    
    
    var body : some View{
        NavigationView{
            VStack(alignment: .leading,spacing: 12){
                
                HStack{
                    
                    Button(action: {
                        
                    }) {
                        
                        Image("menu").renderingMode(.original)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }) {
                        
                        Image("Profile").renderingMode(.original)
                    }
                }
                
                Text("Popular").fontWeight(.heavy).font(.largeTitle).padding(.top,15)
                
                HStack{
                    
                    Button(action: {
                        
                    }) {
                        
                        Text("Events").fontWeight(.heavy).foregroundColor(.black)
                    }
                    
                    Spacer()
                    //                
                    
                    
                    NavigationLink(destination: KappaWorkCV()) {
                        Text("KappaWork").foregroundColor(.gray)
                    }
                    
                    Spacer()
                    
                    NavigationLink(destination: KappaWorkCV()) {
                        Text("Zeta Phi").foregroundColor(.gray)
                    }
                    
                }.padding([.top],30)
                    .padding(.bottom, 15)
                
                MiddleView()
                
                BottomViewtry().padding(.top, 10)
                
            }.padding()
        }
    }
}

struct MiddleView : View {
    
    @State var show = false
    @State var show2 = false
    
    var body : some View{
        
        ScrollView(.horizontal, showsIndicators: false) {
            
            
            HStack(spacing: 20){
                
                VStack(alignment: .leading,spacing: 12){
                    
                    Button(action: {
                        self.show2.toggle()
                    }) {
                        
                        Image("Card1").renderingMode(.original).resizable()
                            .frame(width: show2 ? screen.width : 150.0, height: show2 ? screen.height : 250.0)
                            .clipShape(Capsule())
                        //
                        //.shadow(radius: 10)
                    }
                      
                        .onTapGesture {
                            self.show2.toggle()
                    }
                    //⤵️below was changed to above ⤴️
//                                        .sheet(isPresented: $show2) {
//                    
//                                            Detail3()
//                                        }
                    
                    Text("Champagne Jam").fontWeight(.heavy)
                    
                    
                    HStack(spacing: 5){
                        
                        Image("map").renderingMode(.original)
                        Text("Gainesville, FL").foregroundColor(.gray)
                    }
                }
                //next card

                
                VStack(alignment: .leading,spacing: 12){
                    
                    Button(action: {
                        
                        self.show.toggle()
                        
                    }) {
                        
                        Image("face").renderingMode(.original)
                            .frame(width: 150.0, height: 250.0)
                            .clipShape(Capsule())
                    }
                    
                    Text("Kappa Alpha Psi Greek Picnic ").fontWeight(.heavy).frame(width: 150)
                    
                    HStack(spacing: 5){
                        
                        Image("map").renderingMode(.original)
                        Text("Atlanta, GA").foregroundColor(.gray)
                    }
                }.sheet(isPresented: $show) {
                    
                    Detail2()
                }
                
                //next card
                
                VStack(alignment: .leading,spacing: 12){
                    
                    Button(action: {
                        
                        self.show.toggle()
                        
                    }) {
                        
                        Image("face").renderingMode(.original)
                            .frame(width: 150.0, height: 250.0)
                            .clipShape(Capsule())
                    }
                    
                    Text("Kappa Greek Picnic Tailgate").fontWeight(.heavy).frame(width: 150)
                    
                    HStack(spacing: 5){
                        
                        Image("map").renderingMode(.original)
                        Text("Atlanta, GA").foregroundColor(.gray)
                    }
                }
                
            }
            
        }
        
    }
}


struct BottomViewtry : View {
    
    var body : some View{
        
        VStack{
            
            HStack{
                
                Text("What you want ?").fontWeight(.heavy)
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    
                    Text("View all").foregroundColor(.gray)
                }
                
            }.padding([.top], 15)
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack(spacing: 35){
                    
                    Button(action: {
                        
                    }) {
                        
                        VStack(spacing: 8){
                            
                            Image("mcard1").renderingMode(.original).resizable()
                                .frame(width: 50.0, height: 50.0)
                            //.scaledToFit()
                            Text("Undergraduate").foregroundColor(.gray)
                            
                        }
                        
                    }
                    
                    Button(action: {
                        
                    }) {
                        
                        VStack(spacing: 8){
                            
                            Image("mcard2").renderingMode(.original).resizable()
                                .frame(width: 50.0, height: 50.0)
                            Text("Graduate").foregroundColor(.gray)
                        }
                    }
                    
                    Button(action: {
                        
                    }) {
                        
                        VStack(spacing: 8){
                            
                            Image("mcard1").renderingMode(.original).resizable()
                                .frame(width: 50.0, height: 50.0)
                            Text("Alumni").foregroundColor(.gray)
                        }
                    }
                    Button(action: {
                        
                    }) {
                        
                        VStack(spacing: 8){
                            
                            Image("mcard2").renderingMode(.original).resizable()
                                .frame(width: 50.0, height: 50.0)
                            Text("Province").foregroundColor(.gray)
                        }
                    }
                    Button(action: {
                        
                    }) {
                        
                        VStack(spacing: 8){
                            
                            Image("mcard1").renderingMode(.original).resizable()
                                .frame(width: 50.0, height: 50.0)
                            Text("National").foregroundColor(.gray)
                        }
                    }
                    
                }
            }.padding(.leading, 20)
                .padding([.top,.bottom], 15)
        }
    }
}
// Why are there two details⁉️
struct Detail2 : View {
    
    var body : some View{
        
        VStack{
            
            Image("topbg").resizable().aspectRatio(1.35, contentMode: .fill).frame(width:UIScreen.main.bounds.width,height: 500).offset(y: -200).padding(.bottom, -200)
            
            GeometryReader{geo in
                
                VStack(alignment: .leading){
                    
                    topDescription()
                    middleDescription()
                    bottomDescription()
                    
                }
                
            }.background(Color.white)
                .clipShape(Rounded())
                .padding(.top, -75)
            
        }
    }
}

struct Detail3 : View {
    
    var body : some View{
        
        VStack{
            
            Image("Avatar").resizable().aspectRatio(1.35, contentMode: .fill).frame(width:UIScreen.main.bounds.width,height: 500).offset(y: -200).padding(.bottom, -200)
            
            GeometryReader{geo in
                
                VStack(alignment: .leading){
                    
                    topDescription()
                    middleDescription()
                    bottomDescription()
                    
                }
                
            }.background(Color.white)
            //.clipShape(Rounded())
            //.padding(.top, -75)
            
        }
    }
}


struct topDescription : View {
    
    var body : some View{
        
        VStack(alignment: .leading, spacing: 10){
            
            HStack{
                
                VStack(alignment: .leading){
                    
                    Text("Forest").fontWeight(.heavy).font(.largeTitle)
                    Text("Camping").fontWeight(.heavy).font(.largeTitle)
                    
                }
                
                Spacer()
                
                Text("$299").foregroundColor(Color("Krimson")).font(.largeTitle)
            }
            
        }.padding()
    }
}


struct middleDescription : View {
    
    var body : some View{
        
        VStack(alignment: .leading, spacing: 15){
            
            
            HStack(spacing: 5){
                
                Image("map").renderingMode(.original)
                Text("Kecamatan Klojen").foregroundColor(Color("Krimson"))
                
            }
            
            HStack(spacing : 8){
                
                ForEach(0..<5){_ in
                    
                    Image(systemName: "star.fill").font(.body).foregroundColor(.yellow)
                }
            }
            
            Text("People").fontWeight(.heavy)
            
            Text("Number Of People In Your Group").foregroundColor(.gray)
            
            HStack(spacing: 6){
                
                ForEach(0..<5){i in
                    
                    Button(action: {
                        
                    }) {
                        
                        Text("\(i + 1)").foregroundColor(.white).padding(20)
                        
                    }.background(Color("Krimson"))
                        .cornerRadius(8)
                }
            }
            
            
        }.padding(.horizontal,15)
    }
}

struct bottomDescription : View {
    
    var body : some View{
        
        VStack(alignment: .leading, spacing: 10){
            
            Text("Description").fontWeight(.heavy)
            Text("Forest Camping Experiences and Meanings Key elements of camping experience include nature, social interaction, and comfort/convenience. The most common associated meanings are restoration, family functioning").foregroundColor(.gray)
            
            HStack(spacing: 8){
                
                Button(action: {
                    
                }) {
                    
                    Image("Save").renderingMode(.original)
                }
                
                Button(action: {
                    
                }) {
                    
                    HStack(spacing: 6){
                        
                        Text("Book Your Experience")
                        Image("arrow").renderingMode(.original)
                        
                    }.foregroundColor(.white)
                        .padding()
                    
                }.background(Color("Krimson"))
                    .cornerRadius(8)
                
            }.padding(.top, 6)
            
        }.padding()
    }
}

struct Rounded : Shape {
    
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft,.topRight], cornerRadii: CGSize(width: 40, height: 40))
        return Path(path.cgPath)
    }
}

struct KappaEvent_Previews: PreviewProvider {
    static var previews: some View {
        KappaEventCV()
    }
}
