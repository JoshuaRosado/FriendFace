//
//  ContentView.swift
//  FriendFace
//
//  Created by Joshua Rosado Olivencia on 5/10/25.
//

import SwiftUI

struct ContentView: View {
    @State private var users = [User]()
    var body: some View {
        
        List(users, id: \.id) { user in
            VStack{
                Section("Name"){
                    Text(user.name)
                        .font(.headline)
                }
                Section("Status"){
                    Text(user.isActive ? "Active" : "Inactive")
                        .font(.footnote)
                }
            }
        }
        .task{
            await loadData()
            
            
            
        }

        
    }
    func loadData() async{
        guard let url = URL(string:"https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                
                let decodedUser = try JSONDecoder().decode([User].self, from: data )
                    users = decodedUser
                
            } catch {
                print("Invalid data")
            }

        }
        
    
}

#Preview {
    ContentView()
}
