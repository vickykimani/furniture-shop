//
//  ContentView.swift
//  Furniture_app
//
//  Created by Abu Anwar MD Abdullah on 14/2/21.
//

import SwiftUI

struct ContentView: View {
   
    var body: some View {
        VStack {
            ZStack{
                Color("Bg")
                    .ignoresSafeArea()
                
                VStack{
                    Image("chair_1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .ignoresSafeArea()
                    
                    DescriptionView()
                        .offset(y: -40)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



struct DescriptionView: View {
    var body: some View {
        VStack (alignment: .leading){
            Text("Luxury Swedian \nChair")
                .font(.title)
                .fontWeight(.bold)
            
            HStack (spacing: 4){
                ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                    Image("star")
                }
                Text("(4.9)")
                    .opacity(0.5)
                    .padding(.leading, 8)
                
                Spacer()
                
            }
            
            Text("Description")
                .fontWeight(.medium)
                .padding(.vertical, 8)
            
            Text("The Luxury Swedian Chair is a contemporary chair based on the virtues of modern craft. It carries on the simplicity and honesty of the archetypical chair")
                .lineSpacing(8.0)
                .opacity(0.6)
            
            HStack(alignment: .top){
                VStack(alignment: .leading){
                    Text("Size")
                        .fontWeight(.semibold)
                        .padding(.bottom, 4)
                    Text("Height: 120 cm")
                        .opacity(0.6)
                    Text("Wide: 80 cm")
                        .opacity(0.6)
                    Text("Diameter: 72 cm")
                        .opacity(0.6)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack(alignment: .leading){
                    Text("Treatment")
                        .fontWeight(.semibold)
                        .padding(.bottom, 4)
                    
                    Text("Jati Wood, Canvas,")
                        .opacity(0.6)
                    
                    Text("Amazing Love")
                        .opacity(0.6)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.vertical)
            
            HStack{
                VStack(alignment: .leading){
                    Text("Colors")
                        .fontWeight(.semibold)
                    
                    HStack{
                        ColorDotView(color: .white)
                        ColorDotView(color: .black)
                        ColorDotView(color: Color("Primary"))
                        
                    }
                    
                }
                Button(action: {}) {
                    Image(systemName: "minus")
                        .padding(.all)
                }
                .frame(width: 30, height: 30)
                .overlay(RoundedRectangle(cornerRadius: 50).stroke())
                .foregroundColor(.black)
                
                Text("1")
                    .font(.title2)
                
                Button(action: {}) {
                    Image(systemName: "plus")
                        .padding(.all)
                }
                .frame(width: 30, height: 30)
                .background(Color("Primary"))
                .clipShape(Circle())
                .foregroundColor(.white)
            }
            
        }
        .padding()
        .padding(.top)
        .background(Color("Bg"))
        .cornerRadius(40.0)
    }
}

struct ColorDotView: View {
    let color: Color
    var body: some View {
        color
            .frame(width: 24, height: 24)
            .clipShape(Circle())
    }
}
