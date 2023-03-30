class Resume < ApplicationRecord
  validates :name, :tel, presence: true
  validates :email,
            presence: true,
            format: {
              with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i,
              message: "only email letters"
            }

  def self.seach(keyword)
    where("name like ?", "%#{keyword}%")
  end
end
