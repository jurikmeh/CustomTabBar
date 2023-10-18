import UIKit

final class ViewController: UIViewController {
    
    private let labelTitle: String
    private let systemImageName: String
    
    init(title: String, systemImageName: String) {
        self.labelTitle = title
        self.systemImageName = systemImageName
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var titleLabel: UILabel = {
        $0.text = labelTitle
        return $0
    }(UILabel())
    
    private lazy var tabImage: UIImageView = {
        $0.image = UIImage(systemName: systemImageName)
        $0.tintColor = .black
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())
    
    private lazy var infoStackView: UIStackView = {
        $0.axis = .vertical
        $0.alignment = .center
        $0.distribution = .equalSpacing
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView(arrangedSubviews: [tabImage, titleLabel]))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        setupConstraints()
    }

}

private extension ViewController {
    func configure() {
        view.backgroundColor = .white
        tabBarItem.title = labelTitle
        tabBarItem.image = UIImage(systemName: systemImageName)
    }
    
    func setupConstraints() {
        setupTabImageViewConstraints()
        setupInfoStackViewConstraints()
    }
    
    func setupTabImageViewConstraints() {
        NSLayoutConstraint.activate([
            tabImage.widthAnchor.constraint(equalToConstant: 35),
            tabImage.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
    
    func setupInfoStackViewConstraints() {
        view.addSubview(infoStackView)
        NSLayoutConstraint.activate([
            infoStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            infoStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
