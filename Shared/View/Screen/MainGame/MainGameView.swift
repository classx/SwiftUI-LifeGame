//
//  MainGameView.swift
//  Shared
//
//  Created by Yusuke Hosonuma on 2020/07/15.
//

import SwiftUI
import LifeGame

// MARK: - Main view

struct MainGameView: View {
    @ObservedObject var viewModel: MainGameViewModel

    var body: some View {
        GeometryReader { geometry in
            VStack {
                HStack {
                    Spacer()
                    Text("\(viewModel.board.size) x \(viewModel.board.size)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .padding([.trailing], 16)
                }
                Spacer()
                BoardContainerView(viewModel: viewModel)
                    .frame(width: geometry.size.width, height: geometry.size.width)
                Spacer()
                SpeedSliderView(viewModel: viewModel)
                    .padding([.leading, .trailing])
                ControlView(viewModel: viewModel)
                    .padding()
            }
        }
    }
}

// MARK: - Preview

struct MainGameView_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            view(.light)
            view(.dark)
        }
    }

    static func view(_ colorScheme: ColorScheme) -> some View {
        MainGameView(viewModel: MainGameViewModel())
            .previewDevice("iPhone SE (2nd generation)")
            .preferredColorScheme(colorScheme)
    }
}
