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
    // users is an empty array of User
    @State private var users = [User]()
    
    var body: some View {
        // Display a list of an array of users, using ids
        NavigationStack{
            List(users, id: \.id) { user in // a user coming in (each one with a unique ID)
                
                // Using user as value for each NavigationLink
                NavigationLink(value: user){
                    HStack{
                        // diplay name of user
                        Text("\(user.name)")
                        Spacer()
                        // if user is active "green" else "red"
                        Text(user.isActive ? "🟢" : "🔴")
                        
                    }
                    
                }
            }
            // Destinations for "Each User"
            .navigationDestination(for: User.self){
                // for each selection/user
                selection in
                // display DetailView using the data from that user selected
                DetailView(user: selection)
                
            }
            .navigationTitle("User Info")
            .navigationBarTitleDisplayMode(.inline)
        }
        
        .task{
            // Here's a task to do when App is open
            // wait until data is loaded but don't freeze the app while we "wait"
            await loadData()
            
        }
    }
    
    // Create a function of loading data and specify that is async. Go to sleep/ waiting but not stopping everything else.
    func loadData() async { // this takes time, don't freeze everything else
        
        
        // Check if URL is valid else "Invalid URL"
        // guard = be careful
        
        guard let url =
                
            URL(string:"https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        do {
            
            // try waiting for the data to download
            // function returns a tuple:(Data, URLResponse)
            // we only need Data. Ignore URLResponse
            let (data, _) = try await  URLSession.shared.data(from: url)
            
            
            // Create a new decoder instance
            let decoder = JSONDecoder()
            
            //Tell the decoder to expect ISO 8601 date strings
            // Type of date used in this Data
            // Handle this type of Dates using dateDecodingStrategy
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
