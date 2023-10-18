import UIKit

final class CustomTabBar: UITabBar {
    
    private lazy var plusButton: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(PlusButton(type: .system))
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        drawTabBar()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        plusButton.frame.contains(point) ? plusButton : super.hitTest(point, with: event)
    }
}

private extension CustomTabBar {
    func setupConstraints() {
        setupButtonConstraints()
    }
    
    func setupButtonConstraints() {
        addSubview(plusButton)
        NSLayoutConstraint.activate([
            plusButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            plusButton.centerYAnchor.constraint(equalTo: topAnchor),
            plusButton.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5),
            plusButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5)
        ])
    }
}

private extension CustomTabBar {
    func drawTabBar() {
        let path = getTabBarPath()
        let shape = CAShapeLayer()
        shape.path = path.cgPath
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.3
        layer.shadowOffset = CGSize(width: 3, height: 0)
        
        shape.fillColor = UIColor.white.cgColor
        layer.insertSublayer(shape, at: 0)
    }
    
    func getTabBarPath() -> UIBezierPath {
        let path = UIBezierPath()
        
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: 100, y: 0))
        path.addArc(
            withCenter: CGPoint(x: frame.width / 2.0, y: 0),
            radius: 28,
            startAngle: .pi,
            endAngle: 2 * .pi,
            clockwise: false
        )
        path.addLine(to: CGPoint(x: frame.width, y: 0))
        path.addLine(to: CGPoint(x: frame.width, y: frame.height))
        path.addLine(to: CGPoint(x: 0, y: frame.height))
        
        path.close()
        return path
    }
}
