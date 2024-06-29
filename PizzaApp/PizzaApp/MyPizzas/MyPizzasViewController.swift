//
//  MyPizzasViewController.swift
//  PizzaApp
//
//  Created by Liz Alpizar on 29/06/24.
//

import UIKit

class MyPizzasViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var myPizzas: [Pizza] = []
    var tableView: UITableView!
    var addButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "My Pizzas"
        view.backgroundColor = .white

        tableView = UITableView(frame: view.bounds)
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        
        addButton = UIButton(type: .system)
        addButton.setTitle("Add Pizza", for: .normal)
        addButton.addTarget(self, action: #selector(addPizza), for: .touchUpInside)
        addButton.frame = CGRect(x: view.frame.width - 100, y: view.frame.height - 60, width: 80, height: 40)
        view.addSubview(addButton)
    }

    @objc func addPizza() {
        let newPizza = Pizza(name: "Custom Pizza \(myPizzas.count + 1)", ingredients: ["Custom Ingredient"])
        myPizzas.append(newPizza)
        tableView.reloadData()
    }

    // MARK: - UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myPizzas.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") ?? UITableViewCell(style: .default, reuseIdentifier: "Cell")
        cell.textLabel?.text = myPizzas[indexPath.row].name
        return cell
    }
}
