//
//  SwiftUIView.swift
//  greekdomSocialApp
//
//  Created by Will Janey on 3/5/20.
//  Copyright © 2020 Will Janey. All rights reserved.

//This page is KappaWork Page
//Inspiration from Travel App page Kavsoft💡

import Foundation
import SwiftUI

struct KappaWorkCV: View {
    var body: some View {
        
        
        
        KappaWork()
        
    }
}

struct KappaWorkCV_Previews: PreviewProvider {
    static var previews: some View {
        KappaWorkCV()
    }
}

struct KappaWork : View {
    
    var body : some View{
        
        VStack(alignment: .leading,spacing: 12){
            
            HStack{
                
                Button(action: {
                    
                }) {
                    
                    Image("Google Software Developer").renderingMode(.original)
                }
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    
                    Image("Profile").renderingMode(.original)
                }
            }
            
            Text("Testing").fontWeight(.heavy).font(.largeTitle).padding(.top,15)
            
            HStack{
                
                Button(action: {
                    
                }) {
                    
                    Text("Events").fontWeight(.heavy).foregroundColor(.black)
                }
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    
                    Text("KappaWork").foregroundColor(.gray)
                }
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    
                    Text("Activities").foregroundColor(.gray)
                }
            }.padding([.top],30)
                .padding(.bottom, 15)
            
            MiddleView65()
            
            BottomView65().padding(.top, 10)
            
        }.padding()
    }
}

struct MiddleView65 : View {
    
    @State var show = false
    
    var body : some View{
        
        ScrollView(.horizontal, showsIndicators: false) {
            //This will be the most popular post within the search💡
            
            HStack(spacing: 20){
                
                VStack(alignment: .leading,spacing: 12){
                    
                    Button(action: {
                        self.show.toggle()
                    }) {
                        
                        Image("intern").renderingMode(.original).resizable()
                            .frame(width: 150.0, height: 250.0)
                            .clipShape(Capsule())
                        //
                        
                        //.shadow(radius: 10)
                    }
                    
                    Text("Boeing Internship").fontWeight(.heavy)
                    
                    HStack(spacing: 5){
                        
                        Image("map").renderingMode(.original)
                        Text("Chicaago, IL").foregroundColor(.gray)
                    }
                }
                
                VStack(alignment: .leading,spacing: 12){
                    
                    Button(action: {
                        
                        self.show.toggle()
                        
                    }) {
                        
                        Image("intern").renderingMode(.original)
                            .frame(width: 150.0, height: 250.0)
                            .clipShape(Capsule())
                    }
                    
                    Text("Google").fontWeight(.heavy)
                    
                    HStack(spacing: 5){
                        
                        Image("map").renderingMode(.original)
                        Text("Mountain View, CA").foregroundColor(.gray)
                    }
                }
                
                VStack(alignment: .leading,spacing: 12){
                    
                    Button(action: {
                        
                        self.show.toggle()
                        
                    }) {
                        
                        Image("intern").renderingMode(.original)
                            .frame(width: 150.0, height: 250.0)
                            .clipShape(Capsule())
                    }
                    
                    Text("Testing").fontWeight(.heavy)
                    
                    HStack(spacing: 5){
                        
                        Image("map").renderingMode(.original)
                        Text("Mountain View, CA").foregroundColor(.gray)
                    }
                }
            }
            
        }.sheet(isPresented: $show) {
            
            Detail65()
        }
    }
}


struct BottomView65 : View {
    
    var body : some View{
        
        VStack{
            
            HStack{
                
                Text("What you want my boy?").fontWeight(.heavy)
                
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
                            Text("Internship").foregroundColor(.gray)
                            
                        }
                        
                    }
                    
                    Button(action: {
                        
                    }) {
                        
                        VStack(spacing: 8){
                            
                            Image("mcard2").renderingMode(.original).resizable()
                                .frame(width: 50.0, height: 50.0)
                            Text("Entry Level").foregroundColor(.gray)
                        }
                    }
                    
                    Button(action: {
                        
                    }) {
                        
                        VStack(spacing: 8){
                            
                            Image("mcard1").renderingMode(.original).resizable()
                                .frame(width: 50.0, height: 50.0)
                            Text("Mid-Level").foregroundColor(.gray)
                        }
                    }
                    Button(action: {
                        
                    }) {
                        
                        VStack(spacing: 8){
                            
                            Image("mcard2").renderingMode(.original).resizable()
                                .frame(width: 50.0, height: 50.0)
                            Text("Senior-Level").foregroundColor(.gray)
                        }
                    }
                    Button(action: {
                        
                    }) {
                        
                        VStack(spacing: 8){
                            
                            Image("mcard1").renderingMode(.original).resizable()
                                .frame(width: 50.0, height: 50.0)
                            Text("Volunteer").foregroundColor(.gray)
                        }
                    }
                    
                }
            }.padding(.leading, 20)
                .padding([.top,.bottom], 15)
        }
    }
}

struct Detail65 : View {
    
    var body : some View{
        
        VStack{
            
            Image("Card6").resizable().aspectRatio(1.35, contentMode: .fit).frame(width:UIScreen.main.bounds.width,height: 500).offset(y: -200).padding(.bottom, -200)
            
            GeometryReader{geo in
                
                VStack(alignment: .leading){
                    
                    detailTop65()
                    detailMiddle65()
                    detailBottom65()
                    
                }
                
            }.background(Color.white)
                .clipShape(Rounded())
                .padding(.top, -75)
            
        }
    }
}

struct detailTop65 : View {
    
    var body : some View{
        
        VStack(alignment: .leading, spacing: 10){
            
            HStack{
                
                VStack(alignment: .leading){
                    
                    Text("Google").fontWeight(.heavy).font(.largeTitle)
                    
                    Text("Software Developer Position").fontWeight(.heavy).font(.largeTitle)
                    
                }
                
                Spacer()
                
                Text("Deadline 3/16/20").foregroundColor(Color("Krimson")).font(.caption)
            }
            
        }.padding()
    }
}


struct detailMiddle65 : View {
    
    var body : some View{
        
        VStack(alignment: .leading, spacing: 15){
            
            HStack(spacing: 5){
                Image("globe").renderingMode(.original)
                    .resizable()
                    .frame(width: 10.0, height: 10.0)
                Spacer(minLength: 5)
                
                Text("3/11/20").foregroundColor(.gray)
            }
            
            HStack(spacing: 5){
                
                Image("map").renderingMode(.original)
                    .resizable()
                    .frame(width: 10.0, height: 10.0)
                Spacer(minLength: 1)
                Text("Kecamatan Klojen").foregroundColor(Color("Krimson"))
                
            }
            
            HStack(spacing : 8){
                
                ForEach(0..<5){_ in
                    
                    Image(systemName: "star.fill").font(.body).foregroundColor(Color("oldGold"))
                }
            }
            
            Text("People").fontWeight(.heavy)
            
            Text("Number Of Years of Experience").foregroundColor(.gray)
            
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

struct detailBottom65 : View {
    
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
                        
                        Text("Submit Your Resume")
                        Image("arrow").renderingMode(.original)
                        
                    }.foregroundColor(.white)
                        .padding()
                    
                }.background(Color("Krimson"))
                    .cornerRadius(8)
                
            }.padding(.top, 6)
            
        }.padding()
    }
}

struct Rounded65 : Shape {
    
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft,.topRight], cornerRadii: CGSize(width: 40, height: 40))
        return Path(path.cgPath)
    }
}
