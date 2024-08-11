//
//  ContentView.swift
//  instagramReDesign_Watch Watch App
//
//  Created by Farid on 03/08/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    ForEach(Feeds) { post in
                        PostUI(postData: post)
                    }
                }
            }
        }
    }
}

struct PostUI: View {
    @State var postData: feed
    @State var isLike = false
    @State var isLikeScale = CGFloat(1.0)

    var body: some View {
        VStack(spacing: 15) {
            HStack(spacing: 10) {
                Image(postData.profileImg)
                    .resizable()
                    .frame(width: 35, height: 35)
                    .cornerRadius(17.5)
                VStack(alignment: .leading) {
                    Text(postData.name)
                        .foregroundColor(.white)
                        .font(.caption2)
                        .fontWeight(.bold)
                    Text(postData.location)
                        .foregroundColor(.gray)
                        .font(.caption2)
                }
                Spacer()
                
            }

            let screenSize = WKInterfaceDevice.current()

            Image(postData.postImg)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: screenSize.screenBounds.width / 2.0)
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 6))
                .shadow(radius: 6)
            
            HStack {
                Spacer()
                Image(systemName: isLike ? "heart.fill" : "heart")
                    .font(.title3)
                    .scaleEffect(isLikeScale * 1.1)
                    .foregroundColor(isLike ? Color.red : Color.white)
                    .scaleEffect(isLikeScale)
                    .onTapGesture {
                        isLikeScale = 1.3
                        withAnimation(.easeInOut) {
                            isLikeScale = 1.0
                        }
                        isLike.toggle()
                    }
                    
                Spacer()
                
                Image(systemName: "text.bubble")
                    .font(.title3)
                Spacer()
                Image(systemName: "paperplane")
                    .font(.title3)
                Spacer()
                    
            }
        }
        .padding(7)
    }
}
struct feed: Identifiable {
    var id = UUID()
    var name: String
    var profileImg: String // Properti untuk menyimpan gambar profil
    var postImg: String
    var location: String
}
var Feeds = [
    feed(name: "Sherlock", profileImg: "profile", postImg: "post1", location: "Berlin"),
    feed(name: "Alex", profileImg: "profile2", postImg: "post2", location: "Munchen"),
    feed(name: "Ray", profileImg: "profile3", postImg: "post3", location: "Madrid"),
    feed(name: "Karim", profileImg: "profile4", postImg: "post4", location: "Istanbul"),
]
#Preview {
    ContentView()
}


// create by farid 
