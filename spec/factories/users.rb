FactoryBot.define do
  gimei = Gimei.name
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    password {"aaa111"}
    password_confirmation {password}
    last_name {gimei.last.kanji}
    first_name {gimei.first.kanji}
    last_name_kana {gimei.last.katakana}
    first_name_kana {gimei.first.katakana}
    birthday {"2000-01-01"}
  end
end
