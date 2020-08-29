//
//  UserDetailView.swift
//  Friends
//
//  Created by Chloe Fermanis on 28/8/20.
//  Copyright © 2020 Chloe Fermanis. All rights reserved.
//

import SwiftUI

struct UserDetailView: View {
    
    let user: User
                    
    var body: some View {
        
        GeometryReader { geometry in
            
            ScrollView(.vertical) {
                  
                VStack {
               
                    Image(systemName: "person.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width * 0.7)
                        .frame(height: geometry.size.height * 0.3)
                        .foregroundColor(.gray)
                        .padding(.top)
                
                    HStack {
                        Image(systemName: (self.user.isActive ? "checkmark.circle.fill" : "xmark.circle.fill"))
                            .foregroundColor(self.user.isActive ? .green : .red)
                        Text(self.user.name)
                            .font(.title)
                            .fontWeight(.thin)
                            .padding(.top)
                        }
                    
                    HStack {
                        Text("\(self.user.company.uppercased()) ")
                            .foregroundColor(.gray)

                        Image(systemName: "envelope")
                            .foregroundColor(.orange)
                        
                        Text(self.user.email)
                            .fontWeight(.thin)
                    }.padding(.all)
                   
                    
                    HStack {
                        ForEach(0 ..< self.user.tags.count) {
                            Text(self.user.tags[$0])
                                .lineLimit(1)
                                .font(.caption)
                                .padding(5)
                                .background(Color.orange)
                                .clipShape(Capsule())
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.all)
                    
                    Text(self.user.about)
                        .fontWeight(.thin)
                        .padding(.all)
                      
                    HStack {
                        
                        Image(systemName: "house").foregroundColor(Color.orange)
                            .font(.system(size: 30))
                        VStack(alignment: .leading) {
                            Text(" \(self.user.formatAddress[0]), \(self.user.formatAddress[1]) ")
                                .fontWeight(.thin)
                            Text("\(self.user.formatAddress[2]), \(self.user.formatAddress[3]) ")
                                .fontWeight(.thin)
                        }
                    }
                    .padding(.bottom)
                    
                    Text("FRIENDS (\(self.user.friends.count))")
                        .foregroundColor(.orange)
                    
                    List(self.user.friends, id: \.id) { friend in
                        NavigationLink(destination: UserDetailView(user: self.findFriend(friend: friend))) {
                            HStack {
                                //Image(systemName: "person.crop.square").foregroundColor(.gray)
                                
                                Image(systemName: self.findFriend(friend: friend).isActive ? "person.crop.circle.badge.checkmark" : "person.crop.circle.badge.xmark")
                                    .foregroundColor(self.findFriend(friend: friend).isActive ? .green : .red)
                                
                                Text("\(friend.name), ").foregroundColor(.gray)
                                    .fontWeight(.bold)

                                Text(self.findFriend(friend: friend).company).fontWeight(.thin)
                            }

                        }
                    }
                    .padding(.bottom)
                    
                }
            }
        }
    }
    
    func findFriend(friend: Friend) -> User {
        let users: [User] = Bundle.main.decode("users.json")
        
        let match = users.first(where: { $0.id == friend.id })
        return match!
    }
    
}


struct UserDetailView_Previews: PreviewProvider {
    
    static let users: [User] = Bundle.main.decode("users.json")
    
    static var previews: some View {
        
        UserDetailView(user: users[0])
    }
}
