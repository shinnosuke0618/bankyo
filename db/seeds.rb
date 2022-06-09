# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
  [
    {email: 'yuma@yuma',  password: '960607', name: 'ユーマ', introduction: 'ボードゲーム初心者です。'},
    {email: 'shoji@shoji',  password: '960419', name: 'しょーじ', introduction: '最近ボードゲーム始めました。'},
    {email: 'ken@ken',  password: '770507', name: 'うっちー', introduction: 'ビールが大好き。'},
    {email: 'aka@aka',  password: '971205', name: 'あかりん', introduction: 'ボードゲーム歴10年'},
    {email: 'saya@saya',  password: '970824', name: 'さーや', introduction: '末っ子。'},
    {email: 'hana@hana',  password: '980214', name: 'ハナ', introduction: 'じっとしてられない。'},
    {email: 'tsuki@tsuki',  password: '981013', name: 'つっきー', introduction: 'I love BTS。'},
  ]
)

Post.create!(
  [
   {title: 'オセロ',  body: 'プレイヤーが交互に盤面へ石を打ち、相手の石を自分の石で挟むことによって自分の石へと換えていくゲーム。', user_id: '1', image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("db/fixtures/othello_s.jpg")), filename: "othello_s.jpg")},
   {title: 'チェス',  body: '白・黒それぞれ6種類16個の駒を使って、敵のキングを追いつめるゲーム。', user_id: '1', image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("db/fixtures/chess_s.jpg")), filename: "chess_s.jpg")},
   {title: '将棋',  body: 'チェスなどと同じく、古代インドのチャトランガが起源', user_id: '2', image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("db/fixtures/shogi_s.jpg")), filename: "shogi_s.jpg")},
   {title: '人生ゲーム',  body: '大富豪を目指せ！！', user_id: '3', image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("db/fixtures/3172082_s.jpg")), filename: "3172082_s.jpg")},
   {title: 'カタン',  body: '言わずと知れた名作', user_id: '4', image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("db/fixtures/katan_s.jpg")), filename: "katan_s.jpg")},
   {title: '人狼シリーズ',  body: 'あなたは生き残ることができるのか？', user_id: '5', image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("db/fixtures/trump_s.jpg")), filename: "trump_s.jpg")},
   {title: '花札',  body: '日本特有のかるたの一種。花かるた、花がるたとも。', user_id: '6', image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("db/fixtures/hanafuda_s.jpg")), filename: "hanafuda_s.jpg")},
  ]
)