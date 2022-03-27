# frozen_string_literal: true

FactoryBot.define do
  factory :application, class: 'Doorkeeper::Application' do
    sequence(:name) { |n| "Application #{n}" }
    redirect_uri { 'https://app.com/callback' }
    sequence(:uid) { |n| "app#{n}" }
    secret { 'secret' }
  end
end