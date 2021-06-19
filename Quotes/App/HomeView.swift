//
//  HomeView.swift
//  Quotes
//
//  Created by Dheeraj Kumar Sharma on 17/06/21.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: PROPERTIES -
    
    @ObservedObject var quotesVM = QuotesViewModel()
    @ObservedObject var authorsVM = AuthorsViewModel()
    private var gridItemLayout = [GridItem(.flexible())]
    
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.font : UIFont(name: Constants.fontBlack, size: 20)!]
    }
    
    // MARK: BODY -
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: gridItemLayout, spacing: 12) {
                    if let quotes = quotesVM.quoteModel?.results {
                        ForEach(quotes) { quote in
                            NavigationLink(destination: QuoteDetailView(data: quote)) {
                                QuoteCardView(quoteText: quote.content , author: quote.author)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                        .offset(y: 12)
                        if let quoteTotalCount = quotesVM.quoteModel?.totalCount {
                            if quoteTotalCount > quotes.count {
                                ProgressView()
                                    .progressViewStyle(CircularProgressViewStyle())
                                    .onAppear(perform: {
                                        if let page = quotesVM.quoteModel?.page {
                                            self.quotesVM.fetchQuote(for: page + 1)
                                        }
                                    })
                            }
                        }
                    }
                } //: LAZYVGRID
            } //: SCROLLVIEW
            .navigationBarTitle(Text("Quotes"))
            .navigationBarTitleDisplayMode(.inline)
            
//            .onAppear {
//                for family in UIFont.familyNames.sorted() {
//                    let names = UIFont.fontNames(forFamilyName: family)
//                    print("Family: \(family) Font names: \(names)")
//                }
//            }
            
        } //: NAVIGATIONVIEW
    }
}

// MARK: PREVIEW -

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
