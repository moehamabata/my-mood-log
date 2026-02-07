class User < ApplicationRecord
  devise :database_athenticatable, :registerable,
         :recoverable, :remenberable, :validatable
end