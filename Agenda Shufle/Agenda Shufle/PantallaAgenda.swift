//
//  PantallaAgenda.swift
//  Agenda Shufle
//
//  Created by alumno on 2/26/25.
//

import SwiftUI

let contactos = [
    ContactoAgenda(nombre: "Juan", telefono: "656 123 4567"),
    ContactoAgenda(nombre: "Pablo", telefono: "656 123 4568"),
    ContactoAgenda(nombre: "Astrid", telefono: "915 123 4569"),
    ContactoAgenda(nombre: "Aron", telefono: "656 123 4570"),
    ContactoAgenda(nombre: "Juan", telefono: "656 123 4567"),
    ContactoAgenda(nombre: "Pablo", telefono: "656 123 4568"),
    ContactoAgenda(nombre: "Astrid", telefono: "656 123 4569"),
    ContactoAgenda(nombre: "Aron", telefono: "656 123 4570"),
    ContactoAgenda(nombre: "Juan", telefono: "656 123 4567"),
    ContactoAgenda(nombre: "Pablo", telefono: "656 123 4568"),
    ContactoAgenda(nombre: "Astrid", telefono: "656 123 4569"),
    ContactoAgenda(nombre: "Aron", telefono: "656 123 4570")
]

struct PantallaAgenda: View {
    var ancho_de_pantalla = UIScreen.main.bounds.width
    var largo_de_pantalla = UIScreen.main.bounds.height
    
    @State var mostrar_pantalla_agregar_contacto: Bool = false
    @State var contactos_actuales: [ContactoAgenda] = [
        ContactoAgenda(nombre: "Astrid", telefono: "String"),
        ContactoAgenda(nombre: "Astrid", telefono: "String"),
        ContactoAgenda(nombre: "Astrid", telefono: "String"),
        ContactoAgenda(nombre: "Astrid", telefono: "String"),
        ContactoAgenda(nombre: "Astrid", telefono: "String"),
        ContactoAgenda(nombre: "Astrid", telefono: "String")
    ]
    
    var body: some View {
        ScrollView{
            VStack(spacing: 10) {
                ForEach(contactos_actuales){ contacto in
                    //Text("\(contacto.nombre)")
                    ContactoPrevista(contacto_a_mostrar: contacto, al_pulsar: {print("Te envia saludos \(contacto.nombre) desde la página agenda")})
                }
            }
            
            .frame(alignment: Alignment.center)
            .padding(10)
        }.background(
            LinearGradient(colors: [Color.white, Color.blue], startPoint: .top, endPoint: .bottom)
        )
        
        HStack(alignment: VerticalAlignment.center, spacing: 25){
            Spacer()
            ZStack{
                Circle()
                    .stroke(
                    LinearGradient(colors: [Color.white, Color.teal], startPoint: .top, endPoint: .bottom), lineWidth: 8
                )
                    .fill(
                        LinearGradient(colors: [Color.teal, Color.blue], startPoint: .top, endPoint: .bottom)
                    )
                    .frame(width: 80)
                icono(tamaño: 25, ruta_icono: "plus", padding: 5)
                    .foregroundColor(Color.white)
            }
            .padding(15)
            .onTapGesture {
                print("Lanzar un intent para iniciar la llamada")
                mostrar_pantalla_agregar_contacto.toggle()
            }
            
            Spacer()
            
            ZStack{
                Circle()
                    .stroke(
                        LinearGradient(colors: [Color.white, Color.teal], startPoint: .top, endPoint: .bottom), lineWidth: 8
                    )
                    .fill(
                        LinearGradient(colors: [Color.teal, Color.blue], startPoint: .top, endPoint: .bottom)
                    )
                    .frame(width: 80)
                icono(tamaño: 35, ruta_icono: "shuffle", padding: 5)
                    .foregroundColor(Color.white)
            }
            .padding(15)
            .onTapGesture {
                print("Falta Implementar esta parte")
            }
            
            Spacer()
        }
            .sheet(isPresented: $mostrar_pantalla_agregar_contacto){
                PantallaAgregarContacto(boton_salir: {
                    mostrar_pantalla_agregar_contacto.toggle()
                },
                boton_agregar: {nombre, numero in
                    let contacto_nuevo = ContactoAgenda(nombre: nombre, telefono: numero)
                    contactos_actuales.append(contacto_nuevo)
                    mostrar_pantalla_agregar_contacto.toggle()
                })
            }
            //.sheet(item: <#T##Binding<Identifiable?>#>, content: <#T##(Identifiable) -> View#>)
        
        
    }
}

#Preview {
    PantallaAgenda()
}
