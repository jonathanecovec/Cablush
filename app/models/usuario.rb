class Usuario < ActiveRecord::Base
  
  enum role: [:admin, :lojista, :esportista]
  
  has_many :amigos, class_name: 'Amizade'
  has_many :lojas, foreign_key: "responsavel_id"
  has_many :eventos, foreign_key: "responsavel_id"
  has_many :pistas, foreign_key: "responsavel_id"
  
  has_and_belongs_to_many :esportes
  has_and_belongs_to_many :grupos
 
  # Include default devise modules. Others available are:
  #  :timeoutable and :omniauthable
  devise :registerable, :confirmable, :database_authenticatable,  
    :recoverable, :rememberable, :lockable, :trackable, :validatable
 
  # lojista: utilizado no cadastro para identificar um lojista
  attr_accessor :lojista

  after_initialize :set_default_role, :if => :new_record?
  
  before_create :set_uuid
  
  def to_param
    uuid
  end
  
  # send the message now
  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_now
  end
  
  def first_name
    nome.partition(" ").first
  end
  
  private
  
  def set_default_role
    self.role ||= :esportista
  end
  
  def set_uuid
    self.uuid = SecureRandom.uuid
  end
  
end
