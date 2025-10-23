import UIKit


class ItemCell: UITableViewCell {
    static let identifier = "ItemCell"

    private let cardView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.07
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 6
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let itemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let descLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .darkGray
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        selectionStyle = .none
        contentView.addSubview(cardView)
        cardView.addSubview(itemImageView)
        cardView.addSubview(titleLabel)
        cardView.addSubview(descLabel)
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
            cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            cardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            itemImageView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16),
            itemImageView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 16),
            itemImageView.widthAnchor.constraint(equalToConstant: 60),
            itemImageView.heightAnchor.constraint(equalToConstant: 60),

            titleLabel.leadingAnchor.constraint(equalTo: itemImageView.trailingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 18),
            titleLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -16),

            descLabel.leadingAnchor.constraint(equalTo: itemImageView.trailingAnchor, constant: 16),
            descLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            descLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -16),
            descLabel.bottomAnchor.constraint(lessThanOrEqualTo: cardView.bottomAnchor, constant: -16)
        ])
    }

    func configure(with meal: Meal) {
        titleLabel.text = meal.strMeal
        descLabel.text = meal.strInstructions ?? ""
        if let url = URL(string: meal.strMealThumb) {
            loadImage(from: url)
        } else {
            itemImageView.image = nil
        }
    }

    private func loadImage(from url: URL) {
        itemImageView.image = nil
        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil, let image = UIImage(data: data) else { return }
            DispatchQueue.main.async {
                self?.itemImageView.image = image
            }
        }.resume()
    }
}