//
//  CoreDataManager.swift
//  Navigation
//
//  Created by gleb on 12/08/2023.
//

import Foundation
import UIKit
import CoreData

final class CoreDataManager {

    static let shared = CoreDataManager()
    public var savedPosts = [FavoritesModel]()

    /// Метод сохраняет данные в CoreData в соответствии с моделью.
    public func saveToCoreData(post: PostModel) {

        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            let context = appDelegate.persistentContainer.viewContext

            guard let entityDescription = NSEntityDescription.entity(forEntityName: "FavoritesModel", in: context) else { return }

            let newValue = NSManagedObject(entity: entityDescription, insertInto: context)
            let image = UIImage(named: post.image)
            let imageData = image?.pngData()

            newValue.setValue(imageData, forKey: "image")
            newValue.setValue(post.author, forKey: "author")
            newValue.setValue(post.description, forKey: "descr")
            newValue.setValue(post.likes, forKey: "likes")
            newValue.setValue(post.views, forKey: "views")

            do {
                try context.save()
                self.readFromCoreData()
            } catch {
                print("Post could not be saved")
            }
        }
    }

    /// Метод считывает данные из CoreData. Вызывается при запуске ProfileViewController, чтобы не допустить повторное сохранение постов после перезапуска приложения, а также в методе saveToCoreData с той же целью.
    public func readFromCoreData() {
        savedPosts.removeAll()

        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            let context = appDelegate.persistentContainer.viewContext

            let fetchRequest = NSFetchRequest<FavoritesModel>(entityName: "FavoritesModel")

            do {
                let results = try context.fetch(fetchRequest)
                for result in results {
                    savedPosts.append(result)
                }
            } catch {
                print("Error while reading from Core Data")
            }
        }
    }

    /// Метод удаляет все данные в CoreData. Использовался для теста, выведен в AppDelegate (закомментирован).
    public func removeFromCoreData() {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            let context = appDelegate.persistentContainer.viewContext
            let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "FavoritesModel")
            let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

            do {
                try context.execute(deleteRequest)
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
    }
}
