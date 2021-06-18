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
    
    // MARK: BODY -
    
    var body: some View {
        NavigationView {
            List {
                if let quotes = quotesVM.quoteModel?.results {
                    ForEach(quotes) { quote in
                        QuoteCardView(quoteText: quote.content)
                    }
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
                
            }
            .navigationBarTitle("Quotes")
        }
    }
}

// MARK: PREVIEW -

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
