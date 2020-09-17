class Book < ApplicationRecord
    validates_presence_of :title, :author, :genre, :price, :published_date
    validates_length_of :title, :maximum => 200
    validates_length_of :author, :maximum => 75
    validates_length_of :genre, :maximum => 25
    validates_numericality_of :price, only_integer: false, greater_than_or_equal_to: 0.00, less_than_or_equal_to: 999999999.99

    GENRE = ['Science Fiction', 'Fantasy', 'Mystery', 'Romance', 'Non-fiction']

    validates_inclusion_of :genre, :in => GENRE,
      :message => "must be one of: #{GENRE.join(', ')}"
end
