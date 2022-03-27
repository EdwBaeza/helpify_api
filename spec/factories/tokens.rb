# frozen_string_literal: true

FactoryBot.define do
  factory :token, class: '::Doorkeeper::AccessToken' do
    sequence(:resource_owner_id) { _1 }
    application
    expires_in { 2.hours }
    scopes { 'public' }
  end
end