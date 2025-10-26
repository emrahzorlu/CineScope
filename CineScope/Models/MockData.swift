//
//  MockData.swift
//  CineScope
//
//  Created by Emrah Zorlu on 26.10.2025.
//

import Foundation

struct MockData {
  
  // MARK: - Single Movies
  static let sampleMovie1 = Movie(
    id: 533535,
    title: "Deadpool & Wolverine",
    overview: "Wade Wilson, ahlaki açıdan esnek paralı asker Deadpool kimliğini geride bırakarak sıradan bir hayat sürer. Ancak dünyası varoluşsal bir tehdit altında kalınca, Wade isteksizce tekrar kostümünü giymek zorunda kalır ve daha da isteksiz olan Wolverine ile takım kurar.",
    posterPath: "/8cdWjvZQUExUUTzyp4t6EDMubfO.jpg",
    backdropPath: "/yDHYTfA3R0jFYba16jBB1ef8oIt.jpg",
    voteAverage: 7.8,
    releaseDate: "2024-07-24",
    genreIds: [28, 35, 878]
  )
  
  static let sampleMovie2 = Movie(
    id: 912649,
    title: "Venom: Son Dans",
    overview: "Eddie ve Venom kaçak durumdadır. Her iki dünyaları tarafından avlanan ve ağ daraldıkça, ikili Venom ve Eddie'nin son dansına perde indirecek yıkıcı bir karar almak zorunda kalırlar.",
    posterPath: "/aosm8NMQ3UyoBVpSxyimorCQykC.jpg",
    backdropPath: "/3V4kLQg0kSqPLctI5ziYWabAZYF.jpg",
    voteAverage: 6.8,
    releaseDate: "2024-10-22",
    genreIds: [878, 28, 12]
  )
  
  static let sampleMovie3 = Movie(
    id: 558449,
    title: "Gladyatör II",
    overview: "Saygın kahraman Maximus'un amcası tarafından öldürülmesine tanık olduktan yıllar sonra, Lucius, evi demir yumrukla Roma'yı yöneten zorba İmparatorlar tarafından fethedildikten sonra Kolezyum'a girmeye zorlanır.",
    posterPath: "/2cxhvwyEwRlysAmRH4iodkvo0z5.jpg",
    backdropPath: "/euYIwmwkmz95mnXvufEmbL6ovhZ.jpg",
    voteAverage: 7.2,
    releaseDate: "2024-11-13",
    genreIds: [28, 12, 18]
  )
  
  static let sampleMovie4 = Movie(
    id: 1034062,
    title: "Wicked",
    overview: "Oz Diyarı'nda yanlış anlaşılan genç bir kadın, yeşil teninden dolayı dışlanmıştır. Kötü Cadı olmadan önce, Elphaba popüler, tutkulu, karizmatik ve hırslı Glinda ile tanışır.",
    posterPath: "/xDGbZ0JJ3mYaGKy4Nzd9Kph6M9L.jpg",
    backdropPath: "/3EIYw0FSi82pBwXqJxR7w0nhphT.jpg",
    voteAverage: 7.6,
    releaseDate: "2024-11-20",
    genreIds: [18, 14, 10749]
  )
  
  static let sampleMovie5 = Movie(
    id: 945961,
    title: "Alien: Romulus",
    overview: "Uzak bir dünyada terk edilmiş bir uzay istasyonunda, genç bir grup kolonist yüz yüze gelir ve evrendeki en korkunç yaşam formuyla karşılaşır.",
    posterPath: "/b33nnKl1GSFbao4l3fZDDqsMx0F.jpg",
    backdropPath: "/9SSEUrSqhljBMzRe4aBTh17rUaC.jpg",
    voteAverage: 7.3,
    releaseDate: "2024-08-13",
    genreIds: [27, 878, 53]
  )
  
  static let sampleMovie6 = Movie(
    id: 1184918,
    title: "The Wild Robot",
    overview: "Robot Roz, bir ada kıyısına vurur ve yaşamını tehdit eden çevresiyle hayatta kalmayı öğrenmesi gerekir. Zamanla adanın hayvanlarıyla ilişkiler kurar ve yetim bir kaz yavrususu evlat edinir.",
    posterPath: "/wTnV3PCVW5O92JMrFvvrRcV39RU.jpg",
    backdropPath: "/4zlOPT9CrtIX05bBIkYxNZsm5zN.jpg",
    voteAverage: 8.5,
    releaseDate: "2024-09-12",
    genreIds: [16, 878, 10751]
  )
  
  // MARK: - Movie Arrays
  static let trendingMovies = [
    sampleMovie1,
    sampleMovie2,
    sampleMovie3,
    sampleMovie4,
    sampleMovie5,
    sampleMovie6,
    sampleMovie1,
    sampleMovie2
  ]
  
  static let popularMovies = [
    sampleMovie6,
    sampleMovie4,
    sampleMovie2,
    sampleMovie5,
    sampleMovie1,
    sampleMovie3,
    sampleMovie4,
    sampleMovie6
  ]
  
  static let nowPlayingMovies = [
    sampleMovie2,
    sampleMovie3,
    sampleMovie5,
    sampleMovie1,
    sampleMovie4,
    sampleMovie6,
    sampleMovie2,
    sampleMovie3
  ]
  
  static let topRatedMovies = [
    sampleMovie6,
    sampleMovie1,
    sampleMovie4,
    sampleMovie3,
    sampleMovie5,
    sampleMovie2,
    sampleMovie6,
    sampleMovie4
  ]
  
  // MARK: - Genres
  static let sampleGenres = [
    Genre(id: 28, name: "Aksiyon"),
    Genre(id: 35, name: "Komedi"),
    Genre(id: 878, name: "Bilim Kurgu")
  ]
  
  // MARK: - Movie Detail
  static let sampleMovieDetail = MovieDetail(
    id: 533535,
    title: "Deadpool & Wolverine",
    overview: "Wade Wilson, ahlaki açıdan esnek paralı asker Deadpool kimliğini geride bırakarak sıradan bir hayat sürer. Ancak dünyası varoluşsal bir tehdit altında kalınca, Wade isteksizce tekrar kostümünü giymek zorunda kalır ve daha da isteksiz olan Wolverine ile takım kurar.",
    posterPath: "/8cdWjvZQUExUUTzyp4t6EDMubfO.jpg",
    backdropPath: "/yDHYTfA3R0jFYba16jBB1ef8oIt.jpg",
    voteAverage: 7.8,
    voteCount: 4521,
    releaseDate: "2024-07-24",
    genres: sampleGenres,
    runtime: 128,
    budget: 200000000,
    revenue: 1338073645,
    tagline: "Bir araya gelin.",
    status: "Released",
    originalLanguage: "en",
    originalTitle: "Deadpool & Wolverine"
  )
  
  // MARK: - Cast & Crew
  static let sampleCast = [
    Cast(
      id: 10859,
      name: "Ryan Reynolds",
      character: "Wade Wilson / Deadpool",
      profilePath: "/2Orm6l3z3zukF1q0AgIOUqvwLeB.jpg",
      order: 0
    ),
    Cast(
      id: 6968,
      name: "Hugh Jackman",
      character: "Logan / Wolverine",
      profilePath: "/4Xujtewxqt6aU0Y81TSu66uV8GF.jpg",
      order: 1
    ),
    Cast(
      id: 1245,
      name: "Emma Corrin",
      character: "Cassandra Nova",
      profilePath: "/hCFMGJ4wbLzUddit6JXGevO2Ra9.jpg",
      order: 2
    ),
    Cast(
      id: 17288,
      name: "Matthew Macfadyen",
      character: "Mr. Paradox",
      profilePath: "/2FF3Yjxd7DYR6JHtizezs8W3AzJ.jpg",
      order: 3
    ),
    Cast(
      id: 19274,
      name: "Morena Baccarin",
      character: "Vanessa",
      profilePath: "/kBSKEoLYpUNaQn4bM7jS7vJ92Jh.jpg",
      order: 4
    )
  ]
  
  static let sampleCrew = [
    Crew(
      id: 7232,
      name: "Shawn Levy",
      job: "Director",
      department: "Directing",
      profilePath: "/j7F4CJrF3FEjohFv7BXALpj3ge6.jpg"
    ),
    Crew(
      id: 10859,
      name: "Ryan Reynolds",
      job: "Writer",
      department: "Writing",
      profilePath: "/2Orm6l3z3zukF1q0AgIOUqvwLeB.jpg"
    ),
    Crew(
      id: 7232,
      name: "Shawn Levy",
      job: "Producer",
      department: "Production",
      profilePath: "/j7F4CJrF3FEjohFv7BXALpj3ge6.jpg"
    ),
    Crew(
      id: 10859,
      name: "Ryan Reynolds",
      job: "Producer",
      department: "Production",
      profilePath: "/2Orm6l3z3zukF1q0AgIOUqvwLeB.jpg"
    )
  ]
  
  static let sampleCredits = CreditsResponse(
    id: 533535,
    cast: sampleCast,
    crew: sampleCrew
  )
  
  // MARK: - Videos
  static let sampleVideos = VideoResponse(
    id: 533535,
    results: [
      MovieVideo(
        id: "64f2a3e5c6f8a7001c8b4567",
        key: "73_1biulkYk",
        name: "Official Trailer",
        site: "YouTube",
        type: "Trailer",
        official: true,
        publishedAt: "2024-04-22T13:00:00.000Z"
      ),
      MovieVideo(
        id: "64f2a3e5c6f8a7001c8b4568",
        key: "Idh8n5XuYIA",
        name: "Official Teaser",
        site: "YouTube",
        type: "Teaser",
        official: true,
        publishedAt: "2024-02-11T13:00:00.000Z"
      ),
      MovieVideo(
        id: "64f2a3e5c6f8a7001c8b4569",
        key: "uJMCNJP2ipI",
        name: "Behind the Scenes",
        site: "YouTube",
        type: "Behind the Scenes",
        official: true,
        publishedAt: "2024-07-15T10:00:00.000Z"
      )
    ]
  )
  
  // MARK: - Reviews
  static let sampleReviews = ReviewResponse(
    id: 533535,
    page: 1,
    results: [
      Review(
        id: "66a9c8e2e6f6b8001c8b4567",
        author: "SinemaSevdalisi",
        content: "Deadpool & Wolverine kesinlikle muhteşem bir eğlence! Ryan Reynolds ve Hugh Jackman'ın kimyası inanılmaz ve aksiyon sahneleri birinci sınıf. Mizah keskin ve öz farkındalıklı, bu da onu son yılların en eğlenceli süper kahraman filmlerinden biri yapıyor. Marvel hayranları için mutlaka izlenmeli!",
        createdAt: "2024-07-30T18:45:00.000Z",
        updatedAt: "2024-07-30T18:45:00.000Z",
        url: URL(string: "https://www.themoviedb.org/review/66a9c8e2e6f6b8001c8b4567"),
        authorDetails: AuthorDetails(
          name: "Ahmet Yılmaz",
          username: "SinemaSevdalisi",
          avatarPath: nil,
          rating: 9.0
        )
      ),
      Review(
        id: "66a9c8e2e6f6b8001c8b4568",
        author: "FilmKritik",
        content: "Film aksiyon ve mizah konusunda başarılı olsa da, hikaye zaman zaman biraz aceleye gelmiş. Ancak performanslar harika ve hayran servisi tavan yapıyor. Hugh Jackman'ın Wolverine olarak dönüşü tek başına görmeye değer.",
        createdAt: "2024-08-02T10:30:00.000Z",
        updatedAt: "2024-08-02T10:30:00.000Z",
        url: URL(string: "https://www.themoviedb.org/review/66a9c8e2e6f6b8001c8b4568"),
        authorDetails: AuthorDetails(
          name: nil,
          username: "FilmKritik",
          avatarPath: nil,
          rating: 7.5
        )
      ),
      Review(
        id: "66a9c8e2e6f6b8001c8b4569",
        author: "MCUFani",
        content: "Marvel'ın en iyi filmlerinden biri! Deadpool ve Wolverine'in bir araya gelmesi hayal gibiydi. Aksiyon, komedi ve duygusal anlar mükemmel bir şekilde dengelenmiş. Kesinlikle tekrar izleyeceğim!",
        createdAt: "2024-08-05T14:20:00.000Z",
        updatedAt: "2024-08-05T14:20:00.000Z",
        url: URL(string: "https://www.themoviedb.org/review/66a9c8e2e6f6b8001c8b4569"),
        authorDetails: AuthorDetails(
          name: "Zeynep Demir",
          username: "MCUFani",
          avatarPath: nil,
          rating: 8.5
        )
      )
    ],
    totalPages: 1,
    totalResults: 3
  )
}
