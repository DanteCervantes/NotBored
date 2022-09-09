//
//  CategoriesViewController.swift
//  NotBored
//
//  Created by Nicolas Alejandro Ferrero on 06/09/2022.
//

import UIKit

class CategoriesViewController: UIViewController {

    private let categories = Category.allCases.map { $0.rawValue }
    var participants: Int?
    
    private lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Activities"
        lbl.font = UIFont.boldSystemFont(ofSize: 40)
        lbl.backgroundColor = UIColor(named: "Blue Primary")
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textAlignment = .center
        view.addSubview(lbl)
        return lbl
    }()
    
    private lazy var table: UITableView = {
        let tbl = UITableView()
        tbl.translatesAutoresizingMaskIntoConstraints = false
        tbl.backgroundColor = UIColor(named: "Blue Secondary")
        tbl.dataSource = self
        tbl.delegate = self
        tbl.register(CategoriesTableViewCell.self, forCellReuseIdentifier: CategoriesTableViewCell.cellIdentifier)
        view.addSubview(tbl)
        return tbl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Blue Primary")
        navigationController?.setNavigationBarHidden(true, animated: false)
        setupConstraints()
    }
        
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            //Title label constraints
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 80),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            //Categories table constraints
            table.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            table.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            table.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            table.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

extension CategoriesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CategoriesTableViewCell.cellIdentifier, for: indexPath) as? CategoriesTableViewCell
            else { return UITableViewCell() }
        cell.data = categories[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 90
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Llamo al componente de category pasadole el type de actividad
        guard let category = Category(rawValue: categories[indexPath.row]) else { return }
        
        let vc = ActivityDetailViewController()
        vc.selectedParticipants = participants
        vc.selectedType = category
        tabBarController?.navigationController?.pushViewController(vc, animated: true)
    }
}
