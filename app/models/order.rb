class Order < ActiveRecord::Base
  has_many :line_items
  belongs_to :user

  validates :count, presence: true, numericality: {greater_than_or_equal_to: 1}

  before_create :set_status

  enum status: [:cart, :sended, :completed]

  def send!(send_params)
    update(send_params.merge(status: :sended))
  end

  private

    def set_status
      self.status = :cart
    end

end