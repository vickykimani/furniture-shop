//
//  ContentView.swift
//  Furniture_app
//
//  Created by Abu Anwar MD Abdullah on 14/2/21.
//

import SwiftUI

struct ContentView: View {
    @State private var search: String = ""
    var body: some View {
        ZStack{
            Color("Bg")
                .ignoresSafeArea()
            
            VStack (alignment: .leading){
                AppBarView()
                
                TagLineView()
                    .padding()
                
                HStack{
                    HStack{
                        Image("Search")
                            .padding(.trailing, 8)
                        TextField("Search Furniture", text: $search)
                        
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10.0)
                    .padding(.trailing)
                    
                    Image("Scan")
                        .padding()
                        .background(Color("Primary"))
                        .cornerRadius(10.0)
                }
                
                .padding(.horizontal)
                
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct AppBarView: View {
    var body: some View {
        HStack{
            Button(action: {}) {
                Image("menu")
                    .padding()
                    .background(Color(.white))
                    .cornerRadius(10.0)
            }
            
            Spacer()
            
            Button(action: {}) {
                Image("Profile")
                    .resizable()
                    .frame(width: 42, height: 42)
                    .cornerRadius(10.0)
            }
            
            
        }
        .padding(.horizontal)
    }
}

struct TagLineView: View {
    var body: some View {
        Text("Find The \nBest ")
            .font(.custom("PlayfairDisplay-Regular", size: 28))
            .foregroundColor(Color("Primary"))
        + Text("Furniture!")
            .font(.custom("PlayfairDisplay-Bold", size: 28))
            .foregroundColor(Color("Primary"))
    }
}
