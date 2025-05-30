//
//  DetailView.swift
//  FriendFace
//
//  Created by Joshua Rosado Olivencia on 5/19/25.
//

import SwiftUI

struct DetailView: View {
    var user : User
    var body: some View {
        
        
        VStack{
            
            Text("\(user.name)")
                .font(.system(size: 24, weight: .medium))
                .padding(.bottom, 15)
                .padding(.top)
            ZStack{
                RoundedRectangle(cornerRadius: 20.0)
                    .opacity(0.03)
                
                
                VStack(alignment: .leading, spacing: 10){
                    Text("ID: \(user.id)")
                    
                    Text("Age: \(user.age)")
                    
                    Text("Email: \(user.email)")
                    
                    Text("Status: \(user.isActive ? "Active" : "Inactive")")
                    
                    Text("Address: \(user.address)")
                    
                    Text("About: \(user.about)")
                    
                    Text("Company: \(user.company)")
                    
                    Text("Registered date: \(user.registered, format: .dateTime)")
                    
                    Text("Tags : \(user.tags)")
                    
                    // Need to extract name from the Array to be able to display it. 
                    Text("Friends: \(user.friends.map(\.name))")
                    
                }
                .font(.subheadline)
                .frame(width: 325, alignment: .leading)
                .padding()
            }
            .frame(height: 600)
            .padding()
            .padding(.bottom,50)
            
            
        }
        
    }
}


#Preview {
    let user = User(id: "5", isActive: false, name: "Khai", age: 1, company: "Apple", email: "khai@gmail.com", address: "123 Sesame Street", about: "A working person", registered: .now, tags: ["irure",
                                                                                                                                                                                                   "labore",
                                                                                                                                                                                                   "et",
                                                                                                                                                                                                   "sint",
                                                                                                                                                                                                   "velit",
                                                                                                                                                                                                   "mollit",
                                                                                                                                                                                                   "et"],
                    friends: [Friend(id: "123", name: "Leya")])
    DetailView(user: user )
}
