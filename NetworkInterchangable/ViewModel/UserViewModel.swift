//
//  UserViewModel.swift
//  NetworkInterchangable
//
//  Created by Onur Bulut on 4.10.2023.
//

import Foundation


class UserListViewModel: ObservableObject {
    
    
    @Published var userList = [UserViewModel]()
    
   // let webService = WebService()
    
    private var service : NetworkService
    
    init(service: NetworkService){
        self.service = service
    }
    
    
    
    
    func downloadUsers () async {
        var resource = ""
        if service.type == "WebService"{
            resource = Constants.Urls.usersExtension
        }else{
            resource = Constants.Paths.baseUrl
        }
        
        do{
            let users = try await service.download(resource)
            
            DispatchQueue.main.async {
                self.userList = users.map(UserViewModel.init)
            }
        }catch{
            print(error)
        }
        
   
    }
}




struct UserViewModel{
    
    
    let user : User
    
    var id : Int {
        user.id
    }
    
    var name : String{
        user.name
    }
    
    var userName : String{
        user.username
    }
    
    var email : String {
        user.email
    }
}
