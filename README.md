# 🎬 CineScope

Modern bir iOS film keşif uygulaması. TMDB API kullanarak güncel film bilgilerini, fragmanları ve detayları sunar.

## ✨ Özellikler

- 🎥 **Film Keşfi**: Trend olan, popüler ve vizyondaki filmler
- 🔍 **Film Detayları**: Oyuncu kadrosu, ekip, benzer filmler ve kullanıcı yorumları
- 🎬 **Fragman Oynatıcı**: YouTube fragmanlarını uygulama içinde izleme
- ⭐ **Favoriler**: Favori filmlerinizi kaydedin
- 🎨 **Modern UI**: SwiftUI ile tasarlanmış, kullanıcı dostu arayüz
- 📱 **Tab Bar Navigation**: Kolay gezinme için tab bar

## 🛠️ Teknolojiler

- **SwiftUI**: Modern UI framework
- **Async/Await**: Modern asenkron programlama
- **MVVM Architecture**: Temiz ve sürdürülebilir kod yapısı
- **Kingfisher**: Görsel yükleme ve cache
- **YouTubePlayerKit**: YouTube video oynatıcı

## 📋 Gereksinimler

- iOS 17.0+
- Xcode 15.0+
- Swift 5.9+

## 🚀 Kurulum

1. Repoyu klonlayın:
```bash
git clone https://github.com/emrahzorlu/CineScope.git
cd CineScope
```

2. TMDB API Key alın:
   - [TMDB](https://www.themoviedb.org/) sitesine kaydolun
   - API key alın

3. API Key'i projeye ekleyin:
   - `CineScope/Services/TMDBService.swift` dosyasını açın
   - `apiKey` değişkenine kendi API key'inizi yazın

4. Xcode'da projeyi açın:
```bash
open CineScope.xcodeproj
```

5. Projeyi çalıştırın (⌘R)

## 📱 Ekran Görüntüleri

*(Ekran görüntüleri eklenecek)*

## 🏗️ Proje Yapısı

```
CineScope/
├── Models/              # Data modelleri
├── Views/              # SwiftUI View'lar
│   ├── Components/     # Yeniden kullanılabilir bileşenler
│   └── ...
├── Modules/            # Feature modülleri
│   ├── Home/          # Ana sayfa
│   ├── MovieDetail/   # Film detay
│   ├── Favorites/     # Favoriler
│   └── Settings/      # Ayarlar
├── Services/          # API servisleri
└── Managers/          # Singleton manager'lar
```

## 🔑 API

Bu proje [The Movie Database (TMDB)](https://www.themoviedb.org/) API kullanmaktadır.

## 📄 Lisans

Bu proje MIT lisansı altında lisanslanmıştır. Detaylar için [LICENSE](LICENSE) dosyasına bakın.

## 👨‍💻 Geliştirici

**Emrah Zorlu**

- GitHub: [@emrahzorlu](https://github.com/emrahzorlu)

## 🙏 Teşekkürler

- [TMDB](https://www.themoviedb.org/) - Film verileri için
- [Kingfisher](https://github.com/onevcat/Kingfisher) - Görsel yükleme
- [YouTubePlayerKit](https://github.com/SvenTiigi/YouTubePlayerKit) - Video oynatıcı

## 📝 Notlar

- Bu uygulama eğitim amaçlıdır
- TMDB API kullanımı için kendi API key'inizi kullanmalısınız
- Tüm film verileri TMDB'ye aittir

---

⭐️ Bu projeyi beğendiyseniz yıldız vermeyi unutmayın!
