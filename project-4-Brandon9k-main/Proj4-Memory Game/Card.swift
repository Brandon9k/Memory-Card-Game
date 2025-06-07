//
//  Card.swift
//  Proj4-Memory Game
//
//  Created by Brandon Christian on 10/15/24.
//

import SwiftUI

// Updated Card model
struct Card: Equatable {

    let question: String
    let answer: String

    static let mockedCards: [Card] = [
        Card(question: "🤔", answer: "😊"),
        Card(question: "🐶", answer: "🐱"),
        Card(question: "🌞", answer: "🌜"),
        Card(question: "🏀", answer: "⚽️"),
        Card(question: "🍎", answer: "🍌"),
        Card(question: "🚗", answer: "🚀"),
        Card(question: "🌍", answer: "🌕"),
        Card(question: "🎸", answer: "🎻"),
        Card(question: "🎂", answer: "🍕"),
        Card(question: "🏰", answer: "🌉")
    ]
}

// ContentView that shows the cards in a grid format
struct ContentView: View {

    @State private var cards: [Card] = Card.mockedCards  // Use correct mockedCards
    @State private var deckId: Int = 0
    @State private var cardsToPractice: [Card] = []
    @State private var cardsMemorized: [Card] = []
    @State private var removedCards: [Card] = []
    @State private var backgroundColor: Color = .yellow

    @State private var createCardViewPresented = false

    // Define the grid layout
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        VStack {
            HStack {
                Button("Reset") {
                    cards = cardsToPractice + cardsMemorized + removedCards
                    cardsToPractice = []
                    cardsMemorized = []
                    removedCards = []
                    deckId += 1
                }
                .disabled(cardsToPractice.isEmpty && cardsMemorized.isEmpty && removedCards.isEmpty)

                Button("More Practice") {
                    cards = cardsToPractice
                    cardsToPractice = []
                    deckId += 1
                }
                .disabled(cardsToPractice.isEmpty)
            }

            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(0..<cards.count, id: \.self) { index in
                        CardView(card: cards[index], onSwipedLeft: {
                            let removeCard = cards.remove(at: index)
                            cardsToPractice.append(removeCard)

                        }, onSwipedRight: {
                            let removedCard = cards.remove(at: index)
                            cardsMemorized.append(removedCard)

                        }, onSwipedDown: {
                            let removedCard = cards.remove(at: index)
                            removedCards.append(removedCard)  // Store the removed card in the removedCards array
                        })
                        .frame(width: 100, height: 150)  // Adjust size as needed
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                    }
                }
                .padding()
            }
            .animation(.bouncy, value: cards)
            .id(deckId)

            .sheet(isPresented: $createCardViewPresented, content: {
                CreateFlashcardView { card in
                    cards.append(card)
                }
            })
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay(alignment: .topTrailing) {
                Button("Add Flashcard", systemImage: "plus") {
                    createCardViewPresented.toggle()
                }
            }
        }
        .background(backgroundColor)
    }
}

// CardView to show individual cards
struct CardView: View {

    let card: Card

    var onSwipedLeft: (() -> Void)?
    var onSwipedRight: (() -> Void)?
    var onSwipedDown: (() -> Void)?

    @State private var isShowingQuestion = true
    @State private var offset: CGSize = .zero

    private let swipeThreshold: Double = 200

    var body: some View {
        ZStack {
            ZStack {
                // Background color changes based on swipe direction
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(determineCardColor())   // Dynamically change card color based on swipe direction

                RoundedRectangle(cornerRadius: 25.0)
                    .fill(isShowingQuestion ? Color.blue.gradient : Color.indigo.gradient)
                    .shadow(color: .black, radius: 4, x: -2, y: 2)
                    // Opacity also changes based on vertical and horizontal swipe
                    .opacity(1 - max(abs(offset.width), abs(offset.height)) / swipeThreshold)
            }

            VStack(spacing: 20) {
                Text(isShowingQuestion ? card.question : card.answer)  // Display emoji for question or answer
                    .font(.system(size: 100))  // Use large font size for emoji
            }
            .padding()
        }
        .frame(width: 300, height: 500)
        .onTapGesture {
            isShowingQuestion.toggle()  // Toggle between showing the question (emoji) and answer (emoji)
        }
        // Fades based on horizontal swipe distance or vertical swipe (down)
        .opacity(3 - abs(offset.width) / swipeThreshold * 3)
        .rotationEffect(.degrees(offset.width / 20.0))  // Adds rotation as you swipe
        .offset(offset)  // Move the card based on swipe gesture
        .gesture(DragGesture()
            .onChanged { gesture in
                let translation = gesture.translation
                offset = translation  // Track the current swipe distance
            }
            .onEnded { gesture in
                if gesture.translation.width > swipeThreshold {
                    print("Swiped right")
                    onSwipedRight?()
                } else if gesture.translation.width < -swipeThreshold {
                    print("Swiped left")
                    onSwipedLeft?()
                } else if gesture.translation.height > swipeThreshold {
                    // Swipe down to remove the card
                    print("Swiped down - card removed!")
                    onSwipedDown?()
                } else {
                    // Reset position if no swipe action occurs
                    withAnimation(.bouncy) {
                        offset = .zero
                    }
                }
            }
        )
    }

    // Function to dynamically change card color based on swipe direction
    private func determineCardColor() -> Color {
        // Swipe left: red, Swipe right: green, Swipe down: black, otherwise default color
        if offset.width < 0 {
            return .red    // Left swipe (wrong answer)
        } else if offset.width > 0 {
            return .green  // Right swipe (correct answer)
        } else if offset.height > swipeThreshold {
            return .black  // Down swipe (delete)
        } else {
            return Color.blue
        }
    }
}

#Preview {
    ContentView()
}
