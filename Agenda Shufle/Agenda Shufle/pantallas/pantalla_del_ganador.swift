//
//  pantalla_del_ganador.swift
//  Agenda Shufle
//
//  Created by alumno on 3/5/25.
//

import SwiftUI

var contacto_alterno = ContactoAgenda(nombre: "Nombre del contacto", telefono: "656 888 8888")

struct PantallaDelGanador: View {
    var contacto_a_molestar: ContactoAgenda
    
    var regresar: Bool
    var en_tap: () -> Void = {}
    
    var boton_mensaje: ( ) -> Void = {
        print("Parece que te has equivocado")
    }
    
    var boton_llamar: () -> Void = {
        print("Parece que te has equivocado")
    }
    
    var body: some View {
        HStack(alignment: VerticalAlignment.top){
                    icono(tamaño: 20, ruta_icono: "chevron.left", padding: 0)
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                    Text("Back")
                        .foregroundColor(Color.blue)
            
            Spacer()
                }.padding(10)
            
            Spacer()
            
            ZStack{
                Circle()
                    .stroke(
                        LinearGradient(colors: [Color.white, Color.teal], startPoint: .top, endPoint: .bottom), lineWidth: 8
                    )
                    .fill(
                        LinearGradient(colors: [Color.teal, Color.blue], startPoint: .top, endPoint: .bottom)
                    )
                    .frame(width: 200)
                    .padding(10)
                icono(tamaño: 100, ruta_icono: "person.fill", padding: 15)
                    .foregroundColor(.white)
            }
            Text(contacto_a_molestar.nombre)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            Text(contacto_a_molestar.telefono)
            
            HStack(alignment: VerticalAlignment.center){
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
                        .frame(width: 70)
                    icono(tamaño: 30, ruta_icono: "phone.fill", padding: 10)
                        .foregroundColor(Color.white)
                }.padding(20)
                    .onTapGesture {
                        boton_llamar()
                    }
                
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
                        .frame(width: 70)
                    icono(tamaño: 30, ruta_icono: "message.fill", padding: 10)
                        .onTapGesture {
                            boton_mensaje()
                        }
                        .foregroundColor(Color.white)
                }
                
                Spacer()
            }
            Spacer()
            Spacer()
        }
    }

#Preview {
    PantallaDelGanador(contacto_a_molestar: contacto_alterno, regresar: true)
}
