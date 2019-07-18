# frozen_string_literal: true

class Like < ApplicationRecord
  belongs_to :user
  belongs_to :subject, polymorphic: true

  enum kind: %i[thumbs heart clap laugh suprise angry]

  validates :user, :subject, :kind, presence: true
end
