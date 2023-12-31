//
//  RegisterVC.swift
//  NoteMeProject
//
//  Created by Sergeenko on 11/12/2023.
//

import UIKit
import SnapKit

@objc protocol RegisterPresenterProtocol: AnyObject {
    func registerDidTap(email: String?, password: String?, repeatPassword: String?)
    @objc func haveAccountDidTap()
}

final class RegisterVC: UIViewController {
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .appGray
        return view
    }()
    
    private lazy var registerButton: UIButton =
        .yellowRoundedButton("Register")
        .withAction(self, #selector(registerDidTap))
    
    private lazy var haveAccountButton: UIButton =
        .underlineYellowButton("I have an Account")
        .withAction(presenter, #selector(RegisterPresenterProtocol.haveAccountDidTap))
        
    
    private lazy var cancelButton: UIButton = .cancelButton()
    private lazy var logoImageView: UIImageView = UIImageView(image: .General.logo)
    private lazy var titleLabel: UILabel = .titleLabel("Nice to meet you!")
    
    private lazy var infoView: UIView = {
        var view = UIView()
        view.cornerRadius = 5
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var emailTextField: LineTextField = {
        var textField = LineTextField()
        textField.title = "E-mail"
        textField.placeHolder = "Enter E-mail"
        return textField
    }()
    
    private lazy var passwordTextField: LineTextField = {
        var textField = LineTextField()
        textField.title = "Password"
        textField.placeHolder = "Enter Password"
        return textField
    }()
    
    private lazy var repeatPasswordTextField: LineTextField = {
        var textField = LineTextField()
        textField.title = "Repeat Password"
        textField.placeHolder = "Enter Password"
        return textField
    }()
    
    private var presenter: RegisterPresenterProtocol

    init(presenter: RegisterPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        bind()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstrains()
    }
    
    private func bind() {
//        viewModel.catchEmailError = { errorText in
//            self.emailTextField.errorText = errorText
//        }
//        
//        viewModel.catchPasswordError = { errorText in
//            self.passwordTextField.errorText = errorText
//        }
    }
    
    private func setupUI() {
        view.backgroundColor = .appBlack
        view.addSubview(contentView)
        view.addSubview(registerButton)
        view.addSubview(haveAccountButton)
        
        contentView.addSubview(logoImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(infoView)
        
        infoView.addSubview(repeatPasswordTextField)
        infoView.addSubview(emailTextField)
        infoView.addSubview(passwordTextField)
    }
    
    private func setupConstrains() {
        contentView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(registerButton.snp.centerY)
        }
        
        logoImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(72.0)
            make.centerX.equalToSuperview()
            make.size.equalTo(96.0)
        }
        
        haveAccountButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(8.0)
            make.horizontalEdges.equalToSuperview().inset(20.0)
            make.height.equalTo(20.0)
        }
        
        registerButton.snp.makeConstraints { make in
            make.bottom.equalTo(haveAccountButton.snp.top).inset(-8.0)
            make.horizontalEdges.equalToSuperview().inset(20.0)
            make.height.equalTo(45.0)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.horizontalEdges.centerX.equalToSuperview()
            make.bottom.equalTo(infoView.snp.top).inset(-8.0)
        }
        
        infoView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(16.0)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.horizontalEdges.top.equalToSuperview().inset(16.0)
            make.bottom.equalTo(passwordTextField.snp.top).inset(-20.0)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).inset(-20.0)
            make.horizontalEdges.equalTo(emailTextField.snp.horizontalEdges)
            make.bottom.equalTo(repeatPasswordTextField.snp.top).inset(-20.0)
        }
        
        repeatPasswordTextField.snp.makeConstraints { make in
            make.bottom.right.left.equalToSuperview().inset(16.0)
            make.top.equalTo(passwordTextField.snp.bottom).inset(-20.0)
            make.bottom.equalTo(infoView.snp.bottom).inset(-20.0)
        }
        
    }
    
    @objc private func registerDidTap() {
        presenter.registerDidTap(email: emailTextField.text,
                                 password: passwordTextField.text,
                                 repeatPassword: repeatPasswordTextField.text)
    }
}
