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
        }
        
        HStack(alignment: VerticalAlignment.center, spacing: 25){
            ZStack{
                Circle()
                    .frame(width: 80)
                    .foregroundColor(Color.white)
                Image(systemName: "plus")
                    .tint(Color.white)
            }
            .padding(15)
            .onTapGesture {
                print("Lanzar un intent para iniciar la llamada")
                mostrar_pantalla_agregar_contacto.toggle()
            }
            
            Spacer()
            
            ZStack{
                Circle()
                    .frame(width: 80)
                    .foregroundColor(Color.white)
                Image(systemName: "shuffle")
                    .tint(Color.white)
            }
            .padding(15)
            .onTapGesture {
                print("Falta Implementar esta parte")
            }
        }.background(Color.teal)
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
    }
}

#Preview {
    PantallaAgenda()
}
