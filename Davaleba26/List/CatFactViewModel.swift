//
//  catFactViewModel.swift
//  Davaleba26
//
//  Created by Lika Nozadze on 11/19/23.
//

//import Foundation
//import NetworkLayer
//
//protocol CatFactViewModelDelegate: AnyObject {
//    func fetchedFact(_ facts: [catFact])
//    func showError(_ error: Error)
//
//}
//
//final class CatFactViewModel {
//    private var facts: [catFact]?
//
//    weak var delegate: CatFactViewModelDelegate?
//
//    func viewDidLoad() {
//        fetchFact()
//
//    }
//    private func fetchFact() {
//        let urlStr = "https://catfact.ninja/facts?limit=20"
//
//        guard let url = URL(string: urlStr) else {
//            delegate?.showError(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"]))
//            return
//        }
//
//        NetworkManager.shared.fetchData(from: url, responseType: [catFact].self) { [weak self] (result: Result<[catFact], Error>) in
//            switch result {
//            case .success(let facts):
//                self?.facts = facts
//                self?.delegate?.fetchedFact(facts)
//            case .failure(let error):
//                self?.delegate?.showError(error)
//            }
//        }
//    }
//}
import Foundation
import NetworkLayer



protocol CatFactViewModelDelegate: AnyObject {
    func fetchedFact(_ facts: [catFact])
    func showError(_ error: Error)
}

final class CatFactViewModel {
    private var facts: [catFact]?
    
    weak var delegate: CatFactViewModelDelegate?
    
    func viewDidLoad() {
        fetchFact()
    }

    private func fetchFact() {
           let urlStr = "https://catfact.ninja/facts?limit=20"
           
           guard let url = URL(string: urlStr) else {
               let error = NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])
               delegate?.showError(error)
               return
           }
           
           NetworkManager.shared.fetchData(from: url, responseType: [catFact].self) { [weak self] (result: Result<[catFact], Error>) in
               switch result {
               case .success(let facts):
                   self?.facts = facts
                   self?.delegate?.fetchedFact(facts)

           
               case .failure(let error):
                   self?.delegate?.showError(error)
               }
           }
       }
   }
