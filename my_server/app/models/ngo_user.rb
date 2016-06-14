class NgoUser < ActiveRecord::Base
	#attr_accessor :password
	#attr_accessible :ngoname, :username , :password , :password_confirmation,  :salt , :age , :phone, :city, :website, :email, :field
	email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

	validates   :ngoname, :presence => true,
				:length 		   => {:maximum => 50},
				:uniqueness    => {:case_sensitive => false}
	validates	:password,  :presence => true,
				:length 		   => {:within => 6..40}
	#before_save :encrypt_password => :password
	validates	:phone, :presence => true,
				:numericality => { :only_integer => true },
				:uniqueness    => {:case_sensitive => false}
	validates	:city, :presence => true,
				:length 		   => {:maximum => 50} 
	validates	:website, :presence => true,
				:length 		   => {:maximum => 50},
				:uniqueness    => {:case_sensitive => false}
	validates	:email, :presence => true,
				:format		   => {with: email_regex},
				:uniqueness    => {:case_sensitive => false}
	validates	:field,	 :presence => true,
				:length 		   => {:maximum => 50}
	#self.errors.add(:email, "Please type in the correct email address.")
	def has_password?(submitted_password)
		password = encrypt_password(submitted_password)
		puts("here2")
	end

	def self.authenticate(email,submitted_password)
		ngo_user = find_by_email(email)
		puts("here1")
		return nil if ngo_user.nil?
		return ngo_user if ngo_user.has_password?(submitted_password)
	end
	
	private
		def encrypt_password(password)
			self.salt = Digest::SHA2.hexdigest("#{Time.now.utc}---#{password}") if self.new_record?
			self.password = encrypt(password)
		end

		def encrypt(pass)
			Digest::SHA2.hexdigest("#{self.salt}---#{pass}")
		end

end


