# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default("")
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string(255)
#  company_id             :integer
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string(255)
#  invitation_token       :string(60)
#  invitation_sent_at     :datetime
#  invitation_accepted_at :datetime
#  invitation_limit       :integer
#  invited_by_id          :integer
#  invited_by_type        :string(255)
#

class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :role_ids, :as => :admin
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  attr_accessible :company_id

  has_many :bookings

  belongs_to :company


  scope :with_invited, lambda { |user| where(:invited_by_id => user.id) }
  scope :with_company, lambda { |user| where(:company_id => user.company_id) }

  after_create :assign_role

  before_create :assign_company

  def assign_role
    return if self.invited_by_id.nil?
    @user = User.find_by_id(self.invited_by_id)

    if @user.has_role? :system
      if self.company.company_type == "provider"
        self.add_role :admin
      else
        self.add_role :agent
      end
    else
      self.add_role :user
    end

  end

  def assign_company
    return if self.invited_by_id.nil?
    @user = User.find_by_id(self.invited_by_id)
    self.company_id = @user.company_id
  end


end
