//
//  PantallaPerfil.swift
//  GameStream
//
//  Created by Samuel on 4/4/22.
//

import SwiftUI

struct PantallaPerfil: View {
    
    @State var nombreUsuario = "Lorem"
    @State var imagenPerfil:UIImage = UIImage(named: "image")!
    
    
    var body: some View {
        
        
        ZStack{
         
            Color("Color-Main").ignoresSafeArea()
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
            
            VStack{
                Text("Perfil").fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity,  alignment: .center).padding( )
                //imagen del usuario
                VStack{
                    
                    
                    Image(uiImage: imagenPerfil).resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 118, height: 118)
                        .clipShape(Circle())
                    
                    
                }.padding(EdgeInsets(top: 16, leading: 0, bottom: 32, trailing: 0))
                
                Text("Ajustes").fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity,  alignment: .leading).padding(.leading, 18)
                
                ModuloAjustes()
            }
        }.onAppear {
            
             print("revisando si tengo datos de usuario en mis user defaults")
            
            if getUIImage(named: "fotoperfil.png") != nil {
                imagenPerfil = getUIImage(named: "fotoperfil.png")!
            }else{
                print("no tengo imagen de perfil")
            }
            
            
            if UserDefaults.standard.object(forKey: "datosUsuario") != nil {
                nombreUsuario = UserDefaults.standard.stringArray(forKey: "datosUsuario")![2]
            }else{
                print("no tengo ingformacion del usuario")
            }
            
        }
            
            
        
        
        
        
    }
    
    
    func getUIImage(named: String)-> UIImage?{
        if let dir = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false){
            
            
            return UIImage(contentsOfFile: URL(fileURLWithPath: dir.absoluteString).appendingPathComponent(named).path)
        }
        return nil
    }
}

struct PantallaPerfil_Previews: PreviewProvider {
    static var previews: some View {
        PantallaPerfil()
    }
}

struct ModuloAjustes: View{
    @State var isToogleOn = true
    @State var isEditProfileViewActive = false
    var body: some View{
        VStack(spacing:3){
            Button {
                print("e")
            } label: {
                HStack{
                    Text("Cuenta").foregroundColor(.white)
                    Spacer()
                    Text(">").foregroundColor(.white)
                }.padding()
                
                
            }.background(Color("Blue-Gray")).clipShape(RoundedRectangle(cornerRadius: 1.0))
            
            Button {
                print("e")
            } label: {
                HStack{
                    Text("Notificaciones").foregroundColor(.white)
                    Spacer()
                    Toggle("", isOn: $isToogleOn)
                }.padding()
                
                
                
                
            }.background(Color("Blue-Gray")).clipShape(RoundedRectangle(cornerRadius: 1.0))
            
            Button {
                isEditProfileViewActive = true
            } label: {
                HStack{
                    Text("Editar Perfil").foregroundColor(.white)
                    Spacer()
                    Text(">").foregroundColor(.white)
                }.padding()
                
                
            }.background(Color("Blue-Gray")).clipShape(RoundedRectangle(cornerRadius: 1.0))
            
            Button {
                print("e")
            } label: {
                HStack{
                    Text("Calificanos").foregroundColor(.white)
                    Spacer()
                    Text(">").foregroundColor(.white)
                }.padding()
                
                
            }.background(Color("Blue-Gray")).clipShape(RoundedRectangle(cornerRadius: 1.0))
            
            NavigationLink(isActive: $isEditProfileViewActive) {
                EditProfileView()
            } label: {
                EmptyView()
            }


        }
    }
}
