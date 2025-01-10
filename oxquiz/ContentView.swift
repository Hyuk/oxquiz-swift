//
//  ContentView.swift
//  oxquiz
//
//  Created by Hyuk Ho Song on 1/10/25.
//

import SwiftUI

struct ContentView: View {
    @State var number1: [Int] = [4, 6, 3, 8, 7, 2, 5, 9, 10, 8]
    @State var number2: [Int] = [5, 2, 7, 4, 3, 8, 1, 3, 2, 9]
    @State var quizResult: [Int] = [20, 6, 10, 5, 21, 6, 6, 3, 3, 17]
    @State var calcChar: [String] = ["*", "/", "+", "-", "*", "-", "+", "/", "*", "+"]
    
    @State var countCorrect: Int = 0
    @State var countWrong: Int = 0
    @State var currentIndex: Int = 0
    @State var isGameFinish: Bool = false
    
    var body: some View {
        // UI 구성 및 로직 작성 부분
        VStack {
            Text(isGameFinish ? "문제를 다 풀었습니다.":"다음 수식은 맞을까요?")
                .font(.largeTitle)
            Spacer()
            Text(isGameFinish ? "\(countCorrect * 10) 점": "\(number1[currentIndex]) \(calcChar[currentIndex] == "*" ? "x" : calcChar[currentIndex]) \(number2[currentIndex]) = \(quizResult[currentIndex])")
                .font(.largeTitle)
            Spacer()
            HStack {
                Spacer()
                Button("맞음", systemImage: "checkmark.diamond.fill") {
                    selectCorrect()
                }
                .foregroundStyle(.green)
                .font(.largeTitle)
                .disabled(isGameFinish)
                Spacer()
                Button("틀림", systemImage: "xmark.diamond.fill") {
                    selectWrong()
                }
                .foregroundStyle(.red)
                .font(.largeTitle)
                .disabled(isGameFinish)
                Spacer()
            }
            Spacer()
            HStack {
                Spacer()
                Text("\(countCorrect)개 맞춤")
                    .font(.largeTitle)
                Spacer()
                Text("\(countWrong)개 틀림")
                    .font(.largeTitle)
                Spacer()
            }
            Spacer()
            Button("카운트 초기화") {
                reloadGame()
            }
            .font(.largeTitle)
            .opacity(isGameFinish ? 1 : 0)
        }
    }
    
    func reloadGame() {
        // 게임 재시작 로직
        countCorrect = 0
        countWrong = 0
        currentIndex = 0
        isGameFinish = false
    }
    
    func selectCorrect() {
        // 정답 선택 시 로직
        if calcChar[currentIndex] == "*", !isGameFinish {
            if number1[currentIndex] * number2[currentIndex] == quizResult[currentIndex] {
                countCorrect += 1
            }
            else {
                countWrong += 1
            }
        } else if calcChar[currentIndex] == "+", !isGameFinish {
            if number1[currentIndex] + number2[currentIndex] == quizResult[currentIndex] {
                countCorrect += 1
            }
            else {
                countWrong += 1
            }
        } else if calcChar[currentIndex] == "/", !isGameFinish {
            if number1[currentIndex] / number2[currentIndex] == quizResult[currentIndex] {
                countCorrect += 1
            }
            else {
                countWrong += 1
            }
        } else if calcChar[currentIndex] == "-", !isGameFinish {
            if number1[currentIndex] - number2[currentIndex] == quizResult[currentIndex] {
                countCorrect += 1
            }
            else {
                countWrong += 1
            }
        }
        nextQuestion()
    }
    
    func selectWrong() {
        // 오답 선택 시 로직
        if calcChar[currentIndex] == "*", !isGameFinish {
            if number1[currentIndex] * number2[currentIndex] != quizResult[currentIndex] {
                countCorrect += 1
            }
            else {
                countWrong += 1
            }
        } else if calcChar[currentIndex] == "+", !isGameFinish {
            if number1[currentIndex] + number2[currentIndex] != quizResult[currentIndex] {
                countCorrect += 1
            }
            else {
                countWrong += 1
            }
        } else if calcChar[currentIndex] == "/", !isGameFinish {
            if number1[currentIndex] / number2[currentIndex] != quizResult[currentIndex] {
                countCorrect += 1
            }
            else {
                countWrong += 1
            }
        } else if calcChar[currentIndex] == "-", !isGameFinish {
            if number1[currentIndex] - number2[currentIndex] != quizResult[currentIndex] {
                countCorrect += 1
            }
            else {
                countWrong += 1
            }
        }
        nextQuestion()
    }
    
    func nextQuestion() {
        if currentIndex < calcChar.count - 1 {
            currentIndex += 1
            print(currentIndex)
        } else {
            isGameFinish = true
        }
    }
}

#Preview {
    ContentView()
}
