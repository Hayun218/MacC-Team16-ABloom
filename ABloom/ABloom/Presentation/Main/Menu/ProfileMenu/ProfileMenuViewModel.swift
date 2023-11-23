//
//  ProfileMenuViewModel.swift
//  ABloom
//
//  Created by 정승균 on 11/20/23.
//

import Combine
import Foundation

@MainActor
final class ProfileMenuViewModel: ObservableObject {
  @Published var currentUser: DBUser?
  @Published var fianceUser: DBUser?
  @Published var marriageStatus: MarriageStatus?
  
  @Published var showActionSheet = false
  @Published var showNameChangeAlert = false
  @Published var showCalendarSheet = false
  
  @Published var nameChangeTextfield = ""
  @Published var marriageDate: Date = Date()
  
  private var cancellables = Set<AnyCancellable>()
  
  init() {
    getUsers()
    updateDayStatus()
  }
  
  func getUsers() {
//    self.currentUser = UserManager.shared.currentUser
//    self.fianceUser = UserManager.shared.fianceUser
    
    UserManager.shared.$currentUser
      .sink { [weak self] user in
        self?.currentUser = user
      }
      .store(in: &cancellables)
    
    UserManager.shared.$fianceUser
      .sink { [weak self] user in
        self?.fianceUser = user
      }
      .store(in: &cancellables)
  }
  
  func renewInfo() async throws {
    try? await UserManager.shared.fetchCurrentUser()
    getUsers()
  }
  
  func signOut() throws {
    try AuthenticationManager.shared.signOut()
  }
  
  func updateMyName() throws {
    guard let myId = currentUser?.userId else { return }
    try UserManager.shared.updateUserName(userId: myId, name: nameChangeTextfield)
  }
  
  func updateMyMarriageDate() throws {
    guard let myId = currentUser?.userId else { return }
    try UserManager.shared.updateMarriageDate(userId: myId, date: marriageDate)
  }
  
  private func updateDayStatus() {
    guard let marriageDate = currentUser?.marriageDate else { return }
    
    let dDay = Date().calculateDDay(with: marriageDate)
    
    if dDay <= 0 {
      marriageStatus = .married(-dDay + 1)
    } else if dDay == 0 {
      marriageStatus = .dday
    } else {
      marriageStatus = .notMarried(dDay)
    }
  }
}
