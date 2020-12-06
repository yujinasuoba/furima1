class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :description
    validates :category_id
    validates :condition_id
    validates :shipping_fee_id
    validates :shipping_from_id
    validates :shipping_start_id
    validates :image

    with_options numericality: {
      only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
      message: 'Input from 300 to 9999999'
    } do
      validates :price
    end
  end

  belongs_to :user, foreign_key: 'user_id'
  has_one_attached :image

  # with_options presence:true do
  #     with_options format: {with: /\A[0-9]+\z/, message: "Half-width number"} do
  #     with_options numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "Out of setting range" } do
  #       validates :price
  #     end
  #   end
  # end

  # validates :name,              presence: true
  # validates :description,       presence: true
  # validates :price,             presence: true, format: {with: /\A[0-9]+\z/, message: "Half-width number"}, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "Out of setting range" }
  # validates :category_id,       presence: true
  # validates :condition_id,      presence: true
  # validates :shipping_fee_id,   presence: true
  # validates :shipping_from_id,  presence: true
  # validates :shipping_start_id, presence: true
  # validates :image,             presence: true
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  with_options numericality: { other_than: 1, message: 'Select' } do
    validates :category_id
    validates :condition_id
    validates :shipping_fee_id
    validates :shipping_from_id
    validates :shipping_start_id
  end

  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :shipping_from
  belongs_to :shipping_start

  # validates :category_id, numericality: { other_than: 1, message: "Select" }
  # validates :condition_id, numericality: { other_than: 1, message: "Select" }
  # validates :shipping_fee_id, numericality: { other_than: 1, message: "Select"}
  # validates :shipping_from_id, numericality: { other_than: 1, message: "Select" }
  # validates :shipping_start_id, numericality: { other_than: 1, message: "Select" }
end
