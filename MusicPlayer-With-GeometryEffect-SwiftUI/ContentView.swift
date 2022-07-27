//
//  ContentView.swift
//  MusicPlayer-With-GeometryEffect-SwiftUI
//
//  Created by Mitya Kim on 7/26/22.
//

import SwiftUI

struct MusicPlayerBar: View {
    
    let namespace: Namespace.ID
    
    var body: some View {
        HStack {
            Image("image")
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(3)
                .padding()
                .matchedGeometryEffect(id: "animation", in: namespace)
            
            Text("Down to Love")
                .font(.headline)
            
            Spacer()
            
            Image(systemName: "play.fill")
    
            Image(systemName: "forward.fill")
                .padding(.trailing, 10)
   
        }.frame(maxWidth: .infinity, maxHeight: 60)
            .background(.white)
    }
}

struct MusicPlayer: View {
    
    let namespace: Namespace.ID
    
    var body: some View {
        VStack {
            Image("image")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(20)
                .padding(30)
                .matchedGeometryEffect(id: "animation", in: namespace)
            
            HStack {
                VStack{
                    Text("Down to Love")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Text("Armin Van Burren")
                        .font(.title)
                        .fontWeight(.light)
                        .opacity(0.5)
                        .foregroundColor(.white)
                }.padding()
                Spacer()
            }
            
            HStack {
                Spacer()
                
                Image(systemName: "backward.fill")
                    .foregroundColor(.white)
                    .font(.system(size: 30))
                
                Spacer()
                
                Image(systemName: "play.fill")
                    .foregroundColor(.white)
                    .font(.system(size: 30))
                
                Spacer()
                
                Image(systemName: "forward.fill")
                    .foregroundColor(.white)
                    .font(.system(size: 30))
                
                Spacer()
            }
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.yellow)
    }
}

struct ContentView: View {
    
    @State private var showDetails: Bool = false
    @Namespace private var ns
    
    var body: some View {
        
        VStack {
            
            Spacer()
            
            if showDetails {
                MusicPlayer(namespace: ns)
            } else {
                MusicPlayerBar(namespace: ns)
            }
            
        }.onTapGesture {
            withAnimation(.spring()) {
                showDetails.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
