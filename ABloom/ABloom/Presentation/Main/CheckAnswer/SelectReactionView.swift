//
//  SelectReactionView.swift
//  ABloom
//
//  Created by Lee Jinhee on 11/20/23.
//

import SwiftUI

struct SelectReactionView: View {
  @Environment(\.dismiss) private var dismiss
  @ObservedObject var checkAnswerVM: CheckAnswerViewModel
  
  var body: some View {
    VStack(spacing: 10) {
      Text("반응 선택하기")
        .customFont(.title3B)
      Text("서로의 답변을 확인했나요?\n우리의 문답에 나의 반응을 추가해보세요.")
        .customFont(.subHeadlineR)
        .padding(.bottom, 27)
        .multilineTextAlignment(.center)
      
      reactionArea
        .padding(.bottom, 22)

      Button {
        checkAnswerVM.showSelectReactionView = false
        checkAnswerVM.updateReaction()
      } label: {
        PurpleTextButton(title: "완료")
      }
    }
    .padding(.top, 42)
    .padding(.bottom, 62)
    .padding(.horizontal, 16)
    .background(Color.white)
    .cornerRadius(16, corners: .allCorners)
    .padding(.horizontal, 20)
  }
}

extension SelectReactionView {
  private var reactionArea: some View {
    VStack(spacing: 29) {
      HStack(spacing: 20) {
        reactionButton(reaction: .good)
        reactionButton(reaction: .knowEachOther)
      }
      .frame(height: 128)
      
      HStack(spacing: 20) {
        reactionButton(reaction: .moreCommunication)
        reactionButton(reaction: .moreResearch)
      }
      .frame(height: 128)
    }
  }
  
  private func reactionButton(reaction: ReactionType) -> some View {
    Button {
      checkAnswerVM.selectedReaction = ReactionStatus.react(reaction)
    } label: {
      Image(reaction.imageName)
        .resizable()
        .frame(width: 128, height: 128)
        .opacity(checkAnswerVM.selectedReaction == ReactionStatus.react(reaction) ? 1.0 : 0.4)
    }
  }
}

#Preview {
  SelectReactionView(checkAnswerVM: CheckAnswerViewModel(question: DBStaticQuestion(questionID: 0, category: "", content: "")))
    .background(Color.black)
}
