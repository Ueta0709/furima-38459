FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'aaa000'}
    password_confirmation {password}
    first_name            {'手巣'}
    last_name             {'都'}
    first_name_kana       {'テス'}
    last_name_kana        {'ト'}
    birthday              {'2000-01-01'}
  end
end
