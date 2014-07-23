class Account < ActiveRecord::Base

  #
  # return Account if successfully authenticated
  # @param text
  # @param text
  #
  def self.authenticate(email, password)
    return self.find_by_account_email_and_account_password(email, Account.hash(password))

  end
  #
  # return hash text
  # @param text
  #
  def self.hash(text)
    return Digest::MD5.hexdigest(Digest::SHA1.hexdigest(text + self._salt))
  end
  
  #
  # get total Account in a resto
  # return integer
  #
  def self.total_account_for_resto (resto)
    account = self.accounts_filter_by_resto(resto)
    
    return account.length > 0 ? account.length : 0  
  end
  
  #
  # return accounts filter by resto
  # return array of objects
  #
  def self.accounts_filter_by_resto (resto)
    accounts = self.where(account_type: "resto", account_type_id: resto)
    
    return accounts.length > 0 ? accounts : []
  end
  
  #
  # check email exist
  # return boolean
  #
  def self.isEmailExist (email)
    account = self.find_by_account_email (email)
    
    return account != nil ? true : false  
  end
  
  #
  # return generated code
  # @param text
  #
  def self.generateCode (code)
     time = Time.new
     return self.hash(self.hash(code) + time.to_s)
  end
    
  #
  # return paginated collection
  # @param int
  # @param int
  #
  def self.getPaginated(page, per = 20)
    return Account.paginate(page: page, per_page: per).order("account_last")
  end
  
  #
  # return search paginated collection
  # @param text
  # @param int
  # @param int
  #
  def self.search(search, page, per = 20)
    return paginate :per_page => per, :page => page,
      :conditions => ['(account_name LIKE ? OR account_last LIKE ? OR account_first LIKE ? OR account_email LIKE ? OR account_type LIKE ?)', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%"],
      :order => 'account_last ASC'
  end
  
  private
    def self._salt
      return "3982bbcc3610e75d7647660c5cbc0fd8"
    end
end
