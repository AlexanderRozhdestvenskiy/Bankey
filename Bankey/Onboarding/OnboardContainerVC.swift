//
//  OnboardingContainerViewController.swift
//  Bankey
//
//  Created by Alexander Rozhdestvenskiy on 10.01.2022.
//

import UIKit

class OnboardContainerVC: UIViewController {
    
    let pageViewController: UIPageViewController
    var pages = [UIViewController]()
    var currentVC: UIViewController
    let closeButton = UIButton(type: .system)
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        
        let page1 = OnboardVC(heroImageName: "delorean", titleText: "Bankey is faster, easier to use, and has a brand new look and feel that will make you feel like you are back in the 80s.")
        let page2 = OnboardVC(heroImageName: "world", titleText: "Move your money around the world quickly and securely.")
        let page3 = OnboardVC(heroImageName: "thumbs", titleText: "Learn more at www.bankey.com.")
        
        pages.append(page1)
        pages.append(page2)
        pages.append(page3)
        
        currentVC = pages.first!
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        style()
        layout()
    }
    
    private func setup() {
        view.backgroundColor = .systemPink
        
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)
        
        pageViewController.dataSource = self
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        view.topAnchor.constraint(equalTo: pageViewController.view.topAnchor).isActive = true
        view.leadingAnchor.constraint(equalTo: pageViewController.view.leadingAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: pageViewController.view.trailingAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: pageViewController.view.bottomAnchor).isActive = true
        
        pageViewController.setViewControllers([pages.first!], direction: .forward, animated: false, completion: nil)
        currentVC = pages.first!
    }
    
    private func style() {
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.setTitle("Close", for: [])
        closeButton.addTarget(self, action: #selector(buttonTapped), for: .primaryActionTriggered)
        
        view.addSubview(closeButton)
    }
    
    private func layout() {
        closeButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2).isActive = true
        closeButton.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 2).isActive = true
    }
}

extension OnboardContainerVC: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return getPreviousViewController(from: viewController)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return getNextViewController(from: viewController)
    }
    
    private func getPreviousViewController(from viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController), index - 1 >= 0 else { return nil }
        currentVC = pages[index - 1]
        return pages[index - 1]
    }
    
    private func getNextViewController(from viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController), index + 1 < pages.count else { return nil }
        currentVC = pages[index + 1]
        return pages[index + 1]
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return pages.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return pages.firstIndex(of: self.currentVC) ?? 0
    }
}

extension OnboardContainerVC {
    @objc private func buttonTapped(sender: UIButton) {
        print("Close")
    }
}
