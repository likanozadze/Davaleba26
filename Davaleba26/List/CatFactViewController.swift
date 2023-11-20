//
//  CatFactViewController.swift
//  Davaleba26
//
//  Created by Lika Nozadze on 11/19/23.
//

import UIKit

final class CatFactViewController: UIViewController {
    
    
    // MARK: - Properties
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
        private var catFacts = [catFact]()
        private let viewModel = CatFactViewModel()
    
    
    // MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBackground()
        setupSubviews()
        setupConstraints()
        setupTableView()
        setupViewModelDelegate()
        viewModel.viewDidLoad()
    }

    // MARK: - Private Methods
    private func setupBackground() {
        view.backgroundColor = .red
    }

    
    private func setupSubviews() {
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
        ])
    }
    private func setupViewModelDelegate() {
        viewModel.delegate = self
    }

    private func setupTableView() {
        tableView.dataSource = self
        tableView.register(CatFactTableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
}

// MARK: - TableVIew DataSource
extension CatFactViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CatFactTableViewCell {
            let catFact = catFacts[indexPath.row]
            cell.configure(with: catFact)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        catFacts.count
    }
}

// MARK: - TableVIew Delegate

extension CatFactViewController: CatFactViewModelDelegate {
    func fetchedFact(_ catFacts: [catFact]) {
        self.catFacts = catFacts
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

        func showError(_ error: Error) {
        
            print("Error: \(error.localizedDescription)")
        }
    }

