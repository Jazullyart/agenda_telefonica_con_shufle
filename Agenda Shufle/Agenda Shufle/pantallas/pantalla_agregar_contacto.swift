//
//  pantalla_agregar_contacto.swift
//  Agenda Shufle
//
//  Created by alumno on 3/3/25.
//

import SwiftUI

struct PantallaAgregarContacto: View {
    @State private var nombre: String = ""
    @State private var numero_telefonico: String = ""
    
    var boton_salir: ( ) -> Void = {
        print("Parece que te has equivocado")
    }
    var boton_agregar: (_ nombre: String, _ numero: String) -> Void = {nombre, numero in
        print("Parece que te has equivocado")
    }
    
    var body: some View {
        Text("Nombre del contacto")
            .font(.title2)
            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
        ZStack{
            TextField("Nombre", text: $nombre)
                .frame(height: 35)
                .padding(15)
            
                .overlay(
                    RoundedRectangle(cornerRadius: 55)
                        .stroke(LinearGradient(colors: [Color.blue, Color.teal, Color.blue], startPoint: .leading, endPoint: .trailing))
                )
            
        }.padding(10)
        
        Text("Número telefónico del contacto")
            .font(.title2)
            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
        ZStack{
            TextField("Número de celular", text: $numero_telefonico)
                .frame(height: 35)
                .padding(15)
                .overlay(
                    RoundedRectangle(cornerRadius: 55)
                        .stroke(LinearGradient(colors: [Color.blue, Color.teal, Color.blue], startPoint: .leading, endPoint: .trailing))
                )
        }.padding(10)
        
        
        HStack{
            Spacer()
            //Icono para agregar contacto
            ZStack{
                Circle()
                    .stroke(
                        LinearGradient(colors: [Color.white, Color.teal], startPoint: .top, endPoint: .bottom), lineWidth: 8
                    )
                    .fill(
                        LinearGradient(colors: [Color.teal, Color.blue], startPoint: .top, endPoint: .bottom)
                    )
                    .frame(width: 90)
                icono(tamaño: 50, ruta_icono: "person.crop.circle.badge.plus", padding: 10)
                    .onTapGesture {
                        boton_agregar(nombre, numero_telefonico)
                    }
                    .foregroundColor(Color.white)
            }.padding(20)
            
            Spacer()
            //Icono para regres
            ZStack{
                Circle()
                    .stroke(
                        LinearGradient(colors: [Color.white, Color.teal], startPoint: .top, endPoint: .bottom), lineWidth: 8
                    )
                    .fill(
                        LinearGradient(colors: [Color.teal, Color.blue], startPoint: .top, endPoint: .bottom)
                    )
                    .frame(width: 90)
                icono(tamaño: 40, ruta_icono: "return", padding: 10)
                    .onTapGesture {
                        boton_salir()
                    }
                    .foregroundColor(Color.white)
            }
            
            
            Spacer()
        }
    }
}

#Preview {
    PantallaAgregarContacto()
}
