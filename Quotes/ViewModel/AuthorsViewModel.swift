//
//  AuthorsViewModel.swift
//  Quotes
//
//  Created by Dheeraj Kumar Sharma on 17/06/21.
//

import Foundation

class AuthorsViewModel: ObservableObject {
    
    let apiURL = Constants.get_authors_url
    
    @Published var authorsModel: AuthorsModel?
    
    init(){
        fetchAuthors()
    }
    
    func fetchAuthors() {
        guard let url = URL(string: apiURL) else { return }
        URLSession.shared.dataTask(with: url) { (data , response , error) in
            guard let data = data else { return }
            do {
                let authors = try JSONDecoder().decode(AuthorsModel.self, from: data)
                DispatchQueue.main.async {
                    self.authorsModel = authors
                }
            } catch {
                print("Error description: \(error)")
            }
        }.resume()
    }
    
}
