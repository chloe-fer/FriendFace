//
//  ContentView.swift
//  Friends
//
//  Created by Chloe Fermanis on 28/8/20.
//  Copyright © 2020 Chloe Fermanis. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let users: [User] = Bundle.main.decode("users.json")
    
    var body: some View {
        
        NavigationView {
            List(users) { user in
                NavigationLink(destination: UserDetailView(user: user)) {
                    
                    HStack {
                        
                        Image(systemName: "person.crop.circle")
                            .foregroundColor(user.isActive ? .green : .red)
                            .font(.system(size: 30))
                        VStack(alignment: .leading) {
                            Text(user.name)
                                .font(.title)
                                .fontWeight(.thin)
                            Text("\(user.company), \(user.friends.count) Friends")
                                .fontWeight(.thin)
                        }
                    }
                }
                
            }
            .navigationBarTitle("Contacts", displayMode: .inline)
            
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
