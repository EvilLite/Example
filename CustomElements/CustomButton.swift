import UIKit

class CustomButton:UIButton {
    
    
    init(_ nameButton: String,_ backgroundCol: UIColor){
        super.init(frame: .zero)
        setupButton(nameButton, backgroundCol)
    }
    
    init(_ nameButton: String, _ backgroundCol: UIColor,_ shadow: Bool){
        super.init(frame: .zero)
        setupButton(nameButton, backgroundCol)
        setupView(shadow)
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupButton(_ nameButton: String, _ backgroundCol: UIColor) {
        UIButton(type: .system)
        setTitle(nameButton, for: .normal)
        backgroundColor = backgroundCol
        setTitleColor(.black, for: .normal)
        layer.cornerRadius = 10
    }
    
    private func setupView(_ shadow: Bool) {
        if shadow {
            layer.cornerRadius = 20
            layer.shadowColor = UIColor.black.cgColor
            layer.shadowOpacity = 0.7
            layer.shadowRadius = 10
            layer.shadowOffset = CGSize(width: 5, height: 5)
        } else {
            
        }
        
    }
}
