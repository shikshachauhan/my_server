class Task < ActiveRecord::Base
  belongs_to :taskable, polymorphic: true
  STATUS = {
    pending: 0,
    moderated: 1,
    published: 2,
    rejected: 3
  }
end
