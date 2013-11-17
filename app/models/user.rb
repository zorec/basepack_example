class User < ActiveRecord::Base
  has_many :filters, inverse_of: :user  # Include default devise modules. Others available are:
  has_many :created_projects, class_name: "Project", foreign_key: "user_id", inverse_of: :user

  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  def to_label
    labelize do
      email
    end
  end
end
