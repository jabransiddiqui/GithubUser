//
//  UsersViewModel.swift
//  GithubUser
//
//  Created by Jabran Siddiqui on 17/11/2023.
//

import Foundation
import Combine
import SwiftUI

class UsersViewModel: ObservableObject {
    
    // MARK: - Published properties
    @Published private(set) var state = PageState.idle
    @Published private(set) var isAll = true
    
    // MARK: - Properties
    enum PageState {
        case idle
        case loading
        case noResult
        case failed(AppErrors)
        case loaded
    }
    private var userList : GithubUsers = []
    private var favoriteList : GithubUsers = []
    private var cancellable = Set<AnyCancellable>()
    private var userRepo: UserRepositoryProtocol //User Repo
    
    // MARK: - Init
    init(userRepo: UserRepositoryProtocol = UserRepository(database: UserDbService(database: RealmDatabaseContextManager()), client: UserServiceClient())) {
        self.userRepo = userRepo
        self.getDbUser()
    }
   
    
    // MARK: - User Actions
    
    // MARK: - Remote API
    func getUsers() {
        self.userList = []
        self.state = .loading
        userRepo.getUsers()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: {
                [weak self] completion in
                switch completion {
                case .failure(let error):
                    guard let apiError = error as? AppErrors else{
                        self?.state = .failed(AppErrors.other(error))
                        return
                    }
                    self?.state = .failed(apiError)
                case .finished:
                    break
                }
                
            }, receiveValue: {[weak self] data in
                self?.userList = data
                self?.state = .loaded
            }).store(in: &cancellable)
    }
    
    // MARK: - Database/Favorite User
    func getDbUser(){
        do{
            self.favoriteList.removeAll()
            self.state = .loading
            if let dbUsers = try userRepo.getDBUsers(), dbUsers.count > 0{
                self.favoriteList = dbUsers
                self.state = .loaded
            }else{
                self.state = .noResult
            }
        }catch let error{
            self.state = .failed(AppErrors.other(error))
        }
    }

    // MARK: - Favorite Action
    func onFavoriteBtnTap(user: GithubUser) {
        do{
            self.state = .loading
            
            if(self.isFavorite(user: user) == true){
                guard let index = getFavIndex(user: user) else{
                    self.state = .loaded
                    return
                }
                try self.userRepo.deleteUser(user: favoriteList[index])
                self.favoriteList.remove(at: index)
                if(userList.isEmpty){
                    self.state = .noResult
                }else{
                    self.state = .loaded
                }
            }else{
                guard let index = getUserIndex(user: user) else{
                    self.state = .loaded
                    return
                }
                self.userList[index].isFavorite = true
                try self.userRepo.saveUser(user: self.userList[index])
                getDbUser()
            }
        }catch{
            self.state = .noResult
        }
        
    }
    
    // MARK: - Switch btw Favorite/All
    func filterBtnTap(isAll : Bool) {
        self.isAll = isAll
        if(isAll){
            getUsers()
        }else{
            getDbUser()
        }
    }
    
    // MARK: - Check isFavorite
    // Check isFavorite for  start icon
    func isFavorite(user: GithubUser) -> Bool{
        return favoriteList.contains(where: {$0.id == user.id})
    }
    
    // MARK: - Get Favorite List select index
    func getFavIndex(user: GithubUser) -> Int?{
        return favoriteList.firstIndex(where: {$0.id == user.id})
    }
    // MARK: - Get all user List select index
    func getUserIndex(user: GithubUser) -> Int?{
        return userList.firstIndex(where: {$0.id == user.id})
    }
    // MARK: - Get List for display
    func getUserList() -> GithubUsers{
        return isAll ? self.userList : self.favoriteList 
    }
    
    // MARK: - Dispose
    func dispose() {
        self.cancellable.forEach { object in
            object.cancel()
        }
        self.cancellable = []
    }
}
