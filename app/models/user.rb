class User < ApplicationRecord
  validates :password, presence: true, confirmation: true
  validates :birthday, presence: true
  validates :email,
            presence: true,
            uniqueness: {
              message: "already exists"
            },
            format: {
              with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i,
              message: "only email letters"
            }

  def self.gender_list
    [["不公開", 0], ["男", 1], ["女", 2], ["其他", 3]]
  end
end
