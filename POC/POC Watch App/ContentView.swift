//
//  ContentView.swift
//  POC Watch App
//
//  Created by Ana Raiany Guimarães Gomes on 2023-06-12.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    @State private var progress: Float = 0.5 // Valor do progresso
    
    var body: some View {
        VStack {
            Image("Mike1")
                .resizable()
                .imageScale(.large)
                .frame(width: 80.0, height: 80.0)
            
            Text("Hello, Mike!")
            
            ProgressView(value: progress) // ProgressView para exibir o progresso
            
            Button(action: {
                // Aumenta o valor do progresso para demonstrar a animação do ProgressView
                withAnimation {
                    progress += 0.1
                }
                
                createNotification() // Cria a notificação quando o botão é pressionado
            }) {
                Text("Aumentar Progresso")
                    .padding()
                    .foregroundColor(.white)
                    .background(.blue)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
    
    func createNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Título da Notificação"
        content.body = "Corpo da notificação"
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Erro ao criar a notificação: \(error.localizedDescription)")
            } else {
                print("Notificação criada com sucesso!")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
