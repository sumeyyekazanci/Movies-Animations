//
//  HomeView.swift
//  Movies&Animations
//
//  Created by Sümeyye Kazancı on 11.07.2022.
//

import SwiftUI

struct HomeView: View {
    @State var currentIndex: Int = 0
    @State var currentTab: String = "Movies"
    
    @Environment(\.colorScheme) var scheme

    var body: some View {
        ZStack {
            
            BGView()
            
            // MARK: Main View Content
            VStack {
                
                NavBar()
                if currentTab == "Movies" {
                    MoviesView()
                }else if currentTab == "Tickets" {
                    EmptyView()
                }
                
            }
        }
    }
    
    // MARK: Custom NavBar
    @ViewBuilder
    func NavBar() -> some View {
        HStack(spacing:0) {
            ForEach(["Movies", "Tickets"], id: \.self) {
                tab in
                Button {
                    withAnimation {
                        currentTab = tab
                    }
                } label: {
                    Text(tab)
                        .foregroundColor(.white)
                        .padding(.horizontal,20)
                        .padding(.vertical,6)
                        .background(content: {
                            if currentTab == tab {
                                Capsule().fill(.ultraThickMaterial)
                            }
                        })
                        
                }
            }.padding()
        }
    }
    
    // MARK: Blurred BG
    @ViewBuilder
    func BGView() -> some View {
        GeometryReader {
            proxy in
            let size = proxy.size
            
            TabView(selection: $currentIndex) {
                ForEach(movies.indices,id: \.self) {
                    index in
                    Image(movies[index].artwork)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: size.width,height: size.height)
                        .clipped()
                        .tag(index)
                }
            }
            
            let color: Color = (scheme == .dark ? .black: .white)
            LinearGradient(colors: [
                .black,
                .clear,
                color.opacity(0.1),
                color.opacity(0.3),
                color.opacity(0.5),
                color
                
            ], startPoint: .top, endPoint: .bottom)
            //Blurred Area
            Rectangle().fill(.ultraThinMaterial)
            
        }.ignoresSafeArea()
    }
    
    @ViewBuilder
    func MoviesView() -> some View {
        ScrollView {
            Image(movies[currentIndex].artwork)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: .infinity, height: 250)
                .cornerRadius(15)
                .padding()
                
            Text("Summary:")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.title2)
                .padding()
                
            Text(movies[currentIndex].plot)
                .multilineTextAlignment(.leading)
                .padding()
        }
        
        ScrollView(.horizontal,showsIndicators: false) {
            HStack(spacing: 15) {
                ForEach(movies.indices, id: \.self) {
                    index in
                    Image(movies[index].artwork)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 120)
                        .cornerRadius(15)
                        .onTapGesture {
                            currentIndex = index
                        }
                }
            }
            .padding()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().preferredColorScheme(.dark)
    }
}
