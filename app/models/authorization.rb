class Authorization < ApplicationRecord
    belongs_to :user, optional: true

    # ensure that a Google account is only associated with one account in your application
    validates_uniqueness_of :uid, scope: [:provider]
end
