class Club < ActiveRecord::Base
	has_many :inscriptions

  def contains_user_invalide(id)
    return self.inscriptions.where(:id => id).where(:valide => false).count > 0
  end

  def contains_user_valide(id)
    return self.inscriptions.where(:id => id).where(:valide => true).count > 0
  end
end
