//
//  ScreenAssembly.swift
//  Navigation
//
//  Created by gleb on 08/06/2023.
//

import UIKit

protocol Assembly: AnyObject {
func createPhoto() -> UIViewController
func createLogin(coordinator: ProfileCoordinator) -> UIViewController
}

final class ScreenAssembly: Assembly {
func createPhoto() -> UIViewController {
    let model = PostImage.setupImages()
    let viewModel = PhotoViewModel(model: model)
    let view = PhotosViewController()

    view.viewModel = viewModel
    return view
}

func createLogin(coordinator: ProfileCoordinator) -> UIViewController {
    let model = MyLoginFactory()
    let viewModel = LoginViewModel(model: model, coordinator: coordinator)
    let view = LogInViewController()
    view.coordinator = coordinator

    view.viewModel = viewModel
    return view
}

func createProfile(user: User, coordinator: ProfileCoordinator) -> UIViewController {
    let cartoons = StorageOfPosts.viewModel
    let viewModel = ProfileViewModel(userfromLogin: user,
                                     cartoons: cartoons)
    let view = ProfileViewController()
    view.coordinator = coordinator

    view.viewModel = viewModel
    return view
}
}
