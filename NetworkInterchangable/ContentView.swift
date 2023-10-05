//
//  ContentView.swift
//  NetworkInterchangable
//
//  Created by Onur Bulut on 4.10.2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var userListViewModel : UserListViewModel
    
    
    init() {
        self.userListViewModel = UserListViewModel(service: LocalService())
    }
    
    
    var body: some View {
        List(userListViewModel.userList, id: \.id){user in
            
            VStack{
                Text(user.name)
                    .font(.title3).foregroundColor(.blue)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(user.userName)
                    .font(.title3).foregroundColor(.green)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(user.email)
                    .font(.title3).foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }.task {
            await userListViewModel.downloadUsers()
        }
    }
}

#Preview {
    ContentView()
}
