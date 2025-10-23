import UIKit

class SettingsViewController: UIViewController {
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

    private let profileButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Edit Profile", for: .normal)
        btn.setImage(UIImage(systemName: "person.crop.circle"), for: .normal)
        btn.tintColor = .darkGray
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        btn.contentHorizontalAlignment = .left
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    private let darkModeSwitch: UISwitch = {
        let sw = UISwitch()
        sw.isOn = false
        sw.translatesAutoresizingMaskIntoConstraints = false
        return sw
    }()
    private let darkModeLabel: UILabel = {
        let label = UILabel()
        label.text = "Dark Mode"
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let pushSwitch: UISwitch = {
        let sw = UISwitch()
        sw.isOn = true
        sw.translatesAutoresizingMaskIntoConstraints = false
        return sw
    }()
    private let pushLabel: UILabel = {
        let label = UILabel()
        label.text = "Push Notifications"
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let changePasswordButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Change Password", for: .normal)
        btn.setImage(UIImage(systemName: "arrow.triangle.2.circlepath"), for: .normal)
        btn.tintColor = .darkGray
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        btn.contentHorizontalAlignment = .left
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    private let linkedAccountsButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Linked Accounts", for: .normal)
        btn.setImage(UIImage(systemName: "link"), for: .normal)
        btn.tintColor = .darkGray
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        btn.contentHorizontalAlignment = .left
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    private let helpButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Help & Support", for: .normal)
        btn.setImage(UIImage(systemName: "questionmark.circle"), for: .normal)
        btn.tintColor = .darkGray
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        btn.contentHorizontalAlignment = .left
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    private let privacyButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Privacy Policy", for: .normal)
        btn.setImage(UIImage(systemName: "shield"), for: .normal)
        btn.tintColor = .darkGray
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        btn.contentHorizontalAlignment = .left
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(white: 0.95, alpha: 1)
        setupViews()
    }

    private func setupViews() {
        view.addSubview(cardView)
        cardView.addSubview(profileButton)
        cardView.addSubview(darkModeLabel)
        cardView.addSubview(darkModeSwitch)
        cardView.addSubview(pushLabel)
        cardView.addSubview(pushSwitch)
        cardView.addSubview(changePasswordButton)
        cardView.addSubview(linkedAccountsButton)
        cardView.addSubview(helpButton)
        cardView.addSubview(privacyButton)

        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            cardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            cardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            cardView.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: -32)
        ])

        NSLayoutConstraint.activate([
            profileButton.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 24),
            profileButton.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 24),
            profileButton.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -24),
            profileButton.heightAnchor.constraint(equalToConstant: 44),

            darkModeLabel.topAnchor.constraint(equalTo: profileButton.bottomAnchor, constant: 32),
            darkModeLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 24),
            darkModeSwitch.centerYAnchor.constraint(equalTo: darkModeLabel.centerYAnchor),
            darkModeSwitch.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -24),

            pushLabel.topAnchor.constraint(equalTo: darkModeLabel.bottomAnchor, constant: 24),
            pushLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 24),
            pushSwitch.centerYAnchor.constraint(equalTo: pushLabel.centerYAnchor),
            pushSwitch.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -24),

            changePasswordButton.topAnchor.constraint(equalTo: pushLabel.bottomAnchor, constant: 32),
            changePasswordButton.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 24),
            changePasswordButton.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -24),
            changePasswordButton.heightAnchor.constraint(equalToConstant: 44),

            linkedAccountsButton.topAnchor.constraint(equalTo: changePasswordButton.bottomAnchor, constant: 16),
            linkedAccountsButton.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 24),
            linkedAccountsButton.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -24),
            linkedAccountsButton.heightAnchor.constraint(equalToConstant: 44),

            helpButton.topAnchor.constraint(equalTo: linkedAccountsButton.bottomAnchor, constant: 32),
            helpButton.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 24),
            helpButton.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -24),
            helpButton.heightAnchor.constraint(equalToConstant: 44),

            privacyButton.topAnchor.constraint(equalTo: helpButton.bottomAnchor, constant: 16),
            privacyButton.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 24),
            privacyButton.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -24),
            privacyButton.heightAnchor.constraint(equalToConstant: 44),
            privacyButton.bottomAnchor.constraint(lessThanOrEqualTo: cardView.bottomAnchor, constant: -32)
        ])
    }
}
