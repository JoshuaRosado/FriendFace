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
                .font(.headline)
                .padding(.bottom, 50)
            ZStack{
                RoundedRectangle(cornerRadius: 20.0)
                    .opacity(0.03)
                
                
                VStack(alignment: .leading){
                    Text("ID: \(user.id)")
                    
                    Text("Age: \(user.age)")
                    
                    Text("Email: \(user.email)")
                    
                    Text("Status: \(user.isActive ? "Active" : "Inactive")")
                    
                    Text("Address: \(user.address)")
                    
                    Text("About: \(user.about)")
                    
                    Text("Company: \(user.company)")
                    
                    Text("Registered date: \(user.registered, format: .dateTime)")
                    
                    Text("Tags : \(user.tags)")
                    
                    Text("Friends: \(user.friends)")
                    
                }
                .font(.callout)
                .frame(width: 300, alignment: .leading)
            }
            .frame(height: 500)
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
