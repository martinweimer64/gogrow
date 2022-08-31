class Attachment < ApplicationRecord
  #the model is called Attachment and also has an attach because 
  #I don't want to link a csv file to an user or similar.
  has_one_attached :csv_file
end
