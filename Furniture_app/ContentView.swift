//
//  ContentView.swift
//  Furniture_app
//
//  Created by Abu Anwar MD Abdullah on 14/2/21.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedIndex: Int = 0
    private let categories = ["All", "Chair", "Sofa", "Lamp", "Kitchen", "Table"]
    var body: some View {
        VStack {
            HomeScreen()
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

struct SearchAndScanView: View {
    @State private var search: String = ""
    var body: some View {
        HStack{
            HStack{
                Image("Search")
                    .padding(.trailing, 8)
                TextField("Search Furniture", text: $search)
                
            }
            .padding(.all, 20)
            .background(Color.white)
            .cornerRadius(10.0)
            .padding(.trailing)
            
            Button(action: {}) {
                Image("Scan")
                    .padding()
                    .background(Color("Primary"))
                    .cornerRadius(10.0)
            }
            
            
        }
        
        .padding(.horizontal)
    }
}

struct CategoryView: View {
    let isActive: Bool
    let text: String
    var body: some View {
        VStack (alignment: .leading, spacing: 0){
            Text(text)
                .font(.system(size: 18))
                .fontWeight(.medium)
                .foregroundColor(isActive ? Color("Primary"):Color.black.opacity(0.5))
            
            if(isActive){
                Color("Primary")
                    .frame(width: 15, height: 2)
                    .clipShape(Capsule())
            }
            
        }
        .padding(.trailing)
    }
}

struct ProductCardView: View {
    let image : Image
    let size : CGFloat
    var body: some View {
        VStack{
            image
                .resizable()
                .frame(width: size, height: 200 * (size/210))
                .cornerRadius(20.0)
            
            Text("Luxury Swedian Chair")
                .font(.title3)
                .fontWeight(.bold)
            
            HStack (spacing: 2){
                ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                    Image("star")
                }
                
                Spacer()
                
                Text("$1299")
                    .font(.title3)
                    .fontWeight(.bold)
                
            }
        }
        .frame(width: size)
        .padding()
        .background(Color.white)
        .cornerRadius(20.0)
    }
}

struct BottomNavBarItem: View {
    let image : Image
    let action  : ()-> Void
    var body: some View {
        Button(action: action, label: {
            image
                .frame(maxWidth: .infinity)
        })
    }
}

struct HomeScreen: View {
    var body: some View {
        ZStack{
            Color("Bg")
                .ignoresSafeArea()
            
            ScrollView {
                VStack (alignment: .leading){
                    AppBarView()
                    
                    TagLineView()
                        .padding()
                    
                    SearchAndScanView()
                    
                    ScrollView (.horizontal, showsIndicators: false){
                        HStack{
                            ForEach(0 ..< categories.count, id: \.self) { i in
                                // if index == 1 then isActive is true
                                CategoryView(isActive: i == selectedIndex, text: categories[i])
                                    .onTapGesture {
                                        selectedIndex = i
                                    }
                            }
                        }
                        .padding()
                    }
                    Text("Popular")
                        .font(.custom("PlayfairDisplay-Bold", size: 24))
                        .padding(.horizontal)
                    
                    ScrollView (.horizontal, showsIndicators: false){
                        HStack{
                            ForEach(0 ..< 4) { index in
                                ProductCardView(image: Image("chair_\(index + 1)"), size: 210)
                            }
                            .padding(.trailing)
                        }
                        .padding(.leading)
                    }
                    
                    Text("Best")
                        .font(.custom("PlayfairDisplay-Bold", size: 24))
                        .padding(.horizontal)
                        .padding(.top)
                    
                    ScrollView (.horizontal, showsIndicators: false){
                        HStack{
                            ForEach(0 ..< 4) { index in
                                ProductCardView(image: Image("chair_\(index + 1)"), size: 180)
                            }
                            .padding(.trailing)
                        }
                        .padding(.leading)
                    }
                    
                    
                }
            }
            
            // custom bottom nav bar
            
            HStack{
                BottomNavBarItem(image: Image("Home")) {}
                BottomNavBarItem(image: Image("fav")) {}
                BottomNavBarItem(image: Image("shop")) {}
                BottomNavBarItem(image: Image("User")) {}
            }
            .padding()
            .background(Color.white)
            .clipShape(Capsule())
            .padding(.horizontal)
            .shadow(color: Color.white.opacity(0.15), radius: 8, x: 2, y: 6)
            .frame(maxHeight: .infinity, alignment: .bottom)
            
            
        }
    }
}
