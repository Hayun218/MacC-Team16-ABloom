//
//  QuestionMainViewModel.swift
//  ABloom
//
//  Created by yun on 10/22/23.
//

import SwiftUI

// get data!!

enum Categories: String, CaseIterable {
  case health = "건강"
  
}

struct ViewContent: Hashable {
  let number: Int
  let content: String
}


class QuestionMainViewModel: ObservableObject {
  
  
}

#Preview {
  QuestionMainView()
}
