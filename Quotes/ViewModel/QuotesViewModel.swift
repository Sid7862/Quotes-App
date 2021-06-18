//
//  QuoteViewModel.swift
//  Quotes
//
//  Created by Dheeraj Kumar Sharma on 17/06/21.
//

import Foundation

class QuotesViewModel: ObservableObject {
    
    let apiURL = Constants.get_quote_url
    
    @Published var quoteModel: QuotesModel?
    
    init(){
        fetchQuote(for: 1)
    }
    
    func fetchQuote(for page: Int) {
        guard let url = URL(string: apiURL+"\(page)") else { return }
        URLSession.shared.dataTask(with: url) { (data , response , error) in
            guard let data = data else { return }
            do {
                let quote = try JSONDecoder().decode(QuotesModel.self, from: data)
                DispatchQueue.main.async {
                    if page == 1 {
                        self.quoteModel = quote
                    } else {
                        self.quoteModel?.page = quote.page
                        self.quoteModel?.results.append(contentsOf: quote.results)
                    }
                    
                }
            } catch {
                print("Error description: \(error)")
            }
        }.resume()
    }
    
}
