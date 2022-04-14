//
//  PantallaFavoritos.swift
//  GameStream
//
//  Created by Samuel on 4/4/22.
//

import SwiftUI
import AVKit

struct PantallaFavoritos: View {
    
    @ObservedObject var todosLosVideoJuegos = ViewModel()
    
    
    var body: some View {
        ZStack{
            Color("Color-Main").ignoresSafeArea()
            
            VStack{
                Text("FAVORITOS")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.bottom, 9.0)
                ScrollView{
                    ForEach(todosLosVideoJuegos.gamesInfo, id: \.self){
                        game in
                        
                        VStack(spacing: 0) {
                            VideoPlayer(player: AVPlayer(url: URL(string: game.videosUrls.mobile)!)).frame(height: 300)
                        
                            Text(game.title)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(Color("Blue-Gray"))
                                .clipShape(RoundedRectangle(cornerRadius: 3.0))
                        }
                        
                    }
                    
                }.padding(.bottom, 8.0)
            }.padding(.horizontal, 6)
        }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
    }
}

struct PantallaFavoritos_Previews: PreviewProvider {
    static var previews: some View {
        PantallaFavoritos()
    }
}
