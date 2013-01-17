class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable,:recoverable,
  has_many :topics
  belongs_to :user_select, :class_name => "Topic"
  has_private_messages
  devise :database_authenticatable, :registerable,
        :rememberable, :trackable, :authentication_keys => [:id_key]

  scope :user_student, lambda{|params| where("(username LIKE ? OR id_key LIKE ?) AND user_type != 'lecture'", "#{params}%","#{params}%")}
  scope :user_lecture, lambda{|params| where("(username LIKE ? OR id_key LIKE ?) AND user_type != 'student'", "#{params}%","#{params}%")}
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :id_key, :password, :password_confirmation, :remember_me, :user_type, :address, :username, :birthday, :gender, :department, :religion, :avatar
  validates_uniqueness_of :id_key
  # attr_accessible :title, :body
  def self.import_file(file)
    if file
      spreadsheet = Excel.new(file.path)
      header = spreadsheet.row(1)
      (2..spreadsheet.last_row).each do |i|
        row = Hash[[header, spreadsheet.row(i)].transpose]
        user = find_by_id(row["id"]) || new
        user.attributes = row.to_hash.slice(*accessible_attributes)
        user.save!
      end
    end
  end

  protected

  def email_required?
    true
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(id_key) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end
end
