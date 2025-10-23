
import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var meals: [Meal] = []
    var filteredMeals: [Meal] = []
    let tableView = UITableView()
    let headerView = UIView()
    let titleLabel = UILabel()
    let searchButton = UIButton(type: .system)
    let profileButton = UIButton(type: .custom)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(white: 0.95, alpha: 1)
        setupHeader()
        setupTableView()
        fetchMeals()
        // Tambahkan aksi pada button
        searchButton.addTarget(self, action: #selector(didTapSearch), for: .touchUpInside)
        profileButton.addTarget(self, action: #selector(didTapProfile), for: .touchUpInside)
    }
    // Search bar
    var searchBar: UISearchBar?
    var searchBarTapGesture: UITapGestureRecognizer?

    @objc func didTapSearch() {
        if searchBar == nil {
            let sb = UISearchBar()
            sb.placeholder = "Search meals..."
            sb.translatesAutoresizingMaskIntoConstraints = false
            sb.delegate = self
            view.addSubview(sb)
            NSLayoutConstraint.activate([
                sb.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 0),
                sb.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                sb.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
            ])
            searchBar = sb
        } else {
            searchBar?.isHidden.toggle()
        }
    }

    @objc func didTapSearchBar() {
        let alert = UIAlertController(title: "Search", message: "Search bar clicked!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

    @objc func didTapProfile() {
        let aboutVC = AboutViewController()
        navigationController?.pushViewController(aboutVC, animated: true)
    }

    func setupHeader() {
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.backgroundColor = .white
        headerView.layer.cornerRadius = 16
        headerView.layer.masksToBounds = true
        view.addSubview(headerView)

        titleLabel.text = "Home"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 28)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        headerView.addSubview(titleLabel)

        searchButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        searchButton.tintColor = .darkGray
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        headerView.addSubview(searchButton)

        let profileImage = UIImage(systemName: "person.crop.circle")?.withRenderingMode(.alwaysOriginal)
        profileButton.setImage(profileImage, for: .normal)
        profileButton.translatesAutoresizingMaskIntoConstraints = false
        headerView.addSubview(profileButton)

        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            headerView.heightAnchor.constraint(equalToConstant: 60),

            titleLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 20),
            titleLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),

            searchButton.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            searchButton.trailingAnchor.constraint(equalTo: profileButton.leadingAnchor, constant: -16),
            searchButton.widthAnchor.constraint(equalToConstant: 28),
            searchButton.heightAnchor.constraint(equalToConstant: 28),

            profileButton.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -20),
            profileButton.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            profileButton.widthAnchor.constraint(equalToConstant: 36),
            profileButton.heightAnchor.constraint(equalToConstant: 36)
        ])
    }

    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ItemCell.self, forCellReuseIdentifier: "ItemCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 16),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        ])
    }

    func fetchMeals() {
        MealsAPI.shared.fetchMeals { [weak self] meals in
            DispatchQueue.main.async {
                self?.meals = meals ?? []
                self?.filteredMeals = self?.meals ?? []
                self?.tableView.reloadData()
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredMeals.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
        let meal = filteredMeals[indexPath.row]
        cell.configure(with: meal)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        detailVC.meal = filteredMeals[indexPath.row]
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

// MARK: - UISearchBarDelegate
extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            filteredMeals = meals
        } else {
            filteredMeals = meals.filter { $0.strMeal.lowercased().contains(searchText.lowercased()) }
        }
        tableView.reloadData()
    }
}