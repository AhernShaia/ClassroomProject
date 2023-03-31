class User < ApplicationRecord
  before_create :encrypt_password

  validates :password, presence: true, confirmation: true
  validates :email,
            presence: true,
            uniqueness: {
              message: "already exists"
            },
            format: {
              with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i,
              message: "only email letters"
            }

  private

  class << self
    def gender_list
      [["不公開", 0], ["男", 1], ["女", 2], ["其它", 3]]
    end

    def login(email:, password:)
      encrypted_password = Digest::SHA1.hexdigest("7a#{password}9x")
      find_by(email: email, password: encrypted_password)
    end
  end
end
