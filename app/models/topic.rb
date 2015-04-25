class Topic < ActiveRecord::Base
  belongs_to :user
  has_many :bookmarks, dependent: :destroy

default_scope { order('title ASC') }

  validates :title, format: {with: /[a-zA-Z0-9]/,
    message: "only allows letters or numbers" }

  validates :title, uniqueness: { case_sensitive: false }

end
