//
//  Home.swift
//  GameStream
//
//  Created by Samuel on 22/3/22.
//

import SwiftUI
import AVKit

struct Home: View {
    
    @State var tabSeleccionado:Int = 2
    
    var body: some View {
        
        TabView(selection: $tabSeleccionado){
            PantallaPerfil()
                .tabItem {
                    Image(systemName: "person")
                    Text("Perfil")
                }.tag(0)
            
            
            GamesView()
                .tabItem {
                    Image(systemName: "gamecontroller")
                    Text("Juegos")
                }.tag(1)
            PantallaHome()
                .tabItem {
                    Image(systemName: "house")
                    Text("Inicio")
                }.tag(2)
            PantallaFavoritos()
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favoritos")
                }.tag(3)
        }.accentColor(.white)
        
        
    }
    
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor(Color("TabBar-Color"))
        //UITabBar.appearance().barTintColor = UIColor(Color("TabBar-Color"))
        UITabBar.appearance().unselectedItemTintColor = UIColor.gray
        UITabBar.appearance().isTranslucent = true
        print("init vistas de home")
    }
}

struct PantallaHome:View{
    
    
    var body: some View{
        ZStack {
            Color("Color-Main").ignoresSafeArea()
            
            VStack(spacing: 10) {
                
                Image("AppLogo").resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250, alignment: .center).padding(.horizontal,11)
                
                
                SubModuloHome()
                
            }.padding(.horizontal, 18)
        }.navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
    }
    
    
}

struct SubModuloHome:View {
    @State var textoBusqueda = ""
    @State var url = "https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4"
    
    @State var isPlayerActive = false
    @State var isGameInfoEmpty = false
    
    @ObservedObject var juegoEncontrado = SearchGame()
    @State var isGameViewActive = false
    
    @State var urlGame: String = ""
    @State var titulo: String = ""
    @State var studio: String = ""
    @State var calificacion : String = ""
    @State var anoPublicacion : String = ""
    @State var descripcion: String = ""
    @State var tags : [String] = [""]
    @State var imgsUrl : [String] = [""]
    
    
    let urlVideos:[String] = ["https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256671638/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256720061/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256814567/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256705156/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256801252/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256757119/movie480.mp4"]
    var body: some View{
        
        VStack{
            HStack{
                Button {
                    busqueda(name: textoBusqueda)
                    
                } label: {
                    Image(systemName: "magnifyingglass").foregroundColor(textoBusqueda.isEmpty ? Color(.yellow) : Color("Dark-Cian"))
                    
                }.alert(isPresented: $isGameInfoEmpty) {
                    Alert(title: Text("Error"), message: Text("No se encontro el juego"), dismissButton: .default(Text("Cancelar")))
                }
                
                
                
                ZStack(alignment: .leading){
                    if textoBusqueda.isEmpty{
                        Text("Buscar un video").foregroundColor(Color(red: 174/255, green: 177/255, blue: 185/255, opacity: 1))
                    }
                    
                    TextField("", text: $textoBusqueda).foregroundColor(.white)
                    
                }
                
                
                

            }.padding([.top, .leading, .bottom], 11)
                .background(Color("Blue-Gray"))
                .clipShape(Capsule())
            
            Text("LOS MÁS POPULARES")
                .font(.title3)
                .foregroundColor(.white)
                .fontWeight(.bold)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding(.top)
            ZStack{
                Button {
                        busqueda(name: "The Witcher 3")
                     
                   /* url = urlVideos[0]
                    print("Url: \(url)")
                    isPlayerActive = true
                    */
                } label: {
                    VStack(spacing: 0){
                        Image("The Witcher 3").resizable().scaledToFit()
                        Text("The Witcher 3").frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .background(Color("Blue-Gray"))
                    }
                }

                Image(systemName: "play.circle.fill")
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 40, height: 40)
                
            }.frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                .padding(.vertical)
            
            Text("CATEGORÍAS SUGERIDAS PARA TI")
                .font(.title3)
                .foregroundColor(.white)
                .fontWeight(.bold)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    Button {
                        print("categoria1")
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color("Blue-Gray"))
                                .frame(width: 160, height: 90)
                            Image("FPS").resizable().scaledToFit()
                                .frame(width: 42, height: 42)
                        }
                    }
                    
                    Button {
                        print("categoria2")
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color("Blue-Gray"))
                                .frame(width: 160, height: 90)
                            Image("RPG").resizable().scaledToFit()
                                .frame(width: 42, height: 42)
                        }
                    }
                    
                    Button {
                        print("categoria3")
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color("Blue-Gray"))
                                .frame(width: 160, height: 90)
                            Image("OpenWorld").resizable().scaledToFit()
                                .frame(width: 42, height: 42)
                        }
                    }

                }
            }
            
            Text("RECOMENDADOS PARA TI")
                .font(.title3)
                .foregroundColor(.white)
                .fontWeight(.bold)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    Button {
                        
                        busqueda(name: "ABSU")
                        //url = urlVideos[1]
                        //print("URL: \(url)")
                        //isPlayerActive = true
                    } label: {
                        Image("Abzu").resizable()
                            .scaledToFit()
                            .frame(width: 240, height: 135)
                    }
                    
                    Button {
                        busqueda(name: "Crash Bandicoot")
                        
                    } label: {
                        Image("CrashBC").resizable()
                            .scaledToFit()
                            .frame(width: 240, height: 135)
                    }
                    
                    Button {
                        busqueda(name: "Death Stranding")
                        
                    } label: {
                        Image("Fifa").resizable()
                            .scaledToFit()
                            .frame(width: 240, height: 135)
                    }
                    Button {
                        busqueda(name: "CupHead")
                        
                    } label: {
                        Image("Fifa").resizable()
                            .scaledToFit()
                            .frame(width: 240, height: 135)
                    }
                    Button {
                        busqueda(name: "Hades")
                        
                    } label: {
                        Image("Fifa").resizable()
                            .scaledToFit()
                            .frame(width: 240, height: 135)
                    }
                    Button {
                        busqueda(name: "Grand Theft Auto V")
                    } label: {
                        Image("Fifa").resizable()
                            .scaledToFit()
                            .frame(width: 240, height: 135)
                    }

                }
            }
            
        }
        
        
        NavigationLink(isActive: $isGameViewActive) {
            GameView(url: urlGame, titulo: titulo, studio: studio, calificacion: calificacion, anoPublicacion: anoPublicacion, descripcion: descripcion, tags: tags, imgsUrl: imgsUrl)
        } label: {
            EmptyView()
        }

    }
    func busqueda(name: String){
        juegoEncontrado.search(gameName: name)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.3){
            print("cantidad e: \(juegoEncontrado.gameInfo.count)")
            if juegoEncontrado.gameInfo.count == 0 {
                isGameInfoEmpty = true
            }else{
                urlGame = juegoEncontrado.gameInfo[0].videosUrls.mobile
                titulo = juegoEncontrado.gameInfo[0].title
                studio = juegoEncontrado.gameInfo[0].studio
                calificacion = juegoEncontrado.gameInfo[0].contentRaiting
                anoPublicacion = juegoEncontrado.gameInfo[0].publicationYear
                descripcion = juegoEncontrado.gameInfo[0].publicationYear
                tags = juegoEncontrado.gameInfo[0].tags
                imgsUrl = juegoEncontrado.gameInfo[0].galleryImages
                
                isGameViewActive = true
            }
        }
    }
}
struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .previewInterfaceOrientation(.portraitUpsideDown)
    }
}
