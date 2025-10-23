import UIKit
class AboutViewController: UIViewController {
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

    private let avatarImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "person.crop.circle.fill")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 50
        iv.backgroundColor = UIColor(white: 0.95, alpha: 1)
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "John Doe"
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "john.doe@example.com"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .gray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let bioField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Tell us a little about yourself"
        tf.font = UIFont.systemFont(ofSize: 15)
        tf.borderStyle = .roundedRect
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()

    private let locationField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "City, Country"
        tf.font = UIFont.systemFont(ofSize: 15)
        tf.borderStyle = .roundedRect
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()

    private let phoneField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Your phone number"
        tf.font = UIFont.systemFont(ofSize: 15)
        tf.borderStyle = .roundedRect
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()

    private let saveButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Save Changes", for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        btn.backgroundColor = UIColor(white: 0.7, alpha: 1)
        btn.setTitleColor(.white, for: .normal)
        btn.layer.cornerRadius = 10
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(white: 0.95, alpha: 1)
        setupViews()
        saveButton.addTarget(self, action: #selector(didTapSave), for: .touchUpInside)
    }
    @objc func didTapSave() {
        let bio = bioField.text ?? ""
        let location = locationField.text ?? ""
        let phone = phoneField.text ?? ""
        // Simpan ke UserDefaults (atau model, sesuai kebutuhan)
        UserDefaults.standard.setValue(bio, forKey: "userBio")
        UserDefaults.standard.setValue(location, forKey: "userLocation")
        UserDefaults.standard.setValue(phone, forKey: "userPhone")
        let alert = UIAlertController(title: "Saved!", message: "Profile changes have been saved.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

    private func setupViews() {
        view.addSubview(cardView)
        cardView.addSubview(avatarImageView)
        cardView.addSubview(nameLabel)
        cardView.addSubview(emailLabel)
        cardView.addSubview(bioField)
        cardView.addSubview(locationField)
        cardView.addSubview(phoneField)
        cardView.addSubview(saveButton)

        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            cardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            cardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            cardView.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: -32)
        ])

        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 32),
            avatarImageView.centerXAnchor.constraint(equalTo: cardView.centerXAnchor),
            avatarImageView.widthAnchor.constraint(equalToConstant: 100),
            avatarImageView.heightAnchor.constraint(equalToConstant: 100),

            nameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 16),
            nameLabel.centerXAnchor.constraint(equalTo: cardView.centerXAnchor),

            emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            emailLabel.centerXAnchor.constraint(equalTo: cardView.centerXAnchor),

            bioField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 24),
            bioField.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 24),
            bioField.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -24),
            bioField.heightAnchor.constraint(equalToConstant: 40),

            locationField.topAnchor.constraint(equalTo: bioField.bottomAnchor, constant: 16),
            locationField.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 24),
            locationField.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -24),
            locationField.heightAnchor.constraint(equalToConstant: 40),

            phoneField.topAnchor.constraint(equalTo: locationField.bottomAnchor, constant: 16),
            phoneField.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 24),
            phoneField.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -24),
            phoneField.heightAnchor.constraint(equalToConstant: 40),

            saveButton.topAnchor.constraint(equalTo: phoneField.bottomAnchor, constant: 32),
            saveButton.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 24),
            saveButton.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -24),
            saveButton.heightAnchor.constraint(equalToConstant: 48),
            saveButton.bottomAnchor.constraint(lessThanOrEqualTo: cardView.bottomAnchor, constant: -32)
        ])
    }
}