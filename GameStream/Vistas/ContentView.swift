//
//  ContentView.swift
//  GameStream
//
//  Created by Samuel on 16/3/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack{
                Spacer()
                Color(red: 19/255, green: 30.0/255, blue: 53.0/255, opacity: 1.0).ignoresSafeArea()
                VStack{
                    Image("AppLogo").resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 250, alignment: .center).padding(.bottom,45)
                    //contenedor 1
                    InicioYRegistroView()
                }
            }.navigationBarHidden(true)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        Image("Pantalla01").resizable()
        ContentView()
        
        
    }
}

struct InicioYRegistroView: View{
    @State var tipoInicioSesion : Bool = true
    var body: some View{
        VStack{
            HStack {
                
                Spacer()
                Button {
                    tipoInicioSesion = true
                } label: {
                    Text("INICIA SESIÓN")
                }.foregroundColor(tipoInicioSesion ? .white : .gray)
                
                Spacer()
                
                Button {
                    tipoInicioSesion = false
                } label: {
                    Text("REGÍSTRATE")
                }.foregroundColor(!tipoInicioSesion ? .white : .gray)
                Spacer()
            }
            
            Spacer(minLength: 45)
            
            if tipoInicioSesion == true{
                InicioSesionView()
            }else{
                RegistroView()
            }
            Spacer()
        }
    }
}

struct InicioSesionView: View{
    @State var correo: String = ""
    @State var contrasena: String = ""
    @State var isPantallaHomeActive = false
    var body: some View{
        ScrollView {
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
                
                Text(verbatim: "¿Olvidaste tu Contraseña?").font(.footnote)
                    .frame(width:300, alignment: .trailing)
                    .foregroundColor(Color("Dark-Cian"))
                    .padding(.bottom)
                
                Button {
                    iniciarSesion()
                } label: {
                    Text("INICIAR SESIÓN").fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame( maxWidth: .infinity, alignment: .center)
                        .padding(EdgeInsets(top: 10, leading: 18, bottom: 10, trailing: 18))
                        .overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color("Dark-Cian"), lineWidth: 2.0).shadow(color: .white, radius: 6))
                }

                Text("Inicia Sesión con redes sociales")
                    .foregroundColor(.white)
                    .padding(.top,40)
                
                HStack{
                    Button {
                        print("Facebook")
                    } label: {
                        Text("Facebook").fontWeight(.bold)
                            .foregroundColor(.white)
                            
                    }
                    Button {
                        print("Twitter")
                    } label: {
                        Text("Twitter").fontWeight(.bold)
                            .foregroundColor(.white)
                            
                    }
                }
                
                
            }.padding(.horizontal, 77.0)
        
            NavigationLink(isActive: $isPantallaHomeActive) {
                Home()
            } label: {
                EmptyView()
            }

        }
    }
    
    func iniciarSesion(){
        isPantallaHomeActive = true
    }
}



struct RegistroView: View{
    @State var correo: String = ""
    @State var contrasena: String = ""
    @State var confirmarContrasena: String = ""
    var body: some View{
        ScrollView {
            
            //cabecera
            VStack(alignment: .center){
                Text("Elije una foto de perfil").fontWeight(.bold)
                    .foregroundColor(.white)
                Text("Puedes cambiar o elegirla mas adelante").font(.footnote)
                    .fontWeight(.light)
                    .foregroundColor(Color("Light-Gray"))
                    .padding(.bottom)
                
                Button {
                    tomarfoto()
                } label: {
                    ZStack {
                        Image("image").resizable().aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80)
                            .cornerRadius(40)
                        Image(systemName: "camera").foregroundColor(.white)
                    }
                }.padding(.bottom)

            }
            
            //la misma parte que se repite
            VStack(alignment: .leading) {
                VStack{
                Text("Correo Electrónico *").foregroundColor(Color("Dark-Cian"))
                        .frame(width: 300, alignment: .leading)
                ZStack(alignment: .leading){
                    if correo.isEmpty{
                        Text(verbatim: "ejemplo@gmail.com").font(.caption).foregroundColor(Color("Light-Gray"))
                    }
                    
                    TextField("", text: $correo)
                }
                Divider().frame(height: 1, alignment: .center).background(Color("Dark-Cian")).padding(.bottom)
                
                Text("Contraseña *").foregroundColor(Color("Dark-Cian"))
                ZStack(alignment: .leading){
                    if contrasena.isEmpty{
                        Text(verbatim: "*********").font(.caption).foregroundColor(Color("Light-Gray"))
                    }
                
                    SecureField("", text: $contrasena)
                }
                Divider().frame(height: 1, alignment: .center).background(Color("Dark-Cian")).padding(.bottom)
                
                Text("Confirmar Contraseña *").foregroundColor(Color("Dark-Cian"))
                ZStack(alignment: .leading){
                    if contrasena.isEmpty{
                        Text(verbatim: "*********").font(.caption).foregroundColor(Color("Light-Gray"))
                    }
                    
                    SecureField("", text: $confirmarContrasena)
                }
                
                Divider().frame(height: 1, alignment: .center).background(Color("Dark-Cian")).padding(.bottom)
                
            
            }
            
            VStack(alignment: .leading){
                
                Button {
                    registrate()
                } label: {
                    Text("REGÍSTRATE").fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame( maxWidth: .infinity, alignment: .center)
                        .padding(EdgeInsets(top: 10, leading: 18, bottom: 10, trailing: 18))
                        .overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color("Dark-Cian"), lineWidth: 2.0).shadow(color: .white, radius: 6))
                }

                Text("Inicia Sesión con redes sociales")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.top,40)
                
                HStack{
                    Button {
                        print("Facebook")
                    } label: {
                        Text("Facebook").fontWeight(.bold)
                            .foregroundColor(.white)
                            .font(.subheadline)
                            .padding(.vertical, 3.0)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .background(Color("Blue-Gray"))
                            .clipShape(RoundedRectangle(cornerRadius: 4.0))
                            
                    }.padding()
                    Button {
                        print("Twitter")
                    } label: {
                        Text("Twitter").fontWeight(.bold)
                            .foregroundColor(.white)
                            .font(.subheadline)
                            .padding(.vertical, 3.0)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .background(Color("Blue-Gray"))
                            .clipShape(RoundedRectangle(cornerRadius: 4.0))
                            
                    }.padding()
                }
            }
                
            }.padding(.horizontal, 77.0)
        }
    }
}

func tomarfoto(){
    print("tomar foto")
}

func registrate(){
    print("te regitraste")
}


