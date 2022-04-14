//
//  GameView.swift
//  GameStream
//
//  Created by Samuel on 29/3/22.
//

import SwiftUI
import AVKit
import Kingfisher

struct GameView: View {
    
    var url: String
    var titulo: String
    var studio: String
    var calificacion : String
    var anoPublicacion : String
    var descripcion: String
    var tags : [String]
    var imgsUrl : [String]
    
    var body: some View {
        ZStack{
            Color("Color-Main").ignoresSafeArea()
            
            VStack{
                video(url: url).frame(height: 300)
                ScrollView{
                    //video info
                    videoInfo(titulo: titulo, studio: studio, calificacion: calificacion, anoPublicacion: anoPublicacion, descripcion: descripcion, tags: tags).padding(.bottom)
                    
                    gallery(imgsUrl: imgsUrl)
                }.frame(maxWidth: .infinity)
            }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(url: "ejemplo.com", titulo: "Sonic", studio: "Sega", calificacion: "E+", anoPublicacion: "1991", descripcion: "Juego de Sega Genesis publicado en 1991 con más de 40 millones de copas vendidas actualmente", tags: ["plataformas", "mascota"], imgsUrl: ["https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c63807ea5b24a8646e02dd.600x338.jpg","https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c63807ea5b24a8b46e02dd.600x338.jpg", "https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c63807ea5b24a8b46e02dd.600x338.jpg"])
    }
}
 

struct video: View{
    var url: String
    var body: some View{
        VideoPlayer(player: AVPlayer(url: URL(string: url)!)).ignoresSafeArea()
    }
}

struct videoInfo: View{
    var titulo: String
    var studio: String
    var calificacion : String
    var anoPublicacion : String
    var descripcion: String
    var tags : [String]
    
    var body: some View{
        VStack(alignment: .leading){
            Text("\(titulo)").foregroundColor(.white)
                .font(.largeTitle)
                .padding(.leading)
            HStack{
                Text("\(studio)")
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .padding(.top, 5)
                    .padding(.leading)
                Text("\(calificacion)")
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .padding(.top, 5)
                Text("\(anoPublicacion)")
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .padding(.top, 5)
            }
            
            Text("\(descripcion)")
                .foregroundColor(.white)
                .font(.subheadline)
                .padding(.top, 5)
                .padding(.leading)
            
            HStack{
                ForEach(tags, id: \.self){
                    tag in
                        Text("#\(tag)")
                            .foregroundColor(.white)
                            .font(.subheadline)
                            .padding(.top, 3)
                            .padding(.leading)
                    
                }
            }
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct gallery: View{
    var imgsUrl : [String]
    let formaGrid = [
        GridItem(.flexible())
    ]
    var body: some View{
        
        VStack(alignment: .leading){
            Text("Galeria")
                .foregroundColor(.white)
                .font(.title)
                .padding(.leading)
            
            ScrollView(.horizontal){
                LazyHGrid(rows: formaGrid, spacing: 8){
                    ForEach(imgsUrl, id: \.self){
                        imgUrl in
                        KFImage(URL(string: imgUrl))
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                        //AsyncImage(url: URL(string: imgUrl)).frame(width: 200, height: 200)
                    }
                }
            }.frame(height: 180)
            
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
}
