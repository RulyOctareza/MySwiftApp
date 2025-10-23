
import UIKit

class DetailViewController: UIViewController {
    var meal: Meal?

    private let scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.backgroundColor = UIColor(white: 0.95, alpha: 1)
        return sv
    }()

    private let cardView: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        v.layer.cornerRadius = 18
        v.layer.shadowColor = UIColor.black.cgColor
        v.layer.shadowOpacity = 0.07
        v.layer.shadowOffset = CGSize(width: 0, height: 2)
        v.layer.shadowRadius = 8
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()

    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 12
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .black
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let descLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .darkGray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let detailsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .gray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let addToCartButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Add to Cart", for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        btn.backgroundColor = UIColor(white: 0.93, alpha: 1)
        btn.setTitleColor(.darkGray, for: .normal)
        btn.layer.cornerRadius = 10
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(white: 0.95, alpha: 1)
        setupViews()
        configureView()
        addToCartButton.addTarget(self, action: #selector(didTapAddToCart), for: .touchUpInside)
    }
    @objc func didTapAddToCart() {
        let alert = UIAlertController(title: "Added to Cart", message: "Meal has been added to your cart!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

    private func setupViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(cardView)
        cardView.addSubview(imageView)
        cardView.addSubview(titleLabel)
        cardView.addSubview(descLabel)
        cardView.addSubview(detailsLabel)
        cardView.addSubview(addToCartButton)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            cardView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 24),
            cardView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            cardView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            cardView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -32),
            cardView.bottomAnchor.constraint(equalTo: addToCartButton.bottomAnchor, constant: 24)
        ])

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 24),
            imageView.centerXAnchor.constraint(equalTo: cardView.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 220),
            imageView.heightAnchor.constraint(equalToConstant: 180),

            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -20),

            descLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            descLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 20),
            descLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -20),

            detailsLabel.topAnchor.constraint(equalTo: descLabel.bottomAnchor, constant: 18),
            detailsLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 20),
            detailsLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -20),

            addToCartButton.topAnchor.constraint(equalTo: detailsLabel.bottomAnchor, constant: 28),
            addToCartButton.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 20),
            addToCartButton.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -20),
            addToCartButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }

    private func configureView() {
        guard let meal = meal else { return }
        titleLabel.text = meal.strMeal
        descLabel.text = meal.strInstructions ?? ""
        if let url = URL(string: meal.strMealThumb) {
            URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
                guard let data = data, error == nil, let image = UIImage(data: data) else { return }
                DispatchQueue.main.async {
                    self?.imageView.image = image
                }
            }.resume()
        }
        var details = ""
        if let category = meal.strCategory {
            details += "Category: \(category)\n"
        }
        if let area = meal.strArea {
            details += "Area: \(area)\n"
        }
        detailsLabel.text = details
    }
}