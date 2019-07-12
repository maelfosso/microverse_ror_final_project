# frozen_string_literal: true

class Like < ApplicationRecord
  belongs_to :user
  belongs_to :subject, polymorphic: true

  enum kind: %i[like love clap laugh suprise angry]

  validates :user, :subject, :kind, presence: true
end
