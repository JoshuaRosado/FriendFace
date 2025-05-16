//
//  PracticeView.swift
//  FriendFace
//
//  Created by Joshua Rosado Olivencia on 5/16/25.
//

import SwiftUI

struct PracticeView: View {
    //create an empty array that accepts User objects
    @State private var users = [User]()
    var body: some View {
        List(users){ user in
            HStack{
                Text("\(user.name)")
                    .font(.headline)
                Spacer()
                VStack{
                    Text("\(user.age)")
                    Text(user.registered, format: .dateTime)
                }
            }
        }
        // Do a task
        .task{
            await loadData()
        }
        
        // Wait for func to load but don't stop everything else
        
        
        
    }
    // Create a func to be use in the task
    func loadData() async {
        
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        
        do{
            
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            let decodedData = try decoder.decode([User].self, from: data)
            
            users.insert(contentsOf: decodedData, at: 0)
            
        }
        catch{
            print("Invalid Data")
        }
    }
    // make sure to tell SwiftUI that the func might take a while to load
    
    
    // Check if URL is valid
    
    //do block
    
    // try to wait for the data to load
    
    // make our decoder
    // and add the date using dateDecodingStrategy
    
    // try creating a User from data
    
    // add the user created to our  [Users]()
}

#Preview {
    PracticeView()
}
