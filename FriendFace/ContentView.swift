//
//  ContentView.swift
//  FriendFace
//
//  Created by Joshua Rosado Olivencia on 5/10/25.
//



//            async = “This takes time, don’t freeze everything else.”
//            await = “Pause here until this part is done.”


//            async = This function might take some time, like                  cooking or downloading.

//            await = Wait for something to finish, but don’t               stop everything while we wait.
import Foundation
import SwiftUI

struct ContentView: View {
    @State private var users = [User]()
    
    var body: some View {
        // Display a list of an array of users, using ids
        NavigationStack{
            List(users, id: \.id) { user in // a user coming in (each one with a unque ID
                NavigationLink(value: user){
                    HStack{
                        Text("\(user.name)")
                        Spacer()
                        Text(user.isActive ? "🟢" : "🔴")
                        
                    }
                    
                }
            }
            .navigationDestination(for: User.self){
                selection in
                DetailView(user: selection)
                
            }
            .navigationTitle("User Info")
            .navigationBarTitleDisplayMode(.inline)
        }
        
        
        
        .task{
            // Here's a task to do when App is open
            // wait until data is loaded but don't freeze the app while we wait
            await loadData()
            
            
        }
        
    }
    
    
    func loadData() async { // this takes time, don't freeze everything else
        
        
        // Check if URL is valid
        
        // guard = be carefull
        
        guard let url = URL(string:"https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        do {
            
            // try waiting for the data to download
            let (data, _) = try await URLSession.shared.data(from: url)
            
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            // turn data into a User object
            let decodedUser = try decoder.decode([User].self, from: data )
            // add new User object to array
            users = decodedUser
            
            
            
        } catch {
            // if anything goes wrong
            print("Invalid data")
        }
        
    }
}

#Preview {
    ContentView()
}
