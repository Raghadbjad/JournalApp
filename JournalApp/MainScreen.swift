//
//  MainScreen.swift
//  JournalApp
//
//  Created by Raghad on 17/04/1446 AH.

import SwiftUI

struct Journal: Identifiable {
    var id = UUID()  // Unique identifier for each Journal instance
    var title: String
    var date: String
    var description: String
}

struct MainScreen: View {
    @State private var cards: [Journal] = []
    @State private var searchText = ""

    var body: some View {
        ZStack {
            Color(.black)
                .scaledToFill()
                .ignoresSafeArea()

            if cards.isEmpty {
                VStack(spacing: 15) {
                    HStack {
                        Button(action: {
                            AddJournal()
                        }) {
                            Image(systemName: "plus.circle.fill")
                                .foregroundStyle(.color1 , .gray.opacity(0.4)  )
                        }
                        .padding(.leading, 200)

                        Button(action: {
                            FillterJournal()
                        }) {
                            Image(systemName: "line.horizontal.3.decrease.circle.fill")
                                .foregroundStyle(.color1 , .gray.opacity(0.4)  )
                        }
                        .padding(.leading, 1)
                    }

                    Text("Journali")
                        .foregroundColor(.white)
                        .font(.system(size: 30, weight: .heavy))
                        .padding(.leading, -150)

                    Spacer()

                    Image("Book")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 77, height: 101)

                    Text("Begin Your Journal")
                        .foregroundColor(.color1) // استخدم لونًا مناسبًا
                        .font(.system(size: 24, weight: .heavy))

                    Text("Craft your personal diary, tap the \n             plus icon to begin")
                        .font(.system(size: 18, weight: .light))
                        .foregroundColor(.white)
                }
                .padding(.bottom, 300)
            } else {
    
                VStack {
                    Text("Journali")
                        .foregroundColor(.white)
                        .font(.system(size: 30, weight: .heavy))
                        .padding(.leading, -150)

                


                    Spacer()
                }
            }
        }
    }

    func getCurrentDate() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: Date())
    }

    func FillterJournal() {
    }

    func AddJournal() {
       
//        let newJournal = Journal(title: "Sample Journal", date: getCurrentDate(), description: "This is a sample description.")
//        cards.append(newJournal)
    }
}



//
//struct JournalCard: View {
//    var journal: Journal
//
//    var body: some View {
//        VStack {
//            Text(journal.title)
//                .font(.headline)
//                .foregroundColor(.white)
//            Text(journal.date)
//                .font(.subheadline)
//                .foregroundColor(.gray)
//            Text(journal.description)
//                .font(.body)
//                .foregroundColor(.white)
//        }
//        .padding()
//        .background(Color.gray.opacity(0.2))
//        .cornerRadius(10)
//        .padding(.horizontal)
//    }
//}


#Preview {
    MainScreen()
}
