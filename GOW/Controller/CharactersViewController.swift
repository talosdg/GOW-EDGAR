//
//  CharactersViewController.swift
//  GOW
//
//  Created by Edgar Vargas on 14/03/25.
//

import UIKit

struct Device2: Hashable{
    let id: UUID = UUID()
    let title: String
    let imageName: String
}
let home2 = [
    Device(title: "Antony", imageName: "Anthonycarminearmored"),
    Device(title: "Anya", imageName: "Anya_Primer_Ministro_render_G5"),
    Device(title: "Augustus", imageName: "Augustus_Cole_infobox"),
    Device(title: "Damon", imageName: "Damon_Baird_infobox"),
    Device(title: "GOW3", imageName: "Gears_of_War_3_Personajes_COG_Dom_V2"),
    Device(title: "Min", imageName: "Min_Blindado_infobox_G5"),
    Device(title: "Marcus", imageName: "Oldmarcusarmored"),
    Device(title: "RAAM", imageName: "RAAM_Infobox"),
]
class CharactersViewController: UIViewController {
    
    
    @IBOutlet weak var charsCollectionView: UICollectionView!
    

    @IBOutlet weak var chTitle: UILabel!
    
    
    lazy var datasource: UICollectionViewDiffableDataSource<Int, Device> = {
        let deviceCell = UICollectionView.CellRegistration<UICollectionViewListCell, Device>{
            cell, indexPath, model in var listContentConfiguration = UIListContentConfiguration.cell()
            listContentConfiguration.text = NSLocalizedString(model.title, comment: "")
            listContentConfiguration.image = UIImage(named: String(model.imageName))
            
            
            // Cambiar el fondo de la celda a negro
                cell.backgroundConfiguration = UIBackgroundConfiguration.clear() // Elimina el fondo predeterminado si es necesario
                cell.contentConfiguration = listContentConfiguration
                
                // Establecer el color de fondo de la celda
                cell.contentView.backgroundColor = .black
            
                listContentConfiguration.textProperties.color = .white
                
                // Aplicar la configuración a la celda
                cell.contentConfiguration = listContentConfiguration

     
        }
        
        let datasource = UICollectionViewDiffableDataSource<Int, Device>(collectionView: charsCollectionView){ collectionView, indexPath, model in
            
            return collectionView.dequeueConfiguredReusableCell(using: deviceCell, for: indexPath, item: model)
        }
        return datasource
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Establecer el layout de la UICollectionView para que las celdas ocupen el 50% del ancho
            if let layout = charsCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                let itemWidth = charsCollectionView.bounds.width * 1 // 50% del ancho de la colección
                layout.itemSize = CGSize(width: itemWidth, height: 110) // Ajustar la altura a la misma proporción
                layout.minimumInteritemSpacing = 10 // Espaciado entre elementos (ajusta según sea necesario)
                layout.minimumLineSpacing = 10 // Espaciado entre filas (ajusta según sea necesario)
            }
        
      
        
        chTitle.setCustomFont(fontName: Constants.fontMenuTitle, size: Constants.fontSizeDefault, textStyle: .title1)
        chTitle.text = NSLocalizedString("menu.option.characters", comment: "")

        var snapshot = datasource.snapshot()
        snapshot.appendSections([0])
        snapshot.appendItems(home2)
        datasource.apply(snapshot)
    }


}
