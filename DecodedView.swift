//
//  DecodedView.swift
//  FriendFace
//
//  Created by Joshua Rosado Olivencia on 5/15/25.
//

import SwiftUI

struct DecodedView: View {
    // Empty array of users
    // Here is where the data is going to be generated after fetching it from the internet and be decoded
    @State private var users = [User]()
    
    var body: some View {
        // Display a list of users, each user represented using it's own id
        
        List(users){ user in // passing one user
            HStack{
                
                Text("\(user.name)")
                Spacer()
                VStack{
                    Text(user.registered, format: .dateTime)
                    Text("\(user.age)")
                }
                
            }
            
        }
        .task {
            // do this task
            // wait for this function to work
            await loadData()
        }
    }
    func loadData() async { // this function will take some time, continue doing other stuff in the mean time
        
        // check if URL is valid
        guard let url = URL( string:"https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid Url")
            return
        }
        do{
            // try to wait for the data to load
            let (data, _) = try await URLSession.shared.data(from: url)
            
            // make our decoder
            // and add the date using dateDecodingStrategy
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            // try creating a User from data
            let decodedData = try decoder.decode([User].self,from: data)
            // add the user created to our  [Users]()
            users = decodedData
        }
        catch{
            print("\(error.localizedDescription)")
        }
        
        
    }
}

#Preview {
    DecodedView()
}
