//
//  PantallaAgenda.swift
//  Agenda Shufle
//
//  Created by alumno on 2/26/25.
//

import SwiftUI

enum PantallasDisponibles: String, Identifiable{
    case pantalla_agregar, pantalla_aleatorio
    
    var id: String{ rawValue }
}

struct PantallaAgenda: View {
    var ancho_de_pantalla = UIScreen.main.bounds.width
    var largo_de_pantalla = UIScreen.main.bounds.height
    
    @State var mostrar_pantalla_agregar_contacto: Bool = false
    
    @State var contactos_actuales: [ContactoAgenda] = [
        ContactoAgenda(nombre: "Astrid", telefono: "915 123 4567"),
        ContactoAgenda(nombre: "Aron", telefono: "656 123 4567"),
        ContactoAgenda(nombre: "Alo", telefono: "915 123 6456"),
        ContactoAgenda(nombre: "Ale", telefono: "656 986 4567"),
        ContactoAgenda(nombre: "Eve", telefono: "915 123 4567"),
        ContactoAgenda(nombre: "Khami", telefono: "656 123 4567"),
        ContactoAgenda(nombre: "Angel", telefono: "915 123 6456"),
        ContactoAgenda(nombre: "Wen", telefono: "656 986 4567")
    ]
    
    @State var pantalla_a_mostrar: PantallasDisponibles?
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(spacing: 10) {
                    ForEach(contactos_actuales){ contacto in
                        NavigationLink{
                            PantallaDelGanador(contacto_a_molestar: contacto, regresar: true)
                        } label : {
                            ContactoPrevista(contacto_a_mostrar: contacto)
                                .tint(Color.black)
                        }
                    }
                }
                
                .frame(alignment: Alignment.center)
                .padding(10)
            }.background(
                LinearGradient(colors: [Color.white, Color.white, Color.white, .azulFondo], startPoint: .top, endPoint: .bottom)
            )
        }
        
    
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
                pantalla_a_mostrar = PantallasDisponibles.pantalla_agregar
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
                pantalla_a_mostrar = PantallasDisponibles.pantalla_aleatorio
            }
            
            Spacer()
        }
            .sheet(item: $pantalla_a_mostrar){ pantalla in
                switch(pantalla){
                case .pantalla_agregar:
                    PantallaAgregarContacto(
                        boton_salir: {
                            pantalla_a_mostrar = nil
                    },
                    boton_agregar: {nombre, numero in
                        let contacto_nuevo = ContactoAgenda(nombre: nombre, telefono: numero)
                        contactos_actuales.append(contacto_nuevo)
                        pantalla_a_mostrar = nil
                    }
                )
                case.pantalla_aleatorio:
                    let contacto_random = Int.random(in: 0...contactos_actuales.count)
                            PantallaDelGanador(
                                contacto_a_molestar: contactos_actuales[contacto_random], regresar: true, boton_llamar: {
                                    Link("\(contactos_actuales[contacto_random].telefono)", destination: URL(string: "tel:\(contactos_actuales[contacto_random].telefono)")!)
                                }
                            )
            }
        }
    }
}

#Preview {
    PantallaAgenda()
}
