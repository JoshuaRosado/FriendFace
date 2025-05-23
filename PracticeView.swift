//
//  PracticeView.swift
//  FriendFace
//
//  Created by Joshua Rosado Olivencia on 5/21/25.
//

import SwiftUI
import Foundation

struct Artist: Codable, Identifiable,Hashable {
    
    var trackID: Int
    var trackName: String
    var collectionName: String
    
    var id: Int { trackID}
    
}

struct SearchResult: Codable {
    var results : [Artist]
}

struct PracticeView: View {
    @State private var users = [User]()
    @State private var artists = [Artist]()
    var body: some View {
        List(artists, id: \.trackID){ artist in
            VStack{
                Text("\(artist.trackID)")
                
                HStack{
                    Text("\(artist.trackName)")
                    Text(artist.trackID, format: .number)
                }
                
            }
        }
        .task {
            await loadData()
        }

    }
    func loadData() async{
        
        // Verify if URL is valid
        
        guard let url = URL(string: "https://itunes.apple.com/search?term=bad+bunny&entity=song") else {
            print("Invalid URL")
            return
        }
        
        do{
            // try waiting if the data loads up
            
            let (data, _) = try await URLSession.shared.data(from: url)
            
            // create decoder
            // decode date type using dateDecodingStrategy
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            
            let decodedData = try decoder.decode(SearchResult.self, from: data)
            
            artists = decodedData.results
            
            
            
        }
        catch{
            print("Invalid Data")
        }
        
        
    }
}

#Preview {
    PracticeView()
}
