import UIKit
import AVKit


struct ImageInfo {
    let name: String
    
    // image 이름에 따라 다른 이미지를 화면에 보여
    var image: UIImage? {
        switch name {
        case "dog":
            return UIImage(named: "dog.jpg")
        case "sunset":
            return UIImage(named: "sunset.jpg")
        case "turtle":
            return UIImage(named: "turtle.jpg")
        case "baby":
            return UIImage(named: "baby.jpg")
        case "wave":
            return UIImage(named: "wave.jpg")
        case "rain":
            return UIImage(named: "rain.jpg")
        case "firework":
            return UIImage(named: "firework.jpg")
        case "airplane":
            return UIImage(named: "airplane.jpg")
        default :
            return UIImage(named: "No.jpg")
        }
    }
    
    init (name: String){
        self.name = name
    }
}

class ViewController: UIViewController,
                      UICollectionViewDataSource,
                      UICollectionViewDelegate{
    
    @IBOutlet weak var searchBar: UISearchBar!

    let viewModel = ImageViewModel()
    
    // collectionView를 구현하기 위한 함수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection: Int) -> Int {
        return viewModel.countOfImageList
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSpacing: CGFloat = 10
        let textAreaHeight: CGFloat = 65
        
        let width: CGFloat = (collectionView.bounds.width - itemSpacing)
        let height: CGFloat = width * 10/7 + textAreaHeight
        return CGSize(width: width, height: height)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as?
                Cell else {
            return UICollectionViewCell()
        }
        
        let imageInfo = viewModel.imageInfo(at: indexPath.item)
        cell.update(info: imageInfo)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let imageInfo = viewModel.imageInfo(at: indexPath.item)
        // 해당 이미지 클릭시 이미지에 맞는 영상이 재생된다
        switch imageInfo.name{
            // 외부 영상링크
        case "Firework", "firework":
                let url = NSURL(string: "https://dl.dropboxusercontent.com/s/e38auz050w2mvud/Fileworks.mp4")!
                playVideo(url: url) // 앞에서 얻은 url을 사용하여 비디오를 재생
     
            
        case "baby":
            let filePath:String? = Bundle.main.path(forResource: "movie2", ofType: "MOV")
            if filePath != nil {
                let url = NSURL(fileURLWithPath: filePath!)
                playVideo(url: url) // 앞에서 얻은 url을 사용하여 비디오를 재생
            } else {
                print("nil")
            }

        case "rain":
            let filePath:String? = Bundle.main.path(forResource: "movie3", ofType: "MOV")
            if filePath != nil {
                let url = NSURL(fileURLWithPath: filePath!)
                playVideo(url: url) // 앞에서 얻은 url을 사용하여 비디오를 재생
            } else {
                print("nil")
            }
        case "airplane":
            let filePath:String? = Bundle.main.path(forResource: "movie4", ofType: "MOV")
            if filePath != nil {
                let url = NSURL(fileURLWithPath: filePath!)
                playVideo(url: url) // 앞에서 얻은 url을 사용하여 비디오를 재생
            } else {
                print("nil")
            }
        case "turtle":
            let filePath:String? = Bundle.main.path(forResource: "movie5", ofType: "MOV")
            if filePath != nil {
                let url = NSURL(fileURLWithPath: filePath!)
                playVideo(url: url) // 앞에서 얻은 url을 사용하여 비디오를 재생
            } else {
                print("nil")
            }
        case "dog":
            let filePath:String? = Bundle.main.path(forResource: "movie6", ofType: "MOV")
            if filePath != nil {
                let url = NSURL(fileURLWithPath: filePath!)
                playVideo(url: url) // 앞에서 얻은 url을 사용하여 비디오를 재생
            } else {
                print("nil")
            }
        case "sunset":
            let filePath:String? = Bundle.main.path(forResource: "movie7", ofType: "MOV")
            if filePath != nil {
                let url = NSURL(fileURLWithPath: filePath!)
                playVideo(url: url) // 앞에서 얻은 url을 사용하여 비디오를 재생
            } else {
                print("nil")
            }
        case "wave":
            let filePath:String? = Bundle.main.path(forResource: "movie8", ofType: "MOV")
            if filePath != nil {
                let url = NSURL(fileURLWithPath: filePath!)
                playVideo(url: url) // 앞에서 얻은 url을 사용하여 비디오를 재생
            } else {
                print("nil")
            }
        // 이미지의 값이 이상한 경우 알림창이 뜬다.
        default:
            let dialog = UIAlertController(title: "오류 발생", message: "", preferredStyle: .alert)
            let action = UIAlertAction(title: "확인", style: UIAlertAction.Style.default)

            dialog.addAction(action)
            
            self.present(dialog, animated: true, completion:  nil)
        }
    
    }
    // 비디오를 재생을 위한 함수
    private func playVideo(url: NSURL){
        let playerController = AVPlayerViewController()
        
        let player = AVPlayer(url: url as URL)
        
        playerController.player = player
        
        self.present(playerController, animated: true){
            player.play()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // searchBar에 테두리를 넣고 그 테두리 모서리를 둥글게 만들어줌
        searchBar.layer.borderColor = UIColor.systemPink.cgColor
        searchBar.layer.borderWidth = 3
        searchBar.layer.cornerRadius = 20
       self.searchBar.searchBarStyle = .minimal


    }

}

class Cell: UICollectionViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    func update(info: ImageInfo) {
        imgView.image = info.image
        nameLabel.text = info.name
        imgView.layer.cornerRadius = 50
    }
}


class ImageViewModel {
    let imageInfoList: [ImageInfo] = [
        ImageInfo(name: "rain"),
        ImageInfo(name: "sunset"),
        ImageInfo(name: "turtle"),
        ImageInfo(name: "wave"),
        ImageInfo(name: "baby"),
        ImageInfo(name: "dog"),
        ImageInfo(name: "firework"),
        ImageInfo(name: "airplane"),
        
    ]
    
    var countOfImageList: Int {
        return imageInfoList.count
    }
    
    func imageInfo(at index: Int) -> ImageInfo {
        return imageInfoList[index]
    }
}

extension ViewController: UISearchBarDelegate {
    private func dismissKeyboard() {
        searchBar.resignFirstResponder()
    }
    // search button이 클릭되면 검색을 시작함
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // search를 눌렀을 경우 키보드가 내려간다
        dismissKeyboard()
        
        // 검색어가 있는지 확인 비어있으면 안된다.
        guard let searchTerm = searchBar.text, searchTerm.isEmpty == false
        else{ return }
        
        // 텍스트가 없을 수 있기 때문에 optional로 내려준다
        print("--> 검색결과: \(searchBar.text)")
        // searchBar에 입력된 텍스트를 .text로 추출한다.
        
        // 위의 텍스트 값을 이용해 그에 해당하는 영상을 바로 재생해준다.
        switch searchBar.text{
        case "Firework", "firework":
                let url = NSURL(string: "https://dl.dropboxusercontent.com/s/e38auz050w2mvud/Fileworks.mp4")!
                playVideo(url: url) // 앞에서 얻은 url을 사용하여 비디오를 재생
     
        case "baby", "Baby":
            let filePath:String? = Bundle.main.path(forResource: "movie2", ofType: "MOV")
            if filePath != nil {
                let url = NSURL(fileURLWithPath: filePath!)
                playVideo(url: url) // 앞에서 얻은 url을 사용하여 비디오를 재생
            } else {
                print("nil")
            }

        case "rain", "Rain":
            let filePath:String? = Bundle.main.path(forResource: "movie3", ofType: "MOV")
            if filePath != nil {
                let url = NSURL(fileURLWithPath: filePath!)
                playVideo(url: url) // 앞에서 얻은 url을 사용하여 비디오를 재생
            } else {
                print("nil")
            }
        case "airplane", "Airplane":
            let filePath:String? = Bundle.main.path(forResource: "movie4", ofType: "MOV")
            if filePath != nil {
                let url = NSURL(fileURLWithPath: filePath!)
                playVideo(url: url) // 앞에서 얻은 url을 사용하여 비디오를 재생
            } else {
                print("nil")
            }
        case "turtle", "Turtle":
            let filePath:String? = Bundle.main.path(forResource: "movie5", ofType: "MOV")
            if filePath != nil {
                let url = NSURL(fileURLWithPath: filePath!)
                playVideo(url: url) // 앞에서 얻은 url을 사용하여 비디오를 재생
            } else {
                print("nil")
            }
        case "dog", "Dog":
            let filePath:String? = Bundle.main.path(forResource: "movie6", ofType: "MOV")
            if filePath != nil {
                let url = NSURL(fileURLWithPath: filePath!)
                playVideo(url: url) // 앞에서 얻은 url을 사용하여 비디오를 재생
            } else {
                print("nil")
            }
        case "sunset", "Sunset":
            let filePath:String? = Bundle.main.path(forResource: "movie7", ofType: "MOV")
            if filePath != nil {
                let url = NSURL(fileURLWithPath: filePath!)
                playVideo(url: url) // 앞에서 얻은 url을 사용하여 비디오를 재생
            } else {
                print("nil")
            }
        case "wave", "Wave":
            let filePath:String? = Bundle.main.path(forResource: "movie8", ofType: "MOV")
            if filePath != nil {
                let url = NSURL(fileURLWithPath: filePath!)
                playVideo(url: url) // 앞에서 얻은 url을 사용하여 비디오를 재생
            } else {
                print("nil")
            }
            // 만약 이상한 값을 입력할 경우 알림창을 띄운다
        default:
            let dialog = UIAlertController(title: "동영상을 찾을 수 없습니다.", message: "", preferredStyle: .alert)
            let action = UIAlertAction(title: "돌아가기", style: UIAlertAction.Style.default)

            dialog.addAction(action)
            
            self.present(dialog, animated: true, completion:  nil)
        }
    
    }
}


