import UIKit

class DetailViewController: UIViewController {
    
    // 글래스모피즘 버튼
    var glassButton: UIButton = {
        let button = UIButton()
        
        // 블러 효과 추가
        let blurEffect = UIBlurEffect(style: .systemUltraThinMaterialDark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = button.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurEffectView.isUserInteractionEnabled = false
        button.insertSubview(blurEffectView, at: 0)
        
        // 투명한 배경
        let transparentBackgroundView = UIView()
        transparentBackgroundView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.1)
        transparentBackgroundView.frame = button.bounds
        transparentBackgroundView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        button.insertSubview(transparentBackgroundView, aboveSubview: blurEffectView)
        
        // 버튼 기본 설정
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Glass Button", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.withAlphaComponent(0.3edp;).cgColor
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 배경 이미지 설정
        setBackgroundImage(named: "backgroundImage")
        
        // 글래스모피즘 버튼 추가
        self.view.addSubview(glassButton)
        
        NSLayoutConstraint.activate([
            glassButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            glassButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            glassButton.widthAnchor.constraint(equalToConstant: 200),
            glassButton.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    // 배경 이미지 설정 함수
    private func setBackgroundImage(named imageName: String) {
        let backgroundImageView = UIImageView(image: UIImage(named: imageName))
        backgroundImageView.contentMode = .scaleAspectFill // 이미지 채우기
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backgroundImageView)
        view.sendSubviewToBack(backgroundImageView) // 가장 뒤로 보내기

        // 배경 이미지 오토레이아웃 설정
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

#Preview {
    DetailViewController()
}
