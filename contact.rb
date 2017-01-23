class Contact

  attr_reader :id
  attr_accessor :first_name, :last_name, :email, :note

  @@contacts = []
  @@id = 1

  # This method should initialize the contact's attributes
  def initialize (first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
    @id = @@id
    @@id += 1
  end


  # This method should call the initializer,
  # store the newly created contact, and then return it
  def self.create (first_name, last_name, email, note)
    new_contact = Contact.new(first_name, last_name, email, note)
    @@contacts << new_contact
    return new_contact
  end

  # This method should return all of the existing contacts
  def self.all  #works
    @@contacts.each do |contact|
    puts "#{contact.first_name} #{contact.last_name}"
    end
  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find(contact_id)   #works
      @@contacts.each do |contact|
        if contact_id == contact.id
          puts "#{contact.first_name} #{contact.last_name}"
        #else
        #  puts "Contact id #{contact_id} not found"
        end
      end
  end

  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def self.update(contact_id, attr_name, new_value)
    @@contacts.each do |contact|
      if contact_id == contact.id
        @@contacts = @@contacts[attr_name] = new_value
        #index_value = @@contacts.index(attr_name)
        #@@contacts = @@contacts[index_value] = new_value  #not working :(
      end
    end
  end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by(attr_name, attr_value)     #works
    @@contacts.each do |contact|
      if attr_name == "first_name" && contact.first_name == attr_value
        #contact.[attr_name] == attr_value      #not working
        puts "#{contact.first_name} #{contact.last_name}"
      elsif
        attr_name == "last_name" && contact.last_name == attr_value
        puts "#{contact.first_name} #{contact.last_name}"
      elsif
        attr_name == "email" && contact.email == attr_value
        puts "#{contact.first_name} #{contact.last_name}"
      elsif
        attr_name == "note" && contact.note == attr_value
        puts "#{contact.first_name} #{contact.last_name}"
      end
    end
  end

  # This method should delete all of the contacts
  def self.delete_all   #works
    @@contacts = []
  end

  def self.full_name(name) #added self - works
    @@contacts.each do |contact|   #works
      if name == contact.first_name
        puts "#{contact.first_name} #{contact.last_name}"
      end
    end
  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def self.delete (name) #added self   works.
    @@contacts.delete_if {|contact| contact.first_name == name}
  end

  # Feel free to add other methods here, if you need them.

end
