//
//  PizzeriaListViewController.swift
//  PizzaApp
//
//  Created by Liz Alpizar on 29/06/24.
//

import UIKit

class PizzeriaListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var pizzerias: [Pizzeria] = []
    var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Pizzerias"
        view.backgroundColor = .white

        tableView = UITableView(frame: view.bounds)
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        
        // Cargar los datos
        loadData()
    }

    func loadData() {
        if let path = Bundle.main.path(forResource: "pizza-info", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                let pizzaData = try JSONDecoder().decode(PizzaData.self, from: data)
                pizzerias = pizzaData.pizzerias
                tableView.reloadData()
            } catch {
                print("Error loading data: \(error)")
            }
        }
    }

    // MARK: - UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pizzerias.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") ?? UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
        let pizzeria = pizzerias[indexPath.row]
        cell.textLabel?.text = pizzeria.name
        cell.detailTextLabel?.text = pizzeria.address
        return cell
    }
}
