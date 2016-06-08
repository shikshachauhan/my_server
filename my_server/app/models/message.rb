class Message < ActiveRecord::Base
  has_one :task, as: :taskable
end
