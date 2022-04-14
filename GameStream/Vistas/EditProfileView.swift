//
//  EditProfileView.swift
//  GameStream
//
//  Created by Samuel on 5/4/22.
//

import SwiftUI

struct EditProfileView: View {
    @State var nombreUsuario : String = "Lorem"
    @State var imagenPerfil : Image? = Image("image")
    @State var isCameraActive = false
    var body: some View {
        ZStack{
            Color("Color-Main").ignoresSafeArea()
            
            ScrollView{
                VStack{
                    
                    Button {
                        //
                        isCameraActive = true
                    } label: {
                        
                        ZStack {
                            imagenPerfil!.resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 118, height: 118)
                            .clipShape(Circle())
                            .sheet(isPresented: $isCameraActive) {
                                //photoLibrary
                                SUImagePickerView(sourceType: .camera, image: self.$imagenPerfil, isPresented: $isCameraActive)
                            }
                            
                            Image(systemName: "camera").foregroundColor(.white)
                        }
                    }
                    
                    Text(nombreUsuario).fontWeight(.bold)
                        .foregroundColor(.white)

                    
                }.padding(.bottom, 18.0)
                
                //Modulo Editar
                ModuloEditar()
            }
            
        }
    }
}

struct ModuloEditar: View{
    @State var correo: String = ""
    @State var contrasena: String = ""
    @State var nombre: String = ""
    var body: some View{
        VStack(alignment: .leading) {
            Text("Correo Electrónico").foregroundColor(Color("Dark-Cian"))
            ZStack(alignment: .leading){
                if correo.isEmpty{
                    Text(verbatim: "ejemplo@gmail.com").font(.caption).foregroundColor(Color("Light-Gray"))
                }
                
                TextField("", text: $correo).foregroundColor(.white)
            }
            Divider().frame(height: 1, alignment: .center).background(Color("Dark-Cian")).padding(.bottom)
            
            Text("Contraseña").foregroundColor(Color("Dark-Cian"))
            ZStack(alignment: .leading){
                if contrasena.isEmpty{
                    Text(verbatim: "*********").font(.caption).foregroundColor(Color("Light-Gray"))
                }
                
                SecureField("", text: $contrasena).foregroundColor(.white)
            }
            
            Divider().frame(height: 1, alignment: .center).background(Color("Dark-Cian")).padding(.bottom)
            
            Text("Nombre").foregroundColor(Color("Dark-Cian"))
            ZStack(alignment: .leading){
                if nombre.isEmpty{
                    Text(verbatim: "John Doe").font(.caption).foregroundColor(Color("Light-Gray"))
                }
                
                TextField("", text: $nombre).foregroundColor(.white)
            }
            Divider().frame(height: 1, alignment: .center).background(Color("Dark-Cian")).padding(.bottom, 32)
            
            
            Button {
                updateData()
            } label: {
                Text("Actualizar Datos").fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame( maxWidth: .infinity, alignment: .center)
                    .padding(EdgeInsets(top: 10, leading: 18, bottom: 10, trailing: 18))
                    .overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color("Dark-Cian"), lineWidth: 2.0).shadow(color: .white, radius: 6))
            }

            
        }.padding(.horizontal, 42.0)
    }
    
    func updateData(){
        print("Guardando informacion")
        let objetoActualizadorDatos = SaveData()
        let resultado = objetoActualizadorDatos.guardarDatos(correo: self.correo, contrasena: self.contrasena, nombre: self.nombre)
        print(resultado)
        
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
